# Архитектура — текущее состояние

Последнее обновление: 2026-06-21 (фичи: checklist_photos, shift_work_location)

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
- geolocator (геопроверка зон; на web — no-op)
- Firebase (Crashlytics, Remote Config, Analytics)
- Таргеты: Android, iOS, **web** (`flutter build web`; см. раздел «Web-поддержка»). Yandex MapKit и экран карты полностью удалены.

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
│   ├── models/                    # DefaultPaginator<T>, PeriodPreset
│   ├── network/                   # Dio errors, Task, TaskHandler
│   ├── router/                    # AppRouter, AppModals (context.modals)
│   ├── deep_link/                 # DeepLinkService, PendingInviteStorage
│   ├── services/                  # GeoService (geolocator; no-op на web)
│   ├── web/                       # url_strategy (conditional export web/stub)
│   ├── utils/                     # money_format и пр.
│   └── theme/                     # Тема, цвета
├── data/
│   ├── api/local/                 # Локальное хранение (tokens, theme, shift-context)
│   ├── domain/                    # Domain-слой (абстрактные репо + модели)
│   │   ├── auth/                  # AuthToken, AuthState, RegisterResult, AuthStateNotifier
│   │   ├── user/                  # User
│   │   ├── organization/          # Organization, Member, OrgStats, JoinResult
│   │   ├── organization_role/     # OrganizationRole (только для отображения, без репозитория)
│   │   ├── payroll/               # Rate, CurrentRate, Payroll, MyEarnings (read-only)
│   │   ├── checklist/             # ChecklistInstance*, EffectiveChecklistTemplate (read/fill)
│   │   ├── file_storage/          # StoredFile, FileCategory + FilesRepository (платформенный слой)
│   │   └── shift/                 # Shift, Pause, ShiftStats
│   └── infrastructure/            # Реализации (datasource + dto + mappers + repos)
│       ├── auth/
│       ├── user/
│       ├── organization/
│       ├── organization_role/     # только DTO + mapper (модель вкладывается в Member/Organization)
│       ├── payroll/
│       ├── checklist/
│       ├── file_storage/          # FilesDataSource + FilesRepositoryImpl (без DTO: ответ 1-в-1)
│       └── shift/
├── shared/                        # Глобальные cubit'ы вне страниц
│   └── auth/                      # AuthCubit + AuthState (глобальная авторизация)
├── l10n/                          # Локализация (ARB)
├── widgets/                       # Переиспользуемые виджеты
│   ├── app_toast/                 # Toast-уведомления (AppToast, AppToastManager)
│   ├── section_data/              # SectionDataWrapper, SectionLoader, SectionError
│   ├── paginated_section_data/    # PaginatedSectionDataList/Grid/SliverList/SliverGrid
│   └── storage_image.dart         # Показ файла из file_storage (cache + авто-рефреш presigned)
└── pages/                         # UI-слой (экраны)
    ├── auth/                      # Login/Register + LoginCubit + _PasswordRequirements
    ├── verify/                    # Верификация email + VerifyCubit
    ├── home/                      # ExampleHome (заглушка, не в основной навигации)
    ├── main_router/               # Bottom tabs router (4 таба)
    ├── shift_tracker/             # Трекер смены (Tab 1 «Смена»)
    │   ├── cubit/                 # ShiftTrackerCubit + State
    │   ├── view/                  # ShiftTrackerPage
    │   └── widgets/               # _IdleShiftContent, _ActiveShiftContent, _OfflineBanner, _OrgSelector, _PauseList, _PauseCard, _ShiftActionErrorBar, _ShiftChecklistsTile
    ├── shift_checklists/          # Чек-листы текущей смены (push)
    │   ├── cubit/                 # ShiftChecklistsCubit + State
    │   └── view/                  # ShiftChecklistsPage
    ├── checklist_fill/            # Заполнение чек-листа смены (push; read-only для чужой/завершённой смены)
    │   ├── cubit/                 # ChecklistFillCubit + State + ChecklistPhotoDraft + photo_processing (штамп в изоляте)
    │   ├── view/                  # ChecklistFillPage + ChecklistPhotoViewerPage (вьюер) + ChecklistPhotoSourcePage (камера/галерея)
    │   └── widgets/               # _FillItemTile + _ItemPhotosSection (лента превью/кнопка/бейдж/черновики)
    ├── shift_history/             # История смен (Tab 2 «История»)
    │   ├── cubit/                 # ShiftHistoryCubit, ShiftStatsCubit + States
    │   ├── view/                  # ShiftHistoryPage
    │   └── widgets/               # _StatsSection, _ShiftFilters, _ShiftCard, _FilterChip
    ├── shift_detail/              # Детали смены (push)
    │   ├── cubit/                 # ShiftDetailCubit + State
    │   ├── view/                  # ShiftDetailPage
    │   └── widgets/               # _DetailInfoSection, _DetailChecklistsSection, _StatusBadge
    ├── organizations/             # Список организаций (Tab 3 «Организации»)
    │   ├── cubit/                 # OrganizationsCubit + State
    │   ├── view/                  # OrganizationsPage
    │   └── widgets/               # _OrgListCard, JoinOrgModal
    ├── organization_detail/       # Детали организации — навигационный хаб (push, read-only)
    │   ├── cubit/                 # OrganizationDetailCubit + State
    │   ├── view/                  # OrganizationDetailPage
    │   └── widgets/               # _OrgHeader, _OrgNavigationSection, _OrgActionsSection, _NavItem
    ├── members/                   # Участники организации (push, read-only)
    │   ├── cubit/                 # MembersCubit + State
    │   ├── view/                  # MembersPage
    │   └── widgets/               # _MemberTile
    ├── member_detail/             # Деталь участника (push, READ-ONLY)
    │   ├── cubit/                 # MemberDetailCubit, MemberRatesCubit + States
    │   ├── view/                  # MemberDetailPage
    │   └── widgets/               # _HeaderSection, _EffectiveSection, _RatesSection, _CurrentRateBlock
    ├── org_shifts/                # Смены сотрудников (push)
    │   ├── cubit/                 # OrgShiftsCubit + State
    │   ├── view/                  # OrgShiftsPage
    │   └── widgets/               # _OrgShiftCard, _OrgShiftsFilters, _EmployeeFilterChip
    ├── org_shift_detail/          # Деталь чужой орг-смены (push, read-only)
    │   ├── cubit/                 # OrgShiftDetailCubit + State
    │   ├── view/                  # OrgShiftDetailPage
    │   └── widgets/               # _OrgShiftInfoSection, _OrgShiftDetailChecklists, _OrgStatusBadge
    ├── org_stats/                 # Статистика организации (push)
    │   ├── cubit/                 # OrgStatsCubit + State
    │   ├── view/                  # OrgStatsPage (fl_chart)
    │   └── widgets/               # _StatsCards, _StatsChart, _StatsTable
    ├── employee_picker/           # Модалка выбора сотрудника для фильтра (CustomRoute)
    │   ├── cubit/                 # EmployeePickerCubit + State
    │   └── view/                  # EmployeePickerPage
    ├── my_earnings/               # «Мой заработок» (push)
    │   ├── cubit/                 # MyEarningsCubit + State
    │   └── view/                  # MyEarningsPage
    ├── payroll/                   # «Зарплата» — отчёт по сотрудникам (push)
    │   ├── cubit/                 # PayrollCubit + State
    │   └── view/                  # PayrollPage
    ├── date_range_picker/         # Общий date-range picker (CustomRoute-модалка)
    │   └── view/                  # DateRangePickerPage
    ├── profile/                   # Профиль (Tab 4 «Профиль»)
    │   ├── cubit/                 # ProfileCubit + State
    │   ├── view/                  # ProfilePage
    │   └── widgets/               # _ProfileHeader, _PersonalInfoSection, _OrganizationsSection, _SettingsSection, EditProfileModal
    ├── theme/                     # ThemeCubit + виджет переключения
    └── debug/                     # Debug-страница + DebugCubit
