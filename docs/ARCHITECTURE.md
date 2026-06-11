# Архитектура — текущее состояние

Последнее обновление: 2026-06-11 (фичи date_filters, payroll, shift_quick_start, security_hardening)

---

## Стек

- Flutter 3.41 / Dart 3.11 — глобальный SDK (FVM убран; пакеты подняты до актуальных мажоров)
- auto_route (навигация)
- flutter_bloc / Cubit (state management)
- freezed + json_serializable (модели)
- Dio (HTTP)
- GetIt + Injectable (DI)
- SharedPreferences (локальное хранение нечувствительных данных: тема, контекст смены)
- flutter_secure_storage (токены `access`/`refresh` — Keychain/Keystore)
- connectivity_plus (индикация офлайна)
- Firebase (Crashlytics, Remote Config)

---

## Структура проекта

```
lib/
├── app/
│   ├── config/                    # Конфигурация приложения
│   ├── main_app/
│   │   ├── cubit/                 # MainAppCubit (инициализация)
│   │   ├── locator/               # DI-регистрация (GetIt)
│   │   │   ├── repositories/      # Регистрация репозиториев
│   │   │   └── services/          # Регистрация сервисов (Dio, Firebase и т.д.)
│   │   ├── view/                  # App + SuccessApp
│   │   └── widgets/               # Connectivity/TechWork wrappers
│   └── main.dart
├── core/
│   ├── bloc/                      # SectionData, PaginatedSectionData, PaginationMixin
│   ├── models/                    # DefaultPaginator<T>
│   ├── network/                   # Dio errors, Task, TaskHandler
│   ├── router/                    # AppRouter, AppModals (context.modals)
│   └── theme/                     # Тема, цвета
├── data/
│   ├── api/local/                 # Локальное хранение (tokens, theme)
│   ├── domain/                    # Domain-слой (абстрактные репо + модели)
│   │   ├── auth/                  # AuthToken, AuthState, RegisterResult
│   │   ├── user/                  # User
│   │   ├── organization/          # Organization, Member, OrgSettings, OrgStats, JoinResult
│   │   ├── location/              # WorkLocation
│   │   └── shift/                 # Shift, Pause, ShiftStats, DefaultPaginator<T>
│   └── infrastructure/            # Реализации (datasource + dto + mappers + repos)
│       ├── auth/
│       ├── user/
│       ├── organization/
│       ├── location/
│       └── shift/
├── l10n/                          # Локализация (ARB)
├── widgets/                       # Переиспользуемые виджеты
│   ├── app_toast/                 # Toast-уведомления (AppToast, AppToastManager)
│   ├── section_data/              # SectionDataWrapper, SectionLoader, SectionError
│   └── paginated_section_data/    # PaginatedSectionDataList/Grid/SliverList/SliverGrid
└── pages/                         # UI-слой (экраны)
    ├── auth/                      # Login/Register + PasswordRequirements
    ├── home/                      # ExampleHome (заглушка)
    ├── main_router/               # Bottom tabs router
    ├── shift_tracker/             # Трекер смены (Tab 1)
    │   ├── cubit/                 # ShiftTrackerCubit + State
    │   ├── view/                  # ShiftTrackerPage
    │   └── widgets/               # _IdleShiftContent, _ActiveShiftContent, _OrgSelector, _PauseList
    ├── shift_history/             # История смен (Tab 2)
    │   ├── cubit/                 # ShiftHistoryCubit, ShiftStatsCubit + States
    │   ├── view/                  # ShiftHistoryPage
    │   └── widgets/               # _StatsSection, _ShiftFilters, _ShiftCard
    ├── shift_detail/              # Детали смены (push)
    │   ├── cubit/                 # ShiftDetailCubit + State
    │   ├── view/                  # ShiftDetailPage
    │   └── widgets/               # _DetailInfoSection, _DetailPauseList
    ├── organizations/             # Список организаций (Tab 3)
    │   ├── cubit/                 # OrganizationsCubit + State
    │   ├── view/                  # OrganizationsPage
    │   └── widgets/               # _OrgListCard, CreateOrgModal, JoinOrgModal
    ├── organization_detail/       # Детали организации — навигационный хаб (push)
    │   ├── cubit/                 # OrganizationDetailCubit + State
    │   ├── view/                  # OrganizationDetailPage
    │   └── widgets/               # _OrgHeader, _OrgMembersSection, _OrgInviteSection, _OrgActionsSection
    ├── members/                   # Участники организации (push)
    │   ├── cubit/                 # MembersCubit + State
    │   ├── view/                  # MembersPage
    │   └── widgets/               # _MemberTile
    ├── org_settings/              # Настройки организации (push)
    │   ├── cubit/                 # OrgSettingsCubit + State
    │   └── view/                  # OrgSettingsPage
    ├── work_locations/            # Рабочие точки (push)
    │   ├── cubit/                 # LocationsCubit + State
    │   ├── view/                  # WorkLocationsPage
    │   └── widgets/               # _LocationTile
    ├── add_edit_location/         # Добавить/ред. точку (push)
    │   ├── cubit/                 # AddEditLocationCubit + State
    │   ├── view/                  # AddEditLocationPage (Yandex Map)
    │   └── widgets/               # _CenterMarker, _LocationForm
    ├── org_shifts/                # Смены сотрудников (push)
    │   ├── cubit/                 # OrgShiftsCubit + State
    │   ├── view/                  # OrgShiftsPage
    │   └── widgets/               # _OrgShiftCard, _OrgShiftsFilters
    ├── org_stats/                 # Статистика организации (push)
    │   ├── cubit/                 # OrgStatsCubit + State
    │   ├── view/                  # OrgStatsPage (fl_chart)
    │   └── widgets/               # _StatsCards, _StatsChart, _StatsTable
    ├── super_admin/               # Панель super_admin (Tab 5)
    │   ├── cubit/                 # SuperAdminCubit + State
    │   ├── view/                  # SuperAdminPage
    │   └── widgets/               # _AdminOrgCard
    ├── profile/                   # Профиль (Tab 4)
    │   ├── cubit/                 # ProfileCubit + State
    │   ├── view/                  # ProfilePage
    │   └── widgets/               # _ProfileHeader, _PersonalInfoSection, _OrganizationsSection, _SettingsSection, EditProfileModal
    ├── theme/                     # ThemeCubit + виджет переключения
    └── debug/                     # Debug-страница
```

