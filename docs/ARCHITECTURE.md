# Архитектура — текущее состояние

Последнее обновление: 2026-04-06 (фаза 5)

---

## Стек

- Flutter, Dart
- auto_route (навигация)
- flutter_bloc / Cubit (state management)
- freezed + json_serializable (модели)
- Dio (HTTP)
- GetIt + Injectable (DI)
- SharedPreferences (локальное хранение)
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
    ├── profile/                   # Профиль (Tab 3)
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
| `User` | `domain/user/models/user.dart` | id, email, name, phone, isVerified, createdAt |
| `Organization` | `domain/organization/models/organization.dart` | id, name, ownerId, inviteCode, isDeleted, createdAt |
| `Member` | `domain/organization/models/member.dart` | id, orgId, userId, userName, userEmail, role (enum), joinedAt |
| `OrgSettings` | `domain/organization/models/org_settings.dart` | geoCheck, autoFinish, pauseLimits |
| `OrgStats` | `domain/organization/models/org_stats.dart` | period, totals + perEmployee list |
| `JoinResult` | `domain/organization/models/join_result.dart` | orgId, orgName, role |
| `WorkLocation` | `domain/location/models/work_location.dart` | id, orgId, name, lat, lng, radius |
| `Shift` | `domain/shift/models/shift.dart` | id, userId, orgId, times, status (enum), pauses, workedSeconds |
| `Pause` | `domain/shift/models/shift.dart` | id, shiftId, startedAt, finishedAt |
| `ShiftStats` | `domain/shift/models/shift_stats.dart` | period, totalWorked, count, average |
| `DefaultPaginator<T>` | `core/models/default_paginator.dart` | hasMore, data, total (универсальная пагинация) |

---

## API DataSources

| DataSource | Base Path | Методы |
|------------|-----------|--------|
| `AuthDataSource` | `/api/v1/auth` | register, verify, resendCode, login, refresh, logout |
| `UserDataSource` | `/api/v1/users` | getMe, updateMe |
| `OrganizationDataSource` | `/api/v1/organizations` | create, getAll, getById, update, delete, rotateInvite, join, getMembers, removeMember, getSettings, updateSettings, getShifts, getStats |
| `LocationDataSource` | `/api/v1/organizations/{orgId}/locations` | create, getAll, update, delete |
| `ShiftDataSource` | `/api/v1/shifts` | getShifts, getStats, startShift, pauseShift, resumeShift, finishShift |

---

## Репозитории

| Репозиторий | Зависимости | Методы |
|-------------|-------------|--------|
| `AuthRepository` | AuthDataSource, AuthTokenStorage, AuthStateNotifier | checkAuthStatus, register, verify, resendCode, login, refresh, logout |
| `UserRepository` | UserDataSource | getMe, updateMe |
| `OrganizationRepository` | OrganizationDataSource | create, getAll, getById, update, delete, rotateInvite, join, getMembers, removeMember, getSettings, updateSettings, getShifts, getStats |
| `LocationRepository` | LocationDataSource | create, getAll, update, delete |
| `ShiftRepository` | ShiftDataSource | getShifts, getStats, startShift, pauseShift, resumeShift, finishShift |

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
| `ShiftTrackerCubit` | Готов | Трекер смены: start/pause/resume/finish + таймер |
| `ShiftHistoryCubit` | Готов | Пагинированный список смен с фильтрами (статус, дата) |
| `ShiftStatsCubit` | Готов | Статистика смен (день/неделя/месяц) |
| `ShiftDetailCubit` | Готов | Детали одной смены |
| `ProfileCubit` | Готов | Профиль: загрузка юзера, организаций, обновление, logout |

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
| `ProfileRoute` | `/profile` | Экран профиля (Tab 3) |
| `EditProfileRoute` | `/profile/edit` | Модалка редактирования профиля (CustomRoute) |

**Guard**: Если не авторизован → редирект на `LoginRoute`

---

## Локальное хранение

| Сервис | Хранилище | Данные |
|--------|-----------|--------|
| `AuthTokenStorage` | SharedPreferences | access_token, refresh_token |
| `ThemeLocalStorageApi` | SharedPreferences | Режим темы (light/dark/system) |

---

## Утилиты

### Общие виджеты (`lib/widgets/`)
- `AppTextField` — кастомное текстовое поле с валидацией (файл: `lib/widgets/app_text_field.dart`)
- `AppButton` — кнопка с состоянием загрузки (файл: `lib/widgets/app_button.dart`)
- `PinCodeField` — поле ввода PIN/кода подтверждения (файл: `lib/widgets/pin_code_field.dart`)
- Barrel file: `lib/widgets/_widgets.dart`

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
- `SectionDataWrapper<C, S, T>` — обёртка: автоматически показывает loader/error/content по `SectionData<T>`
- `SectionLoader` / `SectionError` — стандартные виджеты загрузки и ошибки
- `PaginatedSectionDataList<C, S, T>` — ListView с автоподгрузкой при 80% скролла + pull-to-refresh
- `PaginatedSectionDataGrid<C, S, T>` — GridView аналогично
- `PaginatedSliverList<C, S, T>` / `PaginatedSliverGrid<C, S, T>` — Sliver-варианты для CustomScrollView

---

## Ключевые решения

См. `docs/decisions/` для полных ADR.