```

---

## Domain-модели (Freezed)

| Модель | Файл | Описание |
|--------|------|----------|
| `AuthToken` | `domain/auth/models/auth_token.dart` | access_token + refresh_token |
| `AuthState` | `domain/auth/models/auth_state.dart` | Sealed: Authenticated / Unauthenticated / Unknown |
| `RegisterResult` | `domain/auth/models/register_result.dart` | userId + message |
| `User` | `domain/user/models/user.dart` | id, email, name, isVerified, role (UserRole: superAdmin/user), createdAt, phone? |
| `Organization` | `domain/organization/models/organization.dart` | id, name, ownerId, inviteCode, isDeleted, createdAt, geoCheckEnabled; `myRole` (OrgMembershipRole: owner/admin/employee, nullable), `myCustomRole` (nullable) |
| `Member` | `domain/organization/models/member.dart` | id, organizationId, userId, userName, userEmail, role (MemberRole: admin/employee), joinedAt, customRole?, currentRate? (payroll) |
| `OrganizationRole` | `domain/organization_role/models/organization_role.dart` | id, name, createdAt (кастомная роль; только для отображения, без write-слоя) |
| `OrgStats` / `EmployeeStats` | `domain/organization/models/org_stats.dart` | агрегаты org (totalWorked, shiftCount, average, perEmployee), period? + rangeFrom/rangeTo |
| `JoinResult` | `domain/organization/models/join_result.dart` | результат присоединения по инвайту |
| `Shift` | `domain/shift/models/shift.dart` | id, userId, startedAt, status (ShiftStatus), pauses, workedSeconds, organizationId?, finishedAt?, hasIncompleteRequiredChecklists; в орг-ответах — userName/userEmail/role/customRoleName |
| `Pause` | `domain/shift/models/shift.dart` | id, shiftId, startedAt, finishedAt? |
| `ShiftStats` | `domain/shift/models/shift_stats.dart` | totalWorked, shiftCount, average, period? + rangeFrom/rangeTo |
| `ChecklistInstance` / `ChecklistInstanceDetail` / `ChecklistInstanceItem` / `ChecklistItemsSummary` | `domain/checklist/models/checklist_instance.dart` | экземпляры чек-листов смены (`ChecklistInstanceStatus`: pending/completed/incomplete) и их пункты; пункт несёт `photoRequirement`/`photoSource`/`photosCount`/`photos`; detail — `maxPhotosPerItem?`; summary — `satisfiedCount`/`photosRequiredMissing` (прогресс/бейдж по фото) |
| `ChecklistItemPhoto` / `PhotoRequirement` / `PhotoSource` | `domain/checklist/models/checklist_photo.dart` | фото пункта (fileId, presigned url?, capturedAt?/lat/lng, position); enum требования (none/optional/required) и источника (camera/cameraOrGallery, snake-маппинг с безопасным дефолтом) |
| `EffectiveChecklistTemplate` | `domain/checklist/models/effective_template.dart` | эффективный шаблон участника (read-only; `ChecklistTemplateSource`: role/personalAdd) |
| `ChecklistType` | `domain/checklist/models/checklist_template.dart` | enum shiftStart/shiftEnd |
| `Rate` / `CurrentRate` | `domain/payroll/models/rate.dart` | запись истории ставок / действующая; `RateType` (hourly/perShift); деньги в копейках (int) |
| `Payroll` / `PayrollItem` / `PayrollTotals` / `PayrollPeriod` | `domain/payroll/models/payroll.dart` | отчёт «кому сколько заплатить» за период |
| `MyEarnings` | `domain/payroll/models/my_earnings.dart` | личный заработок за период + currentRate?, hasMissingRate |
| `StoredFile` / `FileCategory` | `domain/file_storage/models/stored_file.dart` | метаданные файла из единого хранилища + presigned `url`/`urlExpiresAt`; enum категорий (checklist_photo/knowledge_base/avatar/other) |
| `DefaultPaginator<T>` | `core/models/default_paginator.dart` | hasMore, data, total (универсальная пагинация) |

---

## API DataSources

Все пути относительные; Dio добавляет базовый префикс `/api/v1`.

| DataSource | Base Path | Методы |
|------------|-----------|--------|
| `AuthDataSource` | `/auth` | register, verify, resendCode, login, refresh, logout |
| `UserDataSource` | `/users` | getMe, updateMe |
| `OrganizationDataSource` | `/organizations` | getAll, getById, join, getMembers, removeMember (self-leave), getShifts (user_id/status/date_from/date_to), getShiftDetail, getStats (period XOR date_from/date_to) |
| `ShiftDataSource` | `/shifts` | getShifts (date_from/date_to), getStats (period XOR date_from/date_to), startShift, pauseShift, resumeShift, finishShift |
| `ChecklistDataSource` | `/organizations/{orgId}` и `/shifts` | getEffectiveTemplates (member, read-only), getShiftChecklists, getInstanceDetail, updateInstanceItem |
| `PayrollDataSource` | `/organizations/{orgId}` | getRates (read), getPayroll, getMyEarnings |
| `FilesDataSource` | `/files` | uploadFile (multipart `file`/`category`/`organization_id`, onSendProgress), getFile (свежий presigned URL) |

> Write-слой org-менеджмента (create/delete/rotateInvite/updateMemberRole/getSettings/updateSettings/getAllOrganizations), управление рабочими точками, ставками и шаблонами чек-листов вынесены в веб-админку — в мобильном API их нет.

---

## Репозитории

| Репозиторий | Зависимости | Методы |
|-------------|-------------|--------|
| `AuthRepository` | AuthDataSource, AuthTokenStorage, AuthStateNotifier | checkAuthStatus, register, verify, resendCode, login, refresh, logout |
| `UserRepository` | UserDataSource | getMe, updateMe |
| `OrganizationRepository` | OrganizationDataSource | getAll, getById, join, getMembers, removeMember (self-leave), getShifts, getShiftDetail, getStats, watchMyOrganizations, fetchMyOrganizations, clearCache |
| `ShiftRepository` | ShiftDataSource | getShifts, getStats, startShift, pauseShift, resumeShift, finishShift |
| `ChecklistRepository` | ChecklistDataSource | getEffectiveTemplates, getShiftChecklists, getInstanceDetail, updateInstanceItem, addItemPhoto, deleteItemPhoto |
| `PayrollRepository` | PayrollDataSource | getRates, getPayroll, getMyEarnings (всё read-only) |
| `FilesRepository` | FilesDataSource | uploadFile, getFile (платформенный слой `file_storage`; зарегистрирован глобально, потребители — фото чек-листов/база знаний/аватары; UI-показ — виджет `StorageImage`) |

> `OrganizationRole` отдельного репозитория не имеет (только DTO+mapper; модель вкладывается в `Member`/`Organization`). `LocationRepository` удалён.

---

## Кубиты (UI State Management)

| Кубит | Статус | Описание |
|-------|--------|----------|
| `MainAppCubit` | Готов | Инициализация приложения |
| `ThemeCubit` | Готов | Управление темой |
| `DebugCubit` | Готов | Debug-информация |
| `AuthCubit` | Готов | Глобальное состояние авторизации (`lib/shared/auth/`) |
| `LoginCubit` | Готов | Login/Register форма с валидацией |
| `VerifyCubit` | Готов | Верификация email (код + таймер) |
| `ShiftTrackerCubit` | Готов | Трекер смены: start/pause/resume/finish + таймер; гео-проверка, офлайн/retry; предвыбор и запоминание контекста (`ShiftContextStorage`) |
| `ShiftChecklistsCubit` | Готов | Список чек-листов текущей смены (read) |
| `ChecklistFillCubit` | Готов | Заполнение пунктов (toggle + debounced комментарий) + фото-подтверждения: антифрод-флоу `addPhoto` (image_picker → гео → штамп в изоляте → flutter_image_compress → `POST /files` → привязка), `retryPhoto` (частичный сбой), `removePhoto`; черновики загрузки в стейте, байты — в приватной мапе; read-only для чужой/завершённой смены |
| `ShiftHistoryCubit` | Готов | Пагинированный список смен с фильтрами (статус, диапазон дат через общий пикер) |
| `ShiftStatsCubit` | Готов | Статистика смен: пресет день/неделя/месяц XOR произвольный диапазон; request-token от устаревших ответов |
| `ShiftDetailCubit` | Готов | Детали одной смены (read-only) |
| `OrganizationsCubit` | Готов | Список организаций (watch), присоединение по инвайту, текущий юзер |
| `OrganizationDetailCubit` | Готов | Хаб организации (read-only); единственная мутация — `leaveOrganization` (self-leave) |
| `ProfileCubit` | Готов | Профиль: загрузка юзера, организаций (watch), обновление, logout |
| `MembersCubit` | Готов | Участники: список (read-only; гейтинг UI по роли наблюдателя) |
| `MemberDetailCubit` | Готов | Деталь участника: эффективные чек-листы (read-only) |
| `OrgShiftsCubit` | Готов | Смены сотрудников (пагинация + фильтры: статус, дата, **сотрудник `?user_id`**) |
| `OrgShiftDetailCubit` | Готов | Деталь чужой орг-смены (admin, read-only); ошибки по `error.code` |
| `EmployeePickerCubit` | Готов | Список участников для модалки фильтра по сотруднику |
| `OrgStatsCubit` | Готов | Статистика организации (пресет XOR произвольный диапазон + chart) |
| `MemberRatesCubit` | Готов | История ставок участника (read-only); действующая ставка (getter); ленивая загрузка из секции |
| `MyEarningsCubit` | Готов | «Мой заработок»: окно периода (PeriodPreset XOR произвольный), сводка + текущая ставка |
| `PayrollCubit` | Готов | Отчёт «Зарплата»: окно периода, totals + items, карта участников для перехода на деталь |

---

## Навигация (auto_route)

`MainRouterRoute` (`/`) — **4 таба** bottom navigation: Смена, История, Организации, Профиль. Пятого (super_admin) таба нет.

Граф организации (`OrganizationDetailRoute` и вложенные) переиспользуется в **двух** табах через общий хелпер `_orgDetailRoutes`: из таба «Организации» (basePath `detail/:orgId`) и из таба «Профиль» (basePath `org-detail/:orgId`).

| Route | Path | Описание |
|-------|------|----------|
| `LoginRoute` | `/login` | Авторизация |
| `VerifyRoute` | `/verify` | Подтверждение email |
| `DebugRoute` | `/debug` | Debug-страница |
| `MainRouterRoute` | `/` | Bottom tabs (Смена · История · Организации · Профиль) |
| `ShiftTrackerRoute` | `/shift` | Трекер смены (Tab 1, initial) |
| `ShiftChecklistsRoute` | `<tab>/shifts/:shiftId/checklists` | Чек-листы смены (push; в табах Смена/История) |
| `ChecklistFillRoute` | `<tab>/shifts/:shiftId/checklists/:instanceId` | Заполнение чек-листа (push); `organizationId?` для загрузки фото, `readOnly` для чужой/завершённой смены |
| `ChecklistPhotoViewerRoute` | `/checklist-photo-viewer` | Полноэкранный вьюер фото (root, поверх табов; `photo_view` зум/пан/свайп, удаление) |
| `ChecklistPhotoSourceRoute` | `/checklist-photo-source` | Bottom-sheet выбора источника фото (камера/галерея) для `camera_or_gallery` |
| `ShiftHistoryRoute` | `/history` | История смен (Tab 2, initial) |
| `ShiftDetailRoute` | `/history/detail` | Детали смены (push) |
| `OrganizationsRoute` | `/organizations` | Список организаций (Tab 3, initial) |
| `JoinOrgRoute` | `/organizations/join` | Модалка присоединения (CustomRoute) |
| `ProfileRoute` | `/profile` | Экран профиля (Tab 4, initial) |
| `EditProfileRoute` | `/profile/edit` | Модалка редактирования профиля (CustomRoute) |
| `OrganizationDetailRoute` | `<org-base>` | Детали организации — навигационный хаб (push) |
| `OrgMembersRoute` | `<org-base>/members` | Участники организации |
| `MemberDetailRoute` | `<org-base>/members/:userId` | Деталь участника (read-only) |
| `OrgShiftsRoute` | `<org-base>/shifts` | Смены сотрудников |
| `OrgShiftDetailRoute` | `<org-base>/shifts/:shiftId` | Деталь чужой орг-смены (read-only) |
| `OrgStatsRoute` | `<org-base>/stats` | Статистика организации |
| `MyEarningsRoute` | `<org-base>/my-earnings` | «Мой заработок» (org_member) |
| `PayrollRoute` | `<org-base>/payroll` | «Зарплата» — отчёт по сотрудникам (admin) |
| `EmployeePickerRoute` | `<org-base>/employee-picker` | Модалка выбора сотрудника (CustomRoute, `EmployeePickerResult?`) |
| `DateRangePickerRoute` | `/history/date-range` + `<org-base>/date-range` | Общий date-range picker (CustomRoute-модалка, `DateRangePickerResult?`) |

> `<org-base>` = `detail/:orgId` (таб «Организации») или `org-detail/:orgId` (таб «Профиль»).
> CustomRoute-модалки строятся через `ModalBottomSheetRoute` (`_modalBottomSheetBuilder`).

Удалены (нет в роутере): `CreateOrgRoute`, `OrgSettingsRoute`, `WorkLocationsRoute`, `AddEditLocationRoute`, `RolesRoute`, `ChecklistTemplate*Route`, `RateFormRoute`, `SuperAdminRoute`.

**Guard**: Если не авторизован → редирект на `LoginRoute` (через `redirectUntil`)

---

## Web-поддержка

Приложение собирается под web (`flutter build web`). Платформенные различия изолированы через `kIsWeb` и conditional import.

**Что сделано в клиенте:**
- **URL-strategy**: `usePathUrlStrategy()` (без `#` в адресе) — `lib/core/web/url_strategy.dart` через conditional export (`url_strategy_web.dart` / `url_strategy_stub.dart`), вызывается из `main.dart`. Зависимость `flutter_web_plugins` в `pubspec.yaml`.
- **Remote Config cache cleaner**: conditional import `dart:io` — `lib/app/config/remote_config/remote_config_cache_cleaner_io.dart` (реальная очистка кэша) и `..._stub.dart` (no-op для web, где `dart:io` недоступен).
- **Crashlytics не инициализируется на web**: `MainAppCubit._init` пропускает `CrashlyticsInitializer()` под `if (!kIsWeb)`; в `TalkerInitializer` поле `crashlytics` nullable, запись ошибок — `crashlytics?.recordError/recordFlutterFatalError`.
- **Geolocator на web — no-op**: `lib/core/services/geo_service.dart` — `getCurrentPosition`, `openAppSettings`, `openLocationSettings` под `kIsWeb` возвращают рано (геопроверка зон фактически отключена на web).
- **Upgrader замьючен на web**: `lib/app/main_app/view/success_app.dart` — проверка версии в сторе включается только когда `!kIsWeb`.
- **Firebase**: `lib/firebase_options.dart` содержит web-конфиг (`FirebaseOptions web`).