---

## Domain-модели (Freezed)

| Модель | Файл | Описание |
|--------|------|----------|
| `AuthToken` | `domain/auth/models/auth_token.dart` | access_token + refresh_token |
| `AuthState` | `domain/auth/models/auth_state.dart` | Sealed: Authenticated / Unauthenticated / Unknown |
| `RegisterResult` | `domain/auth/models/register_result.dart` | userId + message |
| `User` | `domain/user/models/user.dart` | id, email, name, phone, isVerified, role (UserRole: superAdmin/user), createdAt |
| `Organization` | `domain/organization/models/organization.dart` | id, name, ownerId, inviteCode, isDeleted, createdAt |
| `Member` | `domain/organization/models/member.dart` | id, orgId, userId, userName, userEmail, role (enum), joinedAt, currentRate (nullable, payroll) |
| `OrgSettings` | `domain/organization/models/org_settings.dart` | geoCheck, autoFinish, pauseLimits |
| `OrgStats` | `domain/organization/models/org_stats.dart` | period (nullable), totals + perEmployee list, rangeFrom/rangeTo |
| `JoinResult` | `domain/organization/models/join_result.dart` | orgId, orgName, role |
| `WorkLocation` | `domain/location/models/work_location.dart` | id, orgId, name, lat, lng, radius |
| `Shift` | `domain/shift/models/shift.dart` | id, userId, orgId, times, status (enum), pauses, workedSeconds |
| `Pause` | `domain/shift/models/shift.dart` | id, shiftId, startedAt, finishedAt |
| `ShiftStats` | `domain/shift/models/shift_stats.dart` | period (nullable), totalWorked, count, average, rangeFrom/rangeTo |
| `Rate` / `CurrentRate` | `domain/payroll/models/rate.dart` | запись истории ставок / действующая; `RateType` (hourly/perShift); деньги в копейках (int) |
| `Payroll` / `PayrollItem` / `PayrollTotals` / `PayrollPeriod` | `domain/payroll/models/payroll.dart` | отчёт «кому сколько заплатить» за период |
| `MyEarnings` | `domain/payroll/models/my_earnings.dart` | личный заработок за период + currentRate, hasMissingRate |
| `DefaultPaginator<T>` | `core/models/default_paginator.dart` | hasMore, data, total (универсальная пагинация) |

---

## API DataSources

