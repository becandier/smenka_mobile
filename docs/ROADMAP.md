# Roadmap — Smenka Mobile

Этот файл — источник правды о том, что сделано и что предстоит. Каждый агент обновляет статусы после завершения работы.

Статусы: `[ ]` не начато, `[~]` в работе, `[x]` готово

---

## Фаза 0 — Скелет проекта `[x]`
- [x] Flutter-проект из шаблона (TemplateCMD)
- [x] auto_route навигация
- [x] Dio + interceptors
- [x] Тема (светлая/тёмная) с сохранением выбора
- [x] Локализация (l10n)
- [x] DI (GetIt + Injectable)
- [x] Firebase (Crashlytics, Remote Config)
- [x] Connectivity wrapper
- [x] Debug-страница

---

## Фаза 1 — Дата-слой `[x]`
- [x] Domain-модели: AuthToken, AuthState, RegisterResult, User, Organization, Member, OrgSettings, OrgStats, WorkLocation, Shift, Pause, ShiftStats, PaginatedShifts, JoinResult
- [x] DTO для всех моделей (с `@JsonSerializable(fieldRename: FieldRename.snake)`)
- [x] Маппинги DTO → Domain (extension `.toDomain()`)
- [x] API DataSources: Auth, User, Organization, Location, Shift
- [x] Репозитории: Auth, User, Organization, Location, Shift
- [x] Auth token storage (SharedPreferences)
- [x] AuthStateNotifier (ChangeNotifier)

---

