# Web-поддержка Smenka Mobile — анализ готовности

> Дата: 2026-06-19. Flutter 3.41.2, Dart 3.11. Папка `web/` уже есть (index.html/manifest почти дефолтные).
> Источник: аудит реального использования каждого рискованного плагина в `lib/` (8 параллельных проверок).

## Вердикт

Web реально завести. **Один крупный блокер — карты (Yandex MapKit, нативный, web нет).** Остальное — средние/мелкие правки: conditional imports, `kIsWeb`-гарды, CORS на бэке и продуктовые решения по гео/картам/токенам. Без правок web-таргет **даже не соберётся** (2 файла с `import 'dart:io'`) и **упадёт на старте** (MapKit + Crashlytics без гардов).

| Зона | Web | Сложность | Кто чинит |
|---|---|---|---|
| Карты (Yandex MapKit) | ❌ нет | **высокая** | flutter + продуктовое решение |
| Compile-блокеры (`dart:io`) | ❌ не собирается | низкая | flutter |
| Firebase Crashlytics | ❌ упадёт без гарда | средняя | flutter + ты (Firebase Console) |
| Firebase core/remote_config/analytics | 🟡 нужен web-конфиг | средняя | flutter + ты |
| Геолокация (геопроверка смен) | 🟡 деградирует | средняя | flutter + продуктовое решение |
| CORS (сеть) | 🟡 браузер заблокирует | средняя | **бэкенд** |
| Хранение токенов / безопасность | 🟡 IndexedDB, XSS-риск | высокая (если «правильно») | flutter + бэкенд |
| Роутинг / URL / диплинки | 🟡 хеш-URL, нет PathUrlStrategy | средняя | flutter |
| upgrader / package_info / connectivity | 🟡 no-op/мусор | низкая | flutter |
| index.html / manifest.json | 🟡 дефолтные заглушки | низкая | flutter |
| fl_chart / flutter_svg / shimmer / intl / bloc | ✅ ок | — | — |

---

## 1. Карты — главный блокер 🔴

`yandex_maps_mapkit_lite` — нативный SDK (Android/iOS), web не поддерживает вообще. Вшит в:
- `lib/app/main_app/locator/services/yandex_mapkit.dart` — безусловная инициализация в `MainAppCubit` (упадёт на старте web).
- `lib/widgets/flutter_map_widget.dart` — рендер `YandexMap` (PlatformView, на web невозможен).
- `lib/pages/add_edit_location/` — создание/редактирование гео-зон (`WorkLocation`): карта, камера, радиус через `CircleMapObject`.
- `lib/pages/work_locations/`, `organization_detail/widgets/_org_navigation_section.dart`.

**Варианты:**
1. **MVP (рекоменд.):** на web карту скрыть. Точки — списком, инициализацию MapKit и `FlutterMapWidget` обернуть в `kIsWeb`. Гео-зоны на web нельзя визуально редактировать (или ввод координат вручную). Дёшево, быстро.
2. **Средне:** для web подключить `flutter_map` + OpenStreetMap, абстракция над картой (mobile=Yandex, web=OSM). Полноценная карта, но это новый слой и время.
3. **Дорого:** Yandex JS MapKit через platform-channels для web — высокая сложность, не оправдано.

---

## 2. Compile-блокеры (`dart:io`) 🔴 — без этого web не собирается

- `lib/core/network/dio_errors_interception.dart` — `SocketException`.
- `lib/app/config/remote_config/remote_config_firebase.dart` — `Platform.isIOS`, `File`, `Directory` (iOS-кэш Remote Config).

Решение: conditional imports (`dart:io` ↔ web-стаб) + `kIsWeb`-гард на iOS-специфичный сброс кэша. Низкая сложность, делаю я.

---

## 3. Firebase 🟠

- **Crashlytics не поддерживается на web** — `lib/app/main_app/locator/services/firebase_crashlytics.dart` и хуки в `talker.dart` (`recordFlutterFatalError`/`recordError`) без гардов → нужно обернуть в `if (!kIsWeb)`.
- `web/index.html` **нет Firebase web init** — нужен `firebaseConfig` (core/remote_config/analytics на web работают только с ним).
- **От тебя:** в Firebase Console зарегистрировать **Web-app** → получить web-конфиг (ключи в `firebase_options.dart` web-секция, если уже есть — проверю).