| DataSource | Base Path | Методы |
|------------|-----------|--------|
| `AuthDataSource` | `/api/v1/auth` | register, verify, resendCode, login, refresh, logout |
| `UserDataSource` | `/api/v1/users` | getMe, updateMe |
| `OrganizationDataSource` | `/api/v1/organizations` | create, getAll, getById, update, delete, rotateInvite, join, getMembers, removeMember, getSettings, updateSettings, getShifts, getStats |
| `LocationDataSource` | `/api/v1/organizations/{orgId}/locations` | create, getAll, update, delete |
| `ShiftDataSource` | `/api/v1/shifts` | getShifts (date_from/date_to), getStats (period XOR date_from/date_to), startShift, pauseShift, resumeShift, finishShift |
| `PayrollDataSource` | `/api/v1/organizations/{orgId}` | getRates, createRate, updateRate, deleteRate, getPayroll, getMyEarnings |

---

## Репозитории

| Репозиторий | Зависимости | Методы |
|-------------|-------------|--------|
| `AuthRepository` | AuthDataSource, AuthTokenStorage, AuthStateNotifier | checkAuthStatus, register, verify, resendCode, login, refresh, logout |
| `UserRepository` | UserDataSource | getMe, updateMe |
| `OrganizationRepository` | OrganizationDataSource | create, getAll, getById, update, delete, rotateInvite, join, getMembers, removeMember, getSettings, updateSettings, getShifts, getStats |
| `LocationRepository` | LocationDataSource | create, getAll, update, delete |
| `ShiftRepository` | ShiftDataSource | getShifts, getStats, startShift, pauseShift, resumeShift, finishShift |
| `PayrollRepository` | PayrollDataSource | getRates, createRate, updateRate, deleteRate, getPayroll, getMyEarnings |

---

## Кубиты (UI State Management)

| Кубит | Статус | Описание |
|-------|--------|----------|
| `MainAppCubit` | Готов | Инициализация приложения |
| `ThemeCubit` | Готов | Управление темой |
| `DebugCubit` | Готов | Debug-информация |
| `AuthCubit` | Готов | Глобальное состояние авторизации (shared) |
| `LoginCubit` | Готов | Login/Register форма с валидацией |
| `VerifyCubit` | Готов | Верификация email (код + таймер) |
| `ShiftTrackerCubit` | Готов | Трекер смены: start/pause/resume/finish + таймер; предвыбор и запоминание контекста (`ShiftContextStorage`) |
| `ShiftHistoryCubit` | Готов | Пагинированный список смен с фильтрами (статус, диапазон дат через общий пикер) |
| `ShiftStatsCubit` | Готов | Статистика смен: пресет день/неделя/месяц XOR произвольный диапазон; request-token от устаревших ответов |
| `ShiftDetailCubit` | Готов | Детали одной смены |
| `OrganizationsCubit` | Готов | Список организаций, создание, присоединение, текущий юзер |
| `OrganizationDetailCubit` | Готов | Детали орг: участники, инвайт, покинуть, удалить |
| `ProfileCubit` | Готов | Профиль: загрузка юзера, организаций, обновление, logout |
| `MembersCubit` | Готов | Участники: список, удаление, смена роли |
| `OrgSettingsCubit` | Готов | Настройки организации |
| `LocationsCubit` | Готов | Рабочие точки: список, удаление |
| `AddEditLocationCubit` | Готов | Добавление/редактирование рабочей точки (Yandex Map) |
| `OrgShiftsCubit` | Готов | Смены сотрудников (пагинация + фильтры: статус, дата, **сотрудник `?user_id`**) |
| `OrgShiftDetailCubit` | Готов | Деталь чужой орг-смены (owner/admin, read-only); ошибки по `error.code` |
| `EmployeePickerCubit` | Готов | Список участников для модалки фильтра по сотруднику |
| `OrgStatsCubit` | Готов | Статистика организации (пресет XOR произвольный диапазон + chart) |
| `MemberRatesCubit` | Готов | История ставок участника + удаление; действующая ставка (getter); ленивая загрузка из секции |
| `RateFormCubit` | Готов | Сабмит формы ставки (POST/PATCH), подсветка RATE_EFFECTIVE_FROM_TAKEN |
| `MyEarningsCubit` | Готов | «Мой заработок»: окно периода (PeriodPreset XOR произвольный), сводка + текущая ставка |
| `PayrollCubit` | Готов | Отчёт «Зарплата»: окно периода, totals + items, карта участников для перехода на деталь |
| `SuperAdminCubit` | Готов | Все организации системы (super_admin) |

---

## Навигация (auto_route)