**Вне клиента (нужно на стороне инфраструктуры):**
- CORS на бэке для домена web-хостинга.
- HTTPS-хостинг собранного бандла.
- `flutter_secure_storage` на web использует IndexedDB — JWT-токены доступны JavaScript (не Keychain/Keystore, как на native).

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
- `AppBottomSheet` — каркас bottom-sheet для CustomRoute-модалок (файл: `lib/widgets/app_bottom_sheet.dart`)
- `AppEmptyState` — переиспользуемый empty state (иконка + заголовок + опц. подзаголовок + опц. кнопка) (файл: `lib/widgets/app_empty_state.dart`)
- `AppShimmerLoader` — shimmer placeholder для загрузки списков (файл: `lib/widgets/app_shimmer_loader.dart`)
- `MemberRoleBadges` — бейджи системной + кастомной роли (поддерживает плоский `customRoleName`) (файл: `lib/widgets/member_role_badges.dart`)
- `ShiftAuthorBlock` — шапка автора орг-смены: имя/почта/бейджи ролей или «Бывший сотрудник» (карточка списка + деталь) (файл: `lib/widgets/shift_author_block.dart`)
- `ShiftPauseList` — список пауз смены (переиспользуется в персональной и орг-детали) (файл: `lib/widgets/shift_pause_list.dart`)
- `WorkLocationLine` — компактная строка «📍 название точки» (приглушённый цвет, ellipsis) для карточек смен — история и орг-смены (файл: `lib/widgets/work_location_line.dart`)
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