## Фаза 2 — Auth Flow `[x]`
- [x] **Login** — email + пароль, валидация, навигация на регистрацию
- [x] **Register** — email + пароль + имя, валидация
- [x] **Verify Email** — ввод 4-значного кода, таймер повторной отправки (30с cooldown)
- [x] Кубиты: LoginCubit, RegisterCubit (it's LoginCubit with toggle), VerifyCubit
- [x] Интеграция с AuthRepository (login, register, verify, resendCode)
- [x] Guard: редирект на Login если не авторизован (уже есть базовый)
- [x] Обработка ошибок: неверный пароль, email занят, неверный код и т.д.
- [x] Локализация всех текстов
- [x] Роуты в app_router

---

## Фаза 3 — Трекер смены (главный экран) [x]
- [x] **ShiftTracker** — основной экран (Tab 1)
- [x] Состояние "нет активной смены": кнопка "Начать", выбор персональная/организация
- [x] Состояние "смена активна": таймер, статус, кнопки пауза/продолжить/завершить
- [x] Список пауз текущей смены
- [x] Выбор организации перед стартом (если юзер состоит в орг-ях)
- [x] Геопроверка: запрос локации, проверка что в радиусе (если орг с geo_check)
- [x] Кубит: ShiftTrackerCubit
- [x] Интеграция с ShiftRepository (start, pause, resume, finish)
- [x] Интеграция с OrganizationRepository (getAll — для выбора орг)
- [x] Локализация

---

## Фаза 4 — История смен + статистика `[x]`
- [x] **ShiftHistory** — список смен с пагинацией (Tab 2)
- [x] Фильтры: статус (active/paused/finished), дата от-до
- [x] Карточка смены: дата, длительность, статус, организация
- [x] **ShiftDetail** — подробности смены (push-страница)
- [x] **ShiftStats** — статистика: день/неделя/месяц (сегмент на экране истории)
- [x] Кубиты: ShiftHistoryCubit, ShiftDetailCubit, ShiftStatsCubit
- [x] Интеграция с ShiftRepository (getShifts, getStats)
- [x] Локализация

---

## Фаза 5 — Профиль `[x]`
- [x] **Profile** — данные пользователя (Tab 3)
- [x] Отображение: имя, email, телефон, дата регистрации
- [x] Редактирование профиля (name, phone) — модалка (CustomRoute)
- [x] Переключатель темы (ThemeButtonWidget встроен)
- [x] Секция "Мои организации" — список (название + роль), без переходов (Фаза 6)
- [x] Кнопка "Выйти" (logout) с подтверждением
- [x] Кубит: ProfileCubit
- [x] Интеграция с UserRepository (getMe, updateMe), AuthCubit (logout)
- [x] Локализация

---

## Фаза 6 — Организации `[x]`
- [x] Обновить User domain модель — добавить `role` (enum: superAdmin, user)
- [x] Обновить UserDto + маппинг (role приходит из GET /users/me)
- [x] **OrganizationsList** — список организаций пользователя
- [x] Карточки: название, навигация в детали
- [x] **CreateOrganization** — модалка с вводом названия (только для super_admin, скрыта для обычных)
- [x] **JoinOrganization** — модалка с вводом 8-значного инвайт-кода (для всех пользователей)
- [x] **OrganizationDetail** — экран организации (контент по роли)
- [x] Для employee: название, участники, кнопка "Покинуть"
- [x] Для owner: + инвайт-код, ротация кода, удаление организации
- [x] Защита UI по глобальной роли: кнопка "Создать организацию" видна только super_admin
- [x] Кубиты: OrganizationsCubit, OrganizationDetailCubit (создание/присоединение через OrganizationsCubit)
- [x] Интеграция с OrganizationRepository (getAll, create, join, getById, getMembers, rotateInvite, removeMember, delete)
- [x] Локализация
- [x] 4-й таб навигации (Организации), навигация из профиля

---

## Фаза 7 — Управление организацией `[x]`
- [x] **MembersList** — список участников (имя, email, роль, дата)
- [x] Удаление участника (owner/admin)
- [x] Назначение/снятие роли admin у участника (owner/super_admin) — PATCH /organizations/{id}/members/{user_id}/role
- [x] **SuperAdminPanel** — экран super_admin: список ВСЕХ организаций системы (GET /organizations/all)
- [x] Переход из панели в конкретную организацию — управление ролями, участниками, настройками
- [x] **OrgSettings** — настройки организации (owner only)
- [x] Toggle geo_check, auto_finish_hours, max_pause_minutes, max_pauses_per_shift
- [x] **WorkLocations** — список рабочих точек + карта с маркерами и радиусами
- [x] **AddEditLocation** — карта с выбором точки, название, радиус
- [x] **OrgShifts** — смены сотрудников (admin/owner), фильтры, пагинация
- [x] **OrgStats** — статистика организации + per_employee таблица и chart
- [x] Кубиты: MembersCubit, OrgSettingsCubit, LocationsCubit, AddEditLocationCubit, OrgShiftsCubit, OrgStatsCubit, SuperAdminCubit
- [x] Интеграция с OrganizationRepository, LocationRepository
- [x] Локализация

---

## Фаза 8 — Полировка `[x]`
- [x] Пустые состояния (empty states) для всех списков — переиспользуемый `AppEmptyState`
- [x] Pull-to-refresh везде где есть списки (уже было)
- [x] Skeleton/shimmer загрузка — переиспользуемый `AppShimmerLoader`
- [ ] Анимации переходов (отложено)
- [ ] Обработка потери сети (отложено)
- [x] Deep links (инвайт-код) — `smenka://invite/{code}`
- [x] Финальная проверка локализации

---

## Фича — Фото к пунктам чек-листов `[x]` (`../docs/tasks/checklist_photos/mobile.md`)
- [x] Пакеты: `image_picker`, `image`, `flutter_image_compress`, `photo_view`; iOS-права (камера/фото) в `Info.plist`
- [x] Модели/DTO/маппер: `ChecklistItemPhoto`, enum `PhotoRequirement`/`PhotoSource` (snake-маппинг через switch с безопасным дефолтом), новые поля пункта/detail/summary с обратной совместимостью (`satisfied_count` → фолбэк на `completed`, `max_photos_per_item?`, `@Default` на новых полях)
- [x] Repo/DataSource: `addItemPhoto` / `deleteItemPhoto` (`POST`/`DELETE .../items/{id}/photos`, `captured_at` UTC ISO8601)
- [x] `ChecklistFillCubit`: антифрод-флоу `addPhoto` (image_picker → гео через существующий `GeoService` → штамп даты/координат в фоновом изоляте через `compute` → нативное сжатие ~1600px → `POST /files` → привязка), `retryPhoto` (частичный сбой: только привязка / весь флоу / `PHOTO_FILE_INVALID`→заново), `removePhoto`; гонка `SHIFT_FINISHED`→read-only; `emit`-guard на `isClosed`
- [x] UI: `_ItemPhotosSection` (лента превью `StorageImage` + кнопка «Добавить фото» по лимиту/`readOnly` + бейдж «Нужно фото» + черновики загрузки с прогрессом/ретраем), bottom-sheet выбора источника (`CustomRoute`), полноэкранный вьюер `photo_view` (зум/пан/свайп, подпись время/координаты с семантикой camera/gallery, удаление)
- [x] `ChecklistInstanceTile`/деталь: прогресс по `satisfied_count`, бейдж `photos_required_missing`; `organizationId` проброшен во все точки входа; завершённая своя смена → read-only
- [x] Ошибки по `error.code` (`PHOTO_*`, `SHIFT_FINISHED`, `INSTANCE/ITEM_NOT_FOUND`, `FILE_*`); локализация; `make check` зелёный (+9 тестов маппера), 6-линзовое adversarial-ревью с фиксами

---

## Фича — Видимость владельца смены `[x]` (`../docs/tasks/shift_owner_visibility/mobile.md`)
- [x] Модель `Shift` + DTO/маппер: additive nullable-поля `userName` / `userEmail` / `role` / `customRoleName` (плоская строка); персональный `GET /shifts` не затронут
- [x] DataSource/Repository: метод детали `GET /organizations/{org_id}/shifts/{shift_id}`; проброс `?user_id` в список
- [x] **OrgShifts**: карточка показывает автора (`ShiftAuthorBlock`), фолбэк имени, «Бывший сотрудник» при `role==null && custom_role_name==null`; карточка кликабельна → деталь
- [x] **Фильтр по сотруднику** — модалка `EmployeePicker` (CustomRoute) → `?user_id`; отдельный empty-текст `orgShiftsEmptyForEmployee`
- [x] **OrgShiftDetail** (новый экран): шапка автора, инфо (статус/время/`worked` ч:м), паузы (`ShiftPauseList`), блок чек-листов отдельным запросом; ошибки по `error.code` (`SHIFT_NOT_FOUND`/`ORG_NOT_FOUND`/`FORBIDDEN`) + «Назад к списку»
- [x] Чек-листы на детали — read-only (`ChecklistFillRoute(readOnly: true)`); никаких действий над чужой сменой
- [x] `error.code` → локализованный текст (`lib/l10n/error_localization.dart`); `SectionData`/`PaginatedSectionData` несут `errorCode`
- [x] Реюз-виджеты: `ShiftAuthorBlock`, `ChecklistInstanceTile`, `ShiftPauseList`; `MemberRoleBadges` поддерживает `customRoleName`
- [x] Локализация; `make check` зелёный (analyze без ошибок/предупреждений)

---

## Фича — Быстрый старт смены `[x]` (`../docs/tasks/shift_quick_start/mobile.md`)
- [x] `ShiftContextStorage` (shared_preferences): маркер `personal` либо UUID организации
- [x] Предвыбор контекста после init трекера: сохранённый валидный маркер → он; иначе единственная организация → она; иначе «Личная»
- [x] `selectOrganization` персистит выбор; `finishShift` больше не сбрасывает контекст
- [x] Фикс `DropdownButtonFormField`: `ValueKey` для отражения асинхронного предвыбора
- [x] `make check` зелёный

---

## Фича — Фильтры по диапазону дат `[x]` (`../docs/tasks/date_filters/mobile.md`)
- [x] Общий date-range picker: `DateRangePickerPage` (CustomRoute-модалка), результат `DateRangePickerResult` (локальные дни + `fromUtc`/`toUtc` — границы дня), открытые диапазоны, валидация `from <= to`
- [x] Переиспользуемые виджеты: `DateRangeFilterChip` (чип с форматами «01.06 – 09.06» / «с…» / «по…»)
- [x] История смен и орг-смены: чип диапазона, `setDateRange` одним перезапросом (offset=0), empty-текст периода; «мёртвые» `filterDateFrom/To` оживлены
- [x] Статистика (личная и орг): пресет XOR произвольный диапазон, DTO/домен с nullable `period` + `range_from`/`range_to`, подпись применённого окна (`appliedRangeLabel`, открытые границы)
- [x] Ошибки секций и пагинированных списков локализуются по `error.code` (INVALID_DATE_RANGE, MISSING_STATS_RANGE, AMBIGUOUS_STATS_RANGE, INVALID_PERIOD)
- [x] Request-token против устаревших ответов в stats-кубитах; мульти-агентное ревью пройдено; `make check` зелёный

---

## Фича — Ставки и расчёт зарплаты `[x]` (`../docs/tasks/payroll/mobile.md`)
- [x] Домен/инфраструктура: `Rate`/`CurrentRate`/`Payroll`/`MyEarnings`, `PayrollDataSource` + `PayrollRepository` (CRUD ставок, отчёт, my-earnings), DI; деньги только int-копейки (`money_format`)
- [x] `MemberResponse.current_rate` (additive nullable) в `Member`/`MemberDto`; толерантный парсинг `rate_type`
- [x] Секция «Ставка» на `member_detail`: блок текущей ставки, история с бейджем «Действующая», мутации только admin (owner read-only), ленивая загрузка (без 403 для employee)
- [x] Модалка `RateFormPage` (CustomRoute): добавление/исправление, ₽×100 без double, подсветка `RATE_EFFECTIVE_FROM_TAKEN`, исходный instant даты при неизменённой дате
- [x] Экран «Мой заработок» (`org_member`): пресеты `PeriodPreset` (день/неделя/месяц, default месяц) + произвольный период, текущая ставка, бейдж смен без ставки
- [x] Экран «Зарплата» (admin/owner): totals + строки по сотрудникам с «К выплате» и unpaid-подсказкой (plural), переход на деталь участника
- [x] `PeriodPresetSelector` (реюз для payroll-экранов); локализация + коды ошибок; мульти-агентное ревью пройдено; `make check` зелёный

---

## Фича — Усиление безопасности `[x]` (`../docs/tasks/security_hardening/mobile.md`)
- [x] **Secure storage токенов**: `AuthTokenStorage` переведён на `flutter_secure_storage` (Keychain/Keystore) с in-memory кэшем для синхронных геттеров; `init()` вызывается в bootstrap (`MainAppCubit`, фаза 3.5) до Dio и `checkAuthStatus`
- [x] **Миграция сессии**: одноразовый перенос токенов из `SharedPreferences` в secure storage без разлогина; гарантированная очистка плейнтекста из `SharedPreferences` (defense-in-depth)
- [x] **Реакция на 423/429 по `error.code`**: `ACCOUNT_LOCKED` (блок submit на login до правки полей), `RATE_LIMIT_EXCEEDED` (login/resend), `TOO_MANY_CODE_ATTEMPTS` (verify: сообщение + сброс кулдауна → CTA «запросить код заново»); всё через `localizedErrorMessage(code:, fallback:)`
- [x] **Офлайн-устойчивость трекера смены**: сетевая ошибка `start/pause/resume/finish` не «глотается» — `actionErrorCode`, плашка «Нет соединения» + кнопка «Повторить» (`retryLastAction`); активная смена и таймер не теряются; офлайн-баннер по `connectivity_plus`; геопуть start не затронут
- [x] Новый part-виджет `shift_connectivity_bars.dart` (`_OfflineBanner`, `_ShiftActionErrorBar`); новые ключи l10n (`errorAccountLocked`/`errorRateLimitExceeded`/`errorTooManyCodeAttempts`/`commonNoConnection`/`commonRetry`/`shiftOfflineBanner`)
- [x] **Тесты** (новые, было 1 файл): `AuthTokenStorage` (save/clear/has + миграция), `AuthInterceptor` (Bearer/401-ветка/нет цикла на auth), маппинг кодов login/verify, `ShiftTrackerCubit` (сетевые ошибки start/finish + ретрай + смена не теряется + офлайн)
- [x] Мульти-агентное состязательное ревью пройдено; `make check` зелёный (analyze — 0 issues, 26 тестов)

---

## Фича — Выпил owner-режима, карты и тяжёлого org-менеджмента `[x]` (`docs/roles_capabilities_audit.md`)
- [x] **Решение**: app только для сотрудника и **admin (read-only дашборд)**; owner и всё управление — в веб-админке. Разбор ролей и итог — `docs/roles_capabilities_audit.md`, план — `docs/refactor_remove_owner_plan.md`
- [x] **Удалены экраны**: work_locations, add_edit_location (Yandex MapKit), org_settings, roles, checklist_templates(+detail), rate_form, super_admin таб
- [x] **Owner-эксклюзив убран**: инвайт-код, удаление/создание организации (инвайт уезжает в админку — `../docs/tasks/invite_code_admin/`)
- [x] **member_detail → read-only**: убраны мутации системной/кастомной роли, overrides, ставок, удаление участника; members без свайп-удаления
- [x] **Расцеплены глобальные репозитории** `LocationRepository` и `OrganizationRoleRepository` (домен/инфра/локатор); из общих репо (checklist/payroll/organization) убраны write-методы, чтения сохранены
- [x] **Yandex MapKit удалён полностью**: пакет `yandex_maps_mapkit_lite`, maven-репозиторий в `android/build.gradle.kts`, поле `yandexMapsApiKey` — снят главный web-блокер
- [x] Сохранены employee-фичи и геопроверка смены (`org.geoCheckEnabled` из модели Organization); адверсариальное ревью пройдено; `make check` зелёный (analyze 0, 36 тестов)

---

## Фича — Поддержка Web `[x]` (`docs/web_support_analysis.md`)
- [x] **Compile-блокеры `dart:io`** убраны: `dio_errors_interception` (SocketException → DioExceptionType), `remote_config` cache cleaner вынесен за conditional import (`_io`/`_stub`, `dart.library.io`)
- [x] **Crashlytics web-safe**: не инициализируется на web (`if (!kIsWeb)`), `TalkerInitializer.crashlytics` стал nullable + guard `?.` — старт на web не падает
- [x] **URL-strategy**: `usePathUrlStrategy()` на web (URL без `#`) через conditional import `lib/core/web/url_strategy*` (`dart.library.js_interop`)
- [x] **Web-гарды**: `upgrader` пропускается на web; `Geolocator.openAppSettings/openLocationSettings` — no-op на web (геологика не тронута, geolocator поддерживает web)
- [x] **Брендинг**: `web/index.html` + `manifest.json` (Smenka, theme `#4A90D9`); `firebase_options` уже содержит web-конфиг; добавлен `flutter_web_plugins` (sdk)
- [x] **`flutter build web --release` собирается** (Wasm dry-run тоже OK); analyze 0, 36 тестов; mobile-поведение не сломано
- [ ] Вне клиента (см. `../docs/tasks/web_cors/`): **CORS на бэке** (рантайм-блокер), HTTPS-хостинг, secure storage на web = IndexedDB (JWT доступны JS — осознанный риск; «правильно» = httpOnly-cookie на бэке)

## Фича — Привязка рабочей точки к смене `[~]` (`../docs/tasks/shift_work_location/mobile.md`)
- [x] **Data**: модель `WorkLocation {id,name,address}` (org-домен; одна модель и для списка точек, и для вложенного объекта смены); `OrganizationRepository.getWorkLocations(orgId)` → `GET /organizations/{org_id}/locations` (`{items:[...]}`); `require_work_location` в `Organization`; `work_location_id` + вложенный `work_location` в `Shift`; параметр `work_location_id` в старте смены
- [x] **UI**: экран выбора точки `work_location_picker` (модалка `CustomRoute`, паттерн `employee_picker`); селектор точки на idle-экране по матрице `geo_check_enabled × require_work_location` (гео вкл → точку определяет сервер, селектор скрыт; гео выкл + require → обязательный выбор + гейтинг кнопки старта; гео выкл → опционально, пункт «Без точки»); показ точки в активной смене, истории, деталях персон/орг (реюз `WorkLocationLine`)
- [x] Локализация; маппинг `WORK_LOCATION_REQUIRED`/`WORK_LOCATION_NOT_FOUND` по `error.code`; все новые поля nullable/additive (обратная совместимость со старым бэком); 3 новых cubit-теста; мульти-агентное ревью (12 агентов, состязательная верификация) + `make check` зелёный
- [ ] **End-to-end**: бэкенд фичи на момент реализации не задеплоен — мобилка построена против согласованного контракта (`backend.md`); полноценно заработает после деплоя бэка

---

## Фича — Штрафы (fines) `[x]` (`../docs/tasks/fines/mobile.md`, смержено `50c1824`/`474c075`)
- [x] **Data**: новый домен `penalty` (`PenaltyTemplate`/`Penalty`/`MyPenalty` + `CreatePenaltyInput`/`UpdatePenaltyInput`), инфра `penalty` (DTO+mappers+`PenaltyDataSource`+`PenaltyRepositoryImpl`, 10 методов: шаблоны, CRUD штрафов, my-penalties); деньги — `int` копейки; `member_id = OrganizationMember.id`
- [x] **Payroll/my-earnings additive**: поля `penalty_amount_minor`/`penalties_count`/`net_amount_minor` (домен+DTO `@Default(0)`), query `include_penalties` (только payroll); `net` может быть отрицательным (не обрезается)
- [x] **State**: `MyPenaltiesCubit`/`MemberPenaltiesCubit` (offset-пагинация), `PenaltyFormCubit` (шаблоны+submit), `ShiftPickerCubit`; `PayrollCubit.setIncludePenalties`
- [x] **UI**: экран «Мои штрафы» (employee); секция «Штрафы» + модалка «Назначить/Исправить» (источник шаблон/кастом, выбор смены, дата одним днём, клиентская валидация) + пикер смены на `member_detail`; «Оштрафовать» на `OrgShiftDetail` (резолв member по `user_id` смены); тумблер + колонки/итоги «Штраф»/«К выплате» на `PayrollPage`; net-блок + ссылка «Мои штрафы» на `MyEarnings`
- [x] **DI** `PenaltyRepository` через `RepositoryProvider` (готовый Dio); роуты `MyPenaltiesRoute` + `CustomRoute` `PenaltyFormRoute`/`ShiftPickerRoute`; l10n; коды `PENALTY_NOT_FOUND`/`PENALTY_TEMPLATE_NOT_FOUND` по `error.code`
- [x] **⚠️ Первое пишущее действие мобильного admin/owner над сотрудником** (назначить/исправить/снять штраф) — исключение из read-only мобильного admin, одобрено заказчиком
- [x] `flutter analyze` чисто, `flutter build web` зелёная, 51+8 тестов (маппер penalty); адверсариальное ревью — одиночный проход (параллельные агенты упали по лимиту сессии), найдена+исправлена CRITICAL: пропущенный импорт `Penalty` в `app_router.dart` (скрыт исключением `.gr.dart` из analyze)
- [ ] **End-to-end**: заработает после деплоя бэка (бэк смержен в `main`, но прод-сервера пока нет)

---

## Фича — Web: прод-готовая сборка для деплоя `[x]` (`../docs/tasks/flutter_web_release/mobile.md`)
- [x] **RC-fallback (главный блокер)**: `setDefaults` (`ENDPOINT_PROD=https://api.smenka.pro` хост-only, dio добавляет `/api/v1`; `ENDPOINT_DEV`/`PRIVACY_POLICY`/`MIN_VERSION=0.0.0`/`TECH_WORK=false`) **до** `fetchAndActivate`; широкий `catch` (на web реджекты RC — не `FirebaseException`); `init()` в `timeout(8s)` + `.catchError` — старт не блокируется и сервис всегда регистрируется; бэкстоп `AppConfigException` → экран ошибки конфигурации (не белый). На web без кэша RC приложение стартует на дефолтах и ходит в прод-API.
- [x] **Гео на web**: `getCurrentPosition` целиком в try/catch; отказ → `GeoDenied`→локализованное сообщение; непредвиденная ошибка → `GeoError(code: GEO_UNAVAILABLE)` → `error_localization` → понятный текст, без краша. Геопроверка `geoCheckEnabled` работает как на нативе.
- [x] **Токены на web** (verify-only): `flutter_secure_storage` через IndexedDB, `init()` web-safe (try/catch), рефреш/разлогин корректны — правок не потребовалось.
- [x] **CSP-meta** в `index.html` (self+API+Firebase/Google+объектное хранилище; `wasm-unsafe-eval` для CanvasKit); сборка с `--csp` (dart2js без eval).
- [x] **Воспроизводимая сборка**: `Dockerfile` (multi-stage `cirruslabs/flutter:3.41.2`→`nginx:1.27` SPA-fallback `nginx.conf`), `make build-web`/`docker-web`, CI `release-web.yml`→`ghcr.io/becandier/smenka_web` + `ci.yml` (analyze+test на PR). `firebase_options.dart` закоммичен (web-конфиг не секрет; нужен CI).
- [x] `make check` зелёный (analyze 0, 71 тест); адверсариальное мульти-агентное ревью (5 измерений + верификация) — найдено и исправлено 3 блокера (RC `on FirebaseException` не ловит web-реджекты; CSP без `--csp`/`unsafe-eval` → белый экран; `firebase_options.dart` в `.gitignore` ломал CI) + 2 major (CSP-хост хранилища; nginx gzip для `.js`).
- [ ] **Деплой**: образ собирается в CI; поднятие сервиса `web` в compose/Caddy и DNS `app.smenka.pro` — DevOps корня (VPS пока нет).

---

## Фича — OAuth-вход (Google/Apple) `[~]` (`../docs/tasks/oauth_login/mobile.md`)
- [x] **Data**: `OAuthConfig{google?, apple?}`/`OAuthProviderConfig{clientId, enabled}` (домен+DTO+маппер); `AuthRepository`/`AuthRepositoryImpl` — `getOAuthConfig`, `loginWithGoogle`, `loginWithApple` поверх общего `_authenticateAndPersist()` (рефакторинг, тот же паттерн что у `login`/`verify`); `AuthDataSource` — `GET /auth/oauth/config?client_type=`, `POST /auth/oauth/google`, `POST /auth/oauth/apple`
- [x] **LoginCubit**: `google_sign_in ^7.2.0`/`sign_in_with_apple ^8.1.0` напрямую (без Service-слоя); фоновая `_loadOAuthConfig()` (iOS — один запрос `client_type=ios`, google+apple; Android — один запрос `client_type=android`, только Google); `signInWithGoogle`/`signInWithApple` (Apple — iOS-only, guard `!_isIOS`); `LoginResult.cancelled`; ошибки SDK → синтетический `OAUTH_CLIENT_ERROR`
- [x] **Продуктовое решение 2026-07-02**: Apple Sign-In на Android не показываем (только Google) — убран браузерный Apple-флоу с Android целиком (`WebAuthenticationOptions`, `client_type=web`-запрос, `AndroidManifest`-activity, зависимость от несуществующего backend-redirect-эндпоинта)
- [x] **Технический нюанс**: `serverClientId` (Google, Android) берётся из ответа `getOAuthConfig`, а не зашивается в приложение — требование `google_sign_in` v7 (аудиенс `id_token` всегда Web-клиент)
- [x] **Устойчивость**: `isClosed`-guard перед `emit()` в OAuth-завершающих хелперах (гонка при размонтировании страницы), guard `state.isLoading` от повторного тапа кнопки, `requestFilter`/`responseFilter`/`errorFilter` в `TalkerDioLoggerSettings` — тела `/auth/*` не логируются (id_token/identity_token/пароль/токены)
- [x] **UI**: `LoginPage` — кнопки «Продолжить с Google/Apple» под формой (видны только при `googleEnabled`/`appleEnabled`), разделитель «или»; `AppButton` — опц. `icon`; ассет `assets/google_logo.svg`
- [x] Локализация новых кодов (`INVALID_OAUTH_TOKEN`, `OAUTH_EMAIL_NOT_VERIFIED`, `OAUTH_PROVIDER_UNAVAILABLE`, `OAUTH_CLIENT_ERROR`); платформенные заготовки — iOS (`Info.plist` TODO под `GIDClientID`/`REVERSED_CLIENT_ID`, `Runner.entitlements` + `applesignin`)
- [x] Тесты: `LoginCubit` OAuth-конфиг (7 тестов: Android только Google + Apple no-op, iOS оба провайдера, провайдер выключен, ошибка запроса не ломает форму, неподдерживаемая платформа, защита от повторного тапа); `make check` зелёный, 77/77 тестов; мультиагентное ревью (5 измерений + верификация) нашло и исправлено 4 бага
- [ ] **End-to-end (iOS)**: код и клиентская конфигурация готовы, но полный e2e не доступен до внешних шагов — реальные `REVERSED_CLIENT_ID`/`GIDClientID`/Apple-провижининг из консолей, уточнение в `admin.md` про Web Client ID для `(google, android)` (детали — `../docs/tasks/oauth_login/STATUS.md`, «Открытые вопросы к аналитику»)
- [x] **Web-расширение (2026-07-06)**: `_isOAuthSupportedPlatform` включает `kIsWeb` (изначально было явно исключено — владелец обнаружил вживую на `app.smenka.space`, scope расширен). Google на web — GIS `renderButton()`/`authenticationEvents` вместо `authenticate()` (недоступен на web, бросает `UnsupportedError`); Apple на web — `WebAuthenticationOptions(redirectUri: Uri.base.origin)` + `state`-CSRF-проверка (как в admin-треке). `google_sign_in_web` добавлен явной зависимостью (используется напрямую). `web/index.html` — Apple JS SDK script tag + расширенная CSP (`accounts.google.com`/`appleid.cdn-apple.com`/`appleid.apple.com`)
- [ ] **Тесты web-веток**: `kIsWeb`-условия физически недостижимы под VM-раннером `flutter test` (нужен `--platform chrome`, не настроен) — верификация вручную в браузере после деплоя

---

## Фича — Чек-листы на рабочих точках (checklist_work_location) `[x]` (`../docs/tasks/checklist_work_location/mobile.md`, смержено `063efea`)
- [x] **Data (аддитивно)**: `EffectiveChecklistTemplate`/`EffectiveChecklistTemplateDto` — новое поле `locationIds` (`@Default(<String>[])`); отсутствие `location_ids` в ответе старого бэка → пустой список, парсинг не падает (тесты на оба случая)
- [x] **UI**: `member_detail` → `_EffectiveSection`/`_EffectiveRow` показывают охват чек-листа точками — пусто → «На всех точках», иначе названия (первые 2 + «+N»); id без резолва в имя (точки ещё не загрузились) → нейтральный текст без перечисления
- [x] **Названия точек не потребовали нового источника**: `MemberDetailCubit` уже держит `OrganizationRepository` (для viewer role) — переиспользован существующий `getWorkLocations(orgId)`, один запрос на экран, не на чек-лист
- [x] **Экран смены — без изменений**: явно проверены все 4 точки показа экземпляров чек-листов (`ShiftChecklistsPage`, `_OrgShiftDetailChecklists`, `_ShiftChecklistsTile`, `_DetailChecklistsSection`) — все уже корректно обрабатывают пустой/уменьшённый список (empty-state или `SizedBox.shrink()`), регрессии нет
- [x] `flutter analyze` чисто, 134/134 теста (+3 новых на обратную совместимость DTO)
- [ ] **End-to-end**: бэкенд фичи на момент реализации не задеплоен — мобилка построена против согласованного контракта (`backend.md` §5.1); заработает после деплоя бэка

---

## Фича — Графики работы и переработки (work_schedules) `[~]` (`../docs/tasks/work_schedules/mobile.md`)
- [x] **Data (аддитивно)**: `Shift`/`ShiftDto` — `workScheduleId`/`scheduleName`/`scheduledStartAt`/`scheduledEndAt`/`lateSeconds`/`finishReason`/`overtime` (все nullable, `null` у персональных смен); `Organization` — `timezone` (`@Default('Europe/Moscow')`); новый домен `work_schedule/` (`WorkSchedule`, `MySchedules`, `WorkScheduleRepository`)
- [x] **Старт смены**: `ShiftTrackerCubit` резолвит эффективный набор графиков по org+точке (`_loadSchedules`) — 0+`requireSchedule` блокирует, 1 подставляется автоматически (не ломает `shift_quick_start`), >1 требует выбора всегда; запоминание по паре org+точка (`WorkScheduleContextStorage`, не в глобальном DI); `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND` → сброс + перезапрос. Модалка выбора `WorkSchedulePickerPage` — без своего cubit (список уже загружен)
- [x] **Активная смена**: строка плана/опоздания под таймером (`_SchedulePlanLine`, нейтральный тон); организация резолвится по `activeShift.organizationId`, не по селектору idle-экрана (важно на холодном старте с уже активной сменой)
- [x] **Завершённая смена**: план/опоздание/причина завершения в `_DetailInfoSection`; заявка на переработку — `_OvertimeSection` + модалка `OvertimeRequestPage`/`OvertimeRequestCubit` (подача/статус/отмена `pending`); `ShiftDetailCubit` расширен ленивой загрузкой организации (только при наличии графика) и владением отменой заявки
- [x] **Личный заработок**: `_PlanVsFactCard` — «По графику»/«Разница» (мягкие формулировки) + согласованная переработка; скрыта, если график не используется (план==факт)
- [x] **Таймзона организации**: `core/utils/org_timezone.dart` на пакете `timezone` (dart-lang, `data/latest_10y.dart`) — не рукописная таблица офсетов (была бы неверна при DST); фолбэк на UTC при незнакомой зоне
- [x] `flutter analyze` чисто, `flutter test` зелёный (159/159, включая новые группы: выбор графика 10 тестов, `ShiftDetailCubit` 5, `OvertimeRequestCubit` 2, `org_timezone` 3), `flutter build web --release` собирается
- [ ] **End-to-end**: бэкенд/админка фичи на момент реализации ещё не задеплоены — мобилка построена против согласованного контракта (`backend.md`); заработает после деплоя бэка

---

## Фича — Центр уведомлений и прохождение тестов (notifications + employee_tests) `[~]` (`../docs/tasks/notifications/mobile.md`, `../docs/tasks/employee_tests/mobile.md`)
- [x] **notifications — Data**: домен `notification/` (`AppNotification`), `NotificationDataSource`/`NotificationRepositoryImpl` (`/notifications`, `/notifications/unread-count`, `POST .../read`, `POST .../read-all`)
- [x] **notifications — глобальный кубит**: `NotificationsCubit` (`lib/shared/notifications/`, по образцу `AuthCubit`) — счётчик непрочитанных в конструкторе (бейдж на всех 4 табах), лента лениво на `NotificationsPage`; `markRead`/`markAllRead` синхронно обновляют и ленту, и бейдж
- [x] **notifications — UI**: `NotificationBellButton` в аппбаре 4 табов (Смена/История/Организации/Профиль); `NotificationsPage` — лента pull-to-refresh + пагинация, «Прочитать все»; переход по тапу — расширяемый маппинг `type → route` (`navigateForNotification`), `test_assigned` → `TestAttemptRoute`, незнакомый тип — no-op (форвард-совместимость)
- [x] **employee_tests — Data**: домен `employee_test/` (`TestAssignment`, `TestAttempt`+снимок вопросов, `TestResult`, `TestSubmitAnswer`); единый `TestDataSource` на `/my/test-assignments*` + `/my/test-attempts*` (по образцу `ChecklistDataSource`), `TestRepositoryImpl`
- [x] **employee_tests — «Мои тесты»**: `MyTestsCubit` (пагинация + фильтр по организации, скрыт при ≤1 организации), точка входа — пункт в хабе организации (`_OrgNavigationSection`, предвыбор `initialOrganizationId`)
- [x] **employee_tests — прохождение**: `TestAttemptCubit` — резолв при входе (резюме открытой попытки / блок «уже сдан»-«лимит исчерпан» / старт новой), защита от гонки `TEST_ATTEMPT_IN_PROGRESS` (один переспрос без риска рекурсии), локальный выбор ответов отдельно от снимка вопросов, `shuffleQuestions` — перемешивание на клиенте; экраны `_FillingView`/`_ResultView`/`_BlockedView`, ошибки строго по `error.code`
- [x] **DI**: `NotificationRepository`/`TestRepository` — фиче-репозитории (`RepositoryProvider(create:)` в `success_app` с готовым `dio`, не в локаторе); кубиты независимы друг от друга — связь только через навигацию
- [x] Локализация новых строк + кодов ошибок (`NOTIFICATION_NOT_FOUND`, `TEST_ATTEMPTS_EXHAUSTED`, `TEST_ALREADY_PASSED`, `TEST_ATTEMPT_ALREADY_SUBMITTED`, `TEST_ATTEMPT_IN_PROGRESS`, `TEST_TEMPLATE_ARCHIVED`, `TEST_ASSIGNMENT_NOT_FOUND`)
- [x] `flutter analyze` чисто, `flutter test` зелёный (202/202, включая новые группы: `notifications_cubit` 3, `notification_mapper`, `my_tests_cubit` 3, `test_attempt_cubit` 14, `test_mapper`), `make gen`/`make loc` прогнаны
- [ ] **Открытые вопросы к аналитику** (не блокируют, обработаны консервативно — см. `docs/ARCHITECTURE.md`): `TestTemplateBrief.shuffleQuestions` и `TestAssignmentAttemptBrief.id`/`status` сделаны аддитивными/nullable — `backend.md` не гарантирует их явно в кратких списках полей
- [ ] **End-to-end**: бэкенд фичи на момент реализации ещё не задеплоен (STATUS: `notifications`/`employee_tests` backend — `todo`) — мобилка построена против согласованного контракта (`backend.md`); заработает после деплоя бэка

---

## Фича — Вход по логину или email (admin_created_accounts) `[~]` (`../docs/tasks/admin_created_accounts/mobile.md`)
- [x] **Вход**: поле «Email» на экране входа переименовано в «Email или логин» только для режима логина (регистрация не изменилась) — обычная текстовая клавиатура, без валидации формата, `trim` перед отправкой; `LoginState.email` → `identifier`, `isFormValid` для входа проверяет непустоту вместо формата email
- [x] **Контракт**: `POST /auth/login` шлёт `{"login": …, "password": …}` вместо `{"email": …}` (`AuthRepository`/`AuthDataSource.login`); `INVALID_CREDENTIALS` → «Неверный логин или пароль» (замаплен в `error_localization.dart`, раньше явного маппинга не было)
- [x] **Web-автозаполнение не тронуто**: autofill-хинты (`username` первым, `email` запасным) и `finishAutofillContext` по успеху/`register→needsVerification` — без изменений; лейбл/клавиатура переключаются по `state.isLogin` без пересборки `AutofillGroup`/полей на каждый символ (`login_autofill_web`/`web_password_update_prompt` не регрессируют)
- [x] **Данные**: `User.email`/`UserDto.email` — nullable (учётка без email); `User.login`, `Member.userLogin` — новые аддитивные поля (заполнены только у админ-созданных учёток). Общий чистый хелпер `resolveContactLabel(email, login)` (`lib/core/utils/contact_label.dart`) + геттеры `User.contactLabel`/`Member.contactLabel`
- [x] **UI**: везде, где раньше безусловно выводился email (`_ProfileHeader`, `_PersonalInfoSection` — лейбл переключается на «Логин», `_MemberTile`, member_detail `_HeaderSection`, `EmployeePickerPage`) — переход на `contactLabel`; общий виджет `ContactLabelText` (`lib/widgets/`) скрывает строку целиком, если показывать нечего (никаких пустых/«—» строк). `ShiftAuthorBlock`/статистика (`Shift.userEmail`, `OrgStats.userEmail`) не тронуты — по `backend.md` эти ответы `user_login` не получают, и виджет уже скрывал пустой email
- [x] `flutter analyze` чисто, `flutter test` зелёный (244/244, включая новые: `login_state_test` 6, `login_cubit_test` (обновлён), `contact_label_test` 5, `user_mapper_test` 3, `member_mapper_test` 4), `flutter build web --no-tree-shake-icons` собирается, `/code-review` + `/simplify` прогнаны
- [ ] **End-to-end**: бэкенд фичи на момент реализации ещё не задеплоен (STATUS: `backend` — `in_progress`) — мобилка построена против согласованного контракта (`backend.md`); шлёт новое поле `login`, поэтому деплоится строго после бэка

---

## Фича — Прозрачность ручных правок и начисления (manual_time_entry) `[~]` (`../docs/tasks/manual_time_entry/mobile.md`)
- [x] **Пометки на смене**: `Shift`/`ShiftDto` — `isManual`/`isEdited` (`@Default(false)`), `manualNote`, `editedAt`, `createdByName`/`editedByName` (только орг-эндпоинты), `isDeleted` (все аддитивные, безопасные дефолты); чип «Добавлена/Изменена администратором» в `_ShiftCard` (история), баннер `_ManualNoticeSection` с комментарием в `shift_detail` — сотрудник только читает, действий (оспорить/подтвердить) нет
- [x] **Уведомления**: `notification_navigation.dart` — новые `case 'shift_manual_changed'` (деталь смены, без перехода при `action == "deleted"`) и `case 'payroll_adjustment_changed'` (экран «Мои начисления»); поиск смены без прямого «по id»-эндпоинта — `findShiftByExactStart` (`core/utils/shift_lookup.dart`) сужает `GET /shifts` точным окном `started_at`; `ShiftDetailRoute`/`MyAdjustmentsRoute` дополнительно на root-уровне для пуша из уведомлений без орг-контекста
- [x] **«Мои начисления»**: новый экран `my_adjustments/` по образцу `my_penalties` (домен/инфра `adjustment/`, `MyAdjustmentsCubit`, offset-пагинация + фильтр периода); сумма со знаком (`+`/`−`), тап по строке со `shiftId` — переход на смену
- [x] **«Мой заработок»**: `MyEarnings`/`MyEarningsDto` — `adjustmentAmountMinor`/`adjustmentsCount` (аддитивно, `@Default(0)`); строка «Начисления и удержания» рядом со штрафами (скрыта при `adjustmentsCount == 0`), «К выплате» — `netAmountMinor` с бэка без пересчёта на клиенте
- [x] **DI**: `AdjustmentRepository` — фиче-репозиторий (`RepositoryProvider(create:)` в `success_app`, готовый `dio`, не в локаторе)
- [x] **Расхождение с ТЗ**: `NotificationOut`/payload `payroll_adjustment_changed` не несёт `organization_id` — клиент резолвит орг сам через `OrganizationRepository.getAll()` (одна организация → прямой переход, несколько → информационная подсказка открыть «Мой заработок» вручную)
- [x] `flutter analyze` чисто, `flutter test` зелёный (262/262, включая новые: `adjustment_mapper_test` 6, `shift_manual_fields_mapper_test` 5, `my_earnings_adjustment_fields_mapper_test` 3, `shift_lookup_test` 4), `flutter build web --release --no-tree-shake-icons` собирается, `/code-review` + `/simplify` прогнаны
- [ ] **End-to-end**: бэкенд смержен в `main` (STATUS: `backend` — `done`, не задеплоен) — мобилка построена против согласованного контракта; заработает после деплоя бэка

---

## Фича — Деталь собственной смены (shift_self_detail) `[x]` (`../docs/tasks/shift_self_detail/mobile.md`)
- [x] **Новый эндпоинт**: `ShiftRepository.getShiftById`/`ShiftDataSource.getShiftById` — `GET /shifts/{shift_id}` (своя смена — персональная и орг, где пользователь сотрудник); чужая/несуществующая/soft-deleted → `404 SHIFT_NOT_FOUND`
- [x] **Костыль убран**: `core/utils/shift_lookup.dart` (`findShiftByExactStart` — поиск смены точным окном `started_at` через `GET /shifts`) удалён вместе с тестом; оба перехода, ранее зависевшие от него, переведены на прямой запрос по id
- [x] **Переход из уведомления** `shift_manual_changed` (`notification_navigation.dart`, `_navigateToShift`) — открывает смену по `payload['shift_id']` напрямую; `started_at` из payload больше не читается, поэтому сдвиг начала смены админом после отправки уведомления переход не ломает
- [x] **Переход из «Мои начисления»** (`my_adjustments/view/my_adjustments_page.dart`, `_MyAdjustmentTile._openShift`) — открывает смену по `adjustment.shiftId` напрямую, без привязки к `occurred_at` начисления (которое админ мог переопределить независимо от `started_at` смены)
- [x] **Недоступная смена**: оба перехода теперь показывают `localizedErrorMessage(code: error.code, fallback: error.message)` вместо общего текста — `SHIFT_NOT_FOUND` маппится в «Смена не найдена» (тот же маппинг, что уже используют `shift_detail`/`org_shift_detail`)
- [x] `flutter analyze` чисто, `flutter test` зелёный (260/260, включая новый `test/data/infrastructure/shift/shift_repository_impl_test.dart`; `shift_lookup_test` удалён), `flutter build web --release --no-tree-shake-icons` собирается, `/code-review` прогнан (1 находка — отсутствие теста нового метода репозитория — устранена)
- [ ] **End-to-end**: бэкенд на ветке `feature/shift-self-detail` на момент реализации мобилки (STATUS: `backend` — `in_progress`) — мобилка построена против согласованного контракта (`backend.md`); заработает после деплоя обоих треков

---

## Фича — Старт смены только в окне графика (schedule_window_enforcement) `[~]` (`../docs/tasks/schedule_window_enforcement/mobile.md`)
- [x] **Прод-баг**: доступность старта раньше зависела только от наличия графика — после авто-финиша смены в конце окна кнопка «Начать смену» оставалась активной со старым списком графиков до перезагрузки экрана; бэк теперь отклоняет старт вне окна (`SCHEDULE_WINDOW_CLOSED`)
- [x] **Данные**: `MySchedules.earlyStartMinutes` (`@Default(0)`, обратная совместимость со старым бэком), `WorkSchedule.isStartableAt`/`earliestStartAt` — правило S1, обе границы окна включительно; `can_start_now` из ответа сознательно не парсится (верен только на момент ответа)
- [x] **`ShiftTrackerCubit`**: idle-тикер (1с, тот же принцип, что и у тикера активной смены) пересчитывает стартуемость, сбрасывает выбор закрывшегося графика, дебаунсит (5с) перезапрос при закрытии ближайшего окна; принудительный перезапрос — после авто-финиша смены, при возврате видимости экрана (`onAppResumed`/возврат на таб «Смена» — `AutoRouteAwareStateMixin`/`didChangeTabRoute`); `SCHEDULE_WINDOW_CLOSED` на старте — сброс выбора + перезапрос (как `SCHEDULE_NOT_AVAILABLE`)
- [x] **UI**: `_WorkScheduleSelector` приглушает нестартуемый график + подпись-причина («Смену можно начать с {time}» / «закончился, ближайший старт завтра в {time}»); `WorkSchedulePickerPage` приглушает и блокирует тап по нестартуемым карточкам, оставляя их видимыми
- [x] `flutter analyze` чисто, `flutter test` зелёный (268/268, включая новую группу «окно графика» в `shift_tracker_cubit_test.dart` через `package:fake_async` и `work_schedule_dto_test.dart` на обратную совместимость), `make gen` прогнан, `/code-review` + `/simplify` прогнаны
- [ ] **End-to-end**: бэкенд фичи на момент реализации мобилки ещё не задеплоен (STATUS: `backend` — см. `STATUS.md`) — мобилка построена против согласованного контракта (`backend.md`); заработает после деплоя бэка

---

## Фича — Промо установки PWA (pwa_install_promo) `[x]` (`../docs/tasks/pwa_install_promo/mobile.md`)
- [x] **Только web, бэкенда нет**: фича полностью клиентская. Весь JS-interop — в одном файле `lib/core/pwa/pwa_install_platform_web.dart` за conditional export (`dart.library.js_interop`, как у `url_strategy`); на native/VM подключается no-op `pwa_install_platform_stub.dart`, поэтому нативные сборки и тесты браузерного кода не видят. Новая прямая зависимость `web: ^1.1.1` — ровно под этот файл
- [x] **Детект**: `display-mode: standalone` + легаси `navigator.standalone` (старые iOS Safari) → в установленном PWA промо и иконка не показываются вовсе; `beforeinstallprompt` перехватывается с `preventDefault` и хранится для отложенного `prompt()`; `appinstalled` скрывает точки входа; iOS/iPadOS определяется по UA (+ `maxTouchPoints` для iPadOS, который маскируется под macOS)
- [x] **Состояние**: глобальный `PwaInstallCubit` (`lib/shared/pwa/`, по образцу `AuthCubit`/`NotificationsCubit`) — независим от других кубитов, знает только `PwaInstallPlatformApi` + `PwaPromoStorage` (SharedPreferences, ключ `pwa_install_promo_shown`; на web это localStorage, отметка привязана к браузеру и переживает перелогин)
- [x] **Разовое промо**: `MainRouterPage` (шелл авторизованной зоны) в post-frame просит кубит `requestFirstRunPromo()`; тот выдерживает 3с (Chromium присылает `beforeinstallprompt` уже после загрузки страницы) и выставляет `promoRequested` → шелл пушит `PwaInstallRoute` (`/install-app`, CustomRoute-модалка). Открытие модалки (авто или вручную) помечает промо показанным — автоматически оно больше не всплывает
- [x] **Модалка по платформам**: Chromium — кнопка «Установить» c нативным `prompt()` (исход не разбираем, просто закрываем) + «Позже»; iOS — пошаговая инструкция «Поделиться → На экран „Домой“»; прочие — универсальная подсказка про меню браузера. Содержимое реактивно: пойманный во время показа `beforeinstallprompt` тут же заменяет инструкцию на кнопку
- [x] **Постоянная точка входа**: `PwaInstallButton` в аппбаре трекера смены; сам схлопывается вне web / в standalone / после `appinstalled`
- [x] **Вне scope (не трогали)**: `web/manifest.json`, иконки, сервис-воркер, аналитика конверсии
- [x] `make gen` + `make loc` прогнаны, `make check` зелёный (290/290, включая новый `test/shared/pwa/pwa_install_cubit_test.dart` — 17 тестов), `flutter build web --release --csp --no-tree-shake-icons` собирается (web-реализация реально попадает в бандл — проверено grep'ом по `main.dart.js`)

---

## Фича — Тарифы и подписки (tariffs) `[~]` (`../docs/tasks/tariffs/mobile.md`)
- [x] **Данные**: additive nullable `Organization.subscription` (`OrganizationSubscription` — `status`/`daysLeft`/`currentPeriodEnd`/`graceEndsAt`, `enum SubscriptionStatus` c `value`/`fromValue`, незнакомый статус → `null` без падения); модель мапит только подмножество backend-контракта `SubscriptionResponse`, нужное баннеру (лимиты/фичи/цена мобилке не нужны — гейтинга фич в мобилке нет)
- [x] **Баннер**: derived-геттер `OrganizationSubscription.banner` → freezed sealed union `SubscriptionBanner` (trialing + `daysLeft ≤ 5` → «Пробный период заканчивается через N дней»; `past_due` → «Период оплачен до … Доступ сохранится до …»; `suspended`/`canceled` → «Организация в режиме только для чтения»; `active` — без баннера). Union несёт данные для текста, поэтому виджет `_SubscriptionBanner` — один исчерпывающий switch без null-веток; некликабельный, с общей подписью «Продлите тариф в веб-кабинете»
- [x] **Отдельного Cubit нет**: состояние подписки приезжает вместе с организацией. Размещение — на `OrganizationDetailPage`, а не на главном табе «Смена»: бэк заполняет `subscription` только в `GET /organizations/{org_id}` (единичный fetch), список организаций (питает главный таб) поле никогда не содержит — иначе потребовался бы новый сетевой вызов, что противоречило бы самому ТЗ
- [x] **Ошибки**: `SUBSCRIPTION_INACTIVE`/`PLAN_LIMIT_REACHED`/`PLAN_FEATURE_UNAVAILABLE` в `error_localization.dart`, тексты без слов «оплата»/«тариф»/«долг» там, где виден employee; кнопки завершения/паузы уже начатой смены не блокировались и не трогались (бэк их не гейтит)
- [x] **Находка вне ТЗ**: `join_by_invite` проверяет активность подписки раньше лимита мест — экран приглашения (`invite_links`) может получить и `SUBSCRIPTION_INACTIVE`, не только `PLAN_LIMIT_REACHED`; оба раньше проваливались в общий бакет «сеть/неизвестно» с неверной иконкой и текстом — заведены отдельные финальные состояния `InviteErrorKind.planLimitReached`/`subscriptionInactive`
- [x] `make check` зелёный (367/367), `make gen` + `make loc` прогнаны, `/code-review` + `/simplify` прогнаны
- [ ] **Мерж в `main`** — за аналитиком (корень)