| Route | Path | Описание |
|-------|------|----------|
| `LoginRoute` | `/login` | Авторизация |
| `VerifyRoute` | `/verify` | Подтверждение email |
| `DebugRoute` | `/debug` | Debug-страница |
| `MainRouterRoute` | `/` | Bottom tabs (Смена, История, Профиль) |
| `ShiftTrackerRoute` | `/shift` | Трекер смены (Tab 1) |
| `ShiftHistoryRoute` | `/history` | История смен (Tab 2) |
| `ShiftDetailRoute` | `/history/detail` | Детали смены (push) |
| `OrganizationsRoute` | `/organizations` | Список организаций (Tab 3) |
| `OrganizationDetailRoute` | `/organizations/detail/:orgId` | Детали организации (push) |
| `CreateOrgRoute` | `/organizations/create` | Модалка создания орг (CustomRoute) |
| `JoinOrgRoute` | `/organizations/join` | Модалка присоединения (CustomRoute) |
| `ProfileRoute` | `/profile` | Экран профиля (Tab 4) |
| `EditProfileRoute` | `/profile/edit` | Модалка редактирования профиля (CustomRoute) |
| `OrgMembersRoute` | `/organizations/detail/:orgId/members` | Участники организации |
| `OrgSettingsRoute` | `/organizations/detail/:orgId/settings` | Настройки организации |
| `WorkLocationsRoute` | `/organizations/detail/:orgId/locations` | Рабочие точки |
| `AddEditLocationRoute` | `/organizations/detail/:orgId/locations/add` | Добавить/ред. точку |
| `OrgShiftsRoute` | `/organizations/detail/:orgId/shifts` | Смены сотрудников |
| `OrgStatsRoute` | `/organizations/detail/:orgId/stats` | Статистика организации |
| `DateRangePickerRoute` | `history/date-range` + `<org-detail>/date-range` | Общий date-range picker (CustomRoute-модалка, `DateRangePickerResult?`) |
| `MyEarningsRoute` | `<org-detail>/my-earnings` | «Мой заработок» (org_member) |
| `PayrollRoute` | `<org-detail>/payroll` | «Зарплата» — отчёт по сотрудникам (admin/owner) |
| `RateFormRoute` | `<org-detail>/rate-form` | Модалка добавления/исправления ставки (CustomRoute, `bool?`) |
| `SuperAdminRoute` | `/admin` | Панель super_admin (Tab 5, conditional) |

**Guard**: Если не авторизован → редирект на `LoginRoute`

---

## Локальное хранение

| Сервис | Хранилище | Данные |
|--------|-----------|--------|
| `AuthTokenStorage` | **flutter_secure_storage** (+ in-memory кэш) | access_token, refresh_token |
| `ThemeLocalStorageApi` | SharedPreferences | Режим темы (light/dark/system) |
| `PendingInviteStorage` | SharedPreferences | pending_invite_code |
| `ShiftContextStorage` | SharedPreferences | last_shift_context (`personal` либо UUID организации) |

### `AuthTokenStorage` — безопасное хранение токенов (security_hardening)
- Токены лежат в `flutter_secure_storage` (Keychain на iOS, EncryptedSharedPreferences/Keystore на Android). Нечувствительные данные (тема, контекст смены) остаются в `SharedPreferences`.
- **In-memory кэш**: secure storage асинхронный, а `AuthInterceptor`/репозитории читают токены синхронно (`accessToken`/`refreshToken`/`hasTokens`). `init()` наполняет кэш при старте, `saveTokens`/`clearTokens` пишут write-through.
- **Bootstrap-порядок**: `await authTokenStorage.init()` в `MainAppCubit._init` (фаза 3.5) — строго до создания Dio (фаза 4) и `checkAuthStatus`.
- **Одноразовая миграция**: если secure storage пуст, а в старом `SharedPreferences` есть валидная пара токенов — переносим в secure storage и удаляем плейнтекст (пользователь не разлогинивается). Плейнтекст из `SharedPreferences` вычищается в любом случае (defense-in-depth).
- Логика рефреша в `AuthInterceptor` не менялась.

---

## Deep Links

| Сервис | Описание |
|--------|----------|
| `DeepLinkService` | Обработка входящих URI (app_links). Парсит `smenka://invite/{code}` |
| `PendingInviteStorage` | Хранение инвайт-кода для обработки после авторизации |

**Схема:** `smenka://invite/{code}` (custom URI scheme)
**Обработка:** `_SuccessApp` слушает `DeepLinkService.inviteCodeStream` → если авторизован — join, если нет — сохраняет код