## 4. Геолокация 🟠

`geolocator` на web: `geolocator_web` требует **HTTPS**, явный браузерный permission, нет background, `openAppSettings()`/`openLocationSettings()` не работают. Используется в `ShiftTrackerCubit.startShift` при `geoCheckEnabled` (`lib/core/services/geo_service.dart`). Сама проверка зоны — на бэке, клиент шлёт координаты.

**Продуктовое решение:** на web геопроверку смены сделать опциональной/отключить (показать предупреждение вместо блокирующей ошибки), расширить результат старта смены кейсом «web/гео недоступно».

## 5. CORS — задача бэкенда 🟠

Dio на web упрётся в CORS: браузер заблокирует запросы без `Access-Control-Allow-*`. На бэке `CORS_ORIGINS` сейчас **пустой** (`smenka_back`, `src/app/core/config.py` + `main.py`, middleware включается только если список непустой). Клиентского кода менять не нужно. **Бэкенду:** выставить `CORS_ORIGINS=https://<домен-web>` в `.env.prod`. Оформлю отдельной задачей бэку.

## 6. Безопасность токенов 🟠 (важно для «как сайт»)

`flutter_secure_storage` на web = WebCrypto + **IndexedDB** (не Keychain/Keystore) → JWT доступны JS, уязвимы к XSS. `shared_preferences` = localStorage (открытый текст: тема, invite-код, org UUID).
- **MVP:** добавить CSP в `index.html`, принять риск (как у большинства SPA, хранящих токен в браузере).
- **Правильно:** перевести web на **HttpOnly-cookie сессии + CSRF** на бэке (условный путь mobile vs web в `auth_interceptor.dart`). Это совместная задача с бэком, не нужна для первого запуска.

## 7. Роутинг и диплинки 🟠

- Нет `setUrlStrategy(PathUrlStrategy())` → на web уродливые `#/`-URL. Добавить в `main.dart`.
- Диплинки приглашений/верификации (`DeepLinkService`, `smenka://invite/...`, `https://smenka.app/invite/...`) на web ловятся через `window.location` — нужна обработка query (`?code=`), маршрут verify по ссылке.
- Браузерные «назад/вперёд» заработают корректно только с PathUrlStrategy.

## 8. Мелочи 🟡

- `upgrader` (проверка версии в сторах) — на web бессмысленно, гард `kIsWeb`.
- `package_info_plus` — на web вернёт пусто, нужен fallback версии.
- `connectivity_plus` — на web почти всегда «connected», офлайн-логика деградирует (не критично).
- `web/index.html` / `manifest.json` — дефолтные заглушки («smenka_mobile», «A new Flutter project», hex-плейсхолдеры) → причесать (title, описание, иконки, цвета, PWA).

---

## Что делаю я (Flutter, без участия извне)

Conditional imports `dart:io`; `kIsWeb`-гарды (MapKit, Crashlytics+talker, geo, upgrader, package_info); web-fallback карты (список); `setUrlStrategy`; обработка диплинков на web; CSP + index.html/manifest; абстракция storage. Прогон `flutter run -d chrome`, `make check`.

## Что нужно от тебя

1. **Firebase Console:** зарегистрировать Web-app, дать web-конфиг.
2. **Продуктовые решения:** (а) карта на web — список или полноценная (OSM)? (б) геопроверка смен на web — отключить или опционально? (в) модель авторизации на web — токены в браузере (быстро) или HttpOnly-cookie (безопасно, дольше)?
3. **Хостинг:** куда деплоить web-build (Firebase Hosting / Caddy на VPS), HTTPS-домен.

## Что нужно от бэкенда (отдельная задача)

CORS (`CORS_ORIGINS`). Опционально, если выбран безопасный путь — HttpOnly-cookie сессии + CSRF.

## Грубая оценка

- **MVP «web читает данные, без карты, без геопроверки, токены в браузере»:** ~1–2 дня моей работы + Web-app в Firebase (ты) + CORS (бэк).
- **Полноценный «как сайт» (карта на web, диплинки, secure-auth):** +неделя, нужны решения по карте/токенам и работа бэка.