## Штрафы (fines)

Фича `fines` (`../docs/tasks/fines/mobile.md`, смержено `50c1824`):
- **Домен/инфра** `penalty/`: `PenaltyTemplate`/`Penalty`/`MyPenalty` + `Create/UpdatePenaltyInput`; `PenaltyDataSource` (шаблоны, CRUD штрафов, my-penalties), `PenaltyRepositoryImpl` (`Task<…>`). Деньги — `int` копейки; пагинация — offset (`DefaultPaginator`). `member_id = OrganizationMember.id`.
- **Payroll/my-earnings** расширены **additive** (`penalty_amount_minor`/`penalties_count`/`net_amount_minor`, `@Default(0)`); query `include_penalties` — только payroll. `net` может быть отрицательным.
- **Cubits**: `MyPenaltiesCubit`, `MemberPenaltiesCubit` (пагинация + снятие), `PenaltyFormCubit`, `ShiftPickerCubit`; `PayrollCubit` — тумблер учёта штрафов.
- **Навигация**: `MyPenaltiesRoute`; модалки `PenaltyFormRoute`/`ShiftPickerRoute` (`CustomRoute`, bottom sheet); дата штрафа — `showDatePicker` (один день).
- **DI**: `PenaltyRepository` создаётся в `success_app` через `RepositoryProvider(create:)` с готовым `dio` (не в локаторе).
- **⚠️ Первое пишущее действие мобильного admin/owner над сотрудником** (назначить/исправить/снять штраф) — раньше мобильный admin был read-only по сотрудникам/сменам; для штрафов сделано явное исключение, одобренное заказчиком.

---

## Ключевые решения

См. `docs/decisions/` для полных ADR.