---

## Утилиты

### Общие виджеты (`lib/widgets/`)
- `AppTextField` — кастомное текстовое поле с валидацией (файл: `lib/widgets/app_text_field.dart`)
- `AppButton` — кнопка с состоянием загрузки (файл: `lib/widgets/app_button.dart`)
- `PinCodeField` — поле ввода PIN/кода подтверждения (файл: `lib/widgets/pin_code_field.dart`)
- `AppEmptyState` — переиспользуемый empty state (иконка + заголовок + опц. подзаголовок + опц. кнопка) (файл: `lib/widgets/app_empty_state.dart`)
- `AppShimmerLoader` — shimmer placeholder для загрузки списков (файл: `lib/widgets/app_shimmer_loader.dart`)
- `MemberRoleBadges` — бейджи системной + кастомной роли (поддерживает плоский `customRoleName`) (файл: `lib/widgets/member_role_badges.dart`)
- `ShiftAuthorBlock` — шапка автора орг-смены: имя/почта/бейджи ролей или «Бывший сотрудник» (карточка списка + деталь) (файл: `lib/widgets/shift_author_block.dart`)
- `ShiftPauseList` — список пауз смены (переиспользуется в персональной и орг-детали) (файл: `lib/widgets/shift_pause_list.dart`)
- `ChecklistInstanceTile` — плитка экземпляра чек-листа с `onTap` (список чек-листов + read-only блок на детали) (файл: `lib/widgets/checklist_instance_tile.dart`)
- `DateRangeFilterChip` — чип фильтра диапазона дат («01.06 – 09.06» / «с…» / «по…», крестик-сброс); используется в истории смен, орг-сменах, статистике и payroll-экранах (файл: `lib/widgets/date_range_filter_chip.dart`)
- `PeriodPresetSelector` — селектор окна периода payroll-экранов: SegmentedButton (день/неделя/месяц) + чип произвольного диапазона (файл: `lib/widgets/period_preset_selector.dart`)
- Barrel file: `lib/widgets/_widgets.dart`

### Утилиты дат и денег
- `lib/core/models/period_preset.dart` — `PeriodPreset` (day/week/month) + `boundsUtc()`: границы пресета (локальные дни → UTC) для payroll-эндпоинтов без `period`
- `lib/core/utils/money_format.dart` — `formatMoneyMinor` (копейки → «12 345,67 ₽») и `parseRublesToMinor` (строгий разбор ввода ₽ → копейки, без double)
- `lib/l10n/applied_range_label.dart` — подпись применённого окна (`range_from`/`range_to`), поддерживает открытые границы
- `lib/l10n/error_localization.dart` — центральный маппинг `error.code` → строка; используется `SectionDataWrapper` и Paginated-виджетами

### Toast-уведомления
- `context.modals.showSuccess/showError/showInfo/showWarning` — overlay-based toast
- Файлы: `lib/widgets/app_toast/`, extension в `lib/core/router/app_modals.dart`
- Использует `AppColors` из темы (success, error, warning, info)

### Управление состоянием секций
- `SectionData<T>` — состояние секции: data, status (FeatureStatus), error + хелперы (toLoading, toSuccess, toError, toIdle)
- `PaginatedSectionData<T>` — пагинированное состояние: data, hasMore, currentPage, perPage, status, error
- `PaginationMixin` — mixin для кубитов: `fetchPaginated()` (с `DefaultPaginator<T>`) и `fetchPaginatedByCount()` (определяет hasMore по количеству)
- `DefaultPaginator<T>` — универсальная модель ответа пагинации (hasMore, data, total)

### Виджеты секций
- `SectionDataWrapper<C, S, T>` — обёртка: автоматически показывает shimmer/error/content по `SectionData<T>`. Опц. параметры: `emptyBuilder`, `loadingBuilder`
- `SectionLoader` — shimmer-загрузка (по умолчанию `AppShimmerLoader`). Опц. `loadingBuilder` для кастомизации
- `SectionError` — стандартный виджет ошибки с retry
- `PaginatedSectionDataList<C, S, T>` — ListView с автоподгрузкой при 80% скролла + pull-to-refresh
- `PaginatedSectionDataGrid<C, S, T>` — GridView аналогично
- `PaginatedSliverList<C, S, T>` / `PaginatedSliverGrid<C, S, T>` — Sliver-варианты для CustomScrollView

---

## Ключевые решения

См. `docs/decisions/` для полных ADR.
