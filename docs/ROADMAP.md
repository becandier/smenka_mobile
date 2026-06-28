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
