# Архитектура — текущее состояние

Последнее обновление: 2026-07-24 (фичи: notifications, employee_tests)

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
- `timezone` (dart-lang) — конвертация UTC → настенное время таймзоны организации (`work_schedules`); данные `latest_10y` (см. раздел ниже)
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
│   │   ├── shift/                 # Shift (+ScheduleFields), Pause, ShiftStats, ShiftOvertimeRequest
│   │   ├── work_schedule/         # WorkSchedule, MySchedules + WorkScheduleRepository (work_schedules)
│   │   ├── notification/          # AppNotification + NotificationRepository (notifications)
│   │   └── employee_test/         # TestAssignment, TestAttempt, TestResult + TestRepository (employee_tests)
│   └── infrastructure/            # Реализации (datasource + dto + mappers + repos)
│       ├── auth/
│       ├── user/
│       ├── organization/
│       ├── organization_role/     # только DTO + mapper (модель вкладывается в Member/Organization)
│       ├── payroll/
│       ├── checklist/
│       ├── file_storage/          # FilesDataSource + FilesRepositoryImpl (без DTO: ответ 1-в-1)
│       ├── shift/
│       ├── work_schedule/         # WorkScheduleDataSource + WorkScheduleRepositoryImpl (work_schedules)
│       ├── notification/          # NotificationDataSource + NotificationRepositoryImpl (notifications)
│       └── employee_test/         # TestDataSource (/my/test-assignments* + /my/test-attempts*) + TestRepositoryImpl (employee_tests)
├── shared/                        # Глобальные cubit'ы вне страниц
│   ├── auth/                      # AuthCubit + AuthState (глобальная авторизация)
│   └── notifications/             # NotificationsCubit + State (глобальный счётчик/лента, notifications)
├── l10n/                          # Локализация (ARB)
├── widgets/                       # Переиспользуемые виджеты
│   ├── app_toast/                 # Toast-уведомления (AppToast, AppToastManager)
│   ├── section_data/              # SectionDataWrapper, SectionLoader, SectionError
│   ├── paginated_section_data/    # PaginatedSectionDataList/Grid/SliverList/SliverGrid
│   ├── storage_image.dart         # Показ файла из file_storage (cache + авто-рефреш presigned)
│   └── notification_bell_button.dart  # Колокольчик+бейдж в аппбаре всех 4 табов (читает глобальный NotificationsCubit, notifications)
└── pages/                         # UI-слой (экраны)
    ├── auth/                      # Login/Register + LoginCubit + _PasswordRequirements
    ├── verify/                    # Верификация email + VerifyCubit
    ├── home/                      # ExampleHome (заглушка, не в основной навигации)
    ├── main_router/               # Bottom tabs router (4 таба)
    ├── notifications/             # Центр уведомлений (root-роут, notifications)
    │   ├── notification_navigation.dart  # Маппинг type → переход (test_assigned → TestAttemptRoute; незнакомый тип — no-op)
    │   ├── view/                  # NotificationsPage (лента + «Прочитать все»; кубит — глобальный, из lib/shared/notifications)
    │   └── widgets/               # _NotificationTile
    ├── shift_tracker/             # Трекер смены (Tab 1 «Смена»)
    │   ├── cubit/                 # ShiftTrackerCubit + State
    │   ├── view/                  # ShiftTrackerPage
    │   └── widgets/               # _IdleShiftContent, _ActiveShiftContent (+_SchedulePlanLine), _OfflineBanner, _OrgSelector, _WorkLocationSelector, _WorkScheduleSelector (work_schedules), _PauseList, _PauseCard, _ShiftActionErrorBar, _ShiftChecklistsTile
    ├── work_schedule_picker/      # Выбор графика при старте смены (CustomRoute, work_schedules)
    │   └── view/                  # WorkSchedulePickerPage (без cubit — список уже загружен ShiftTrackerCubit)
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
    │   ├── cubit/                 # ShiftDetailCubit + State (+организация лениво — таймзона плана; заявка на переработку)
    │   ├── view/                  # ShiftDetailPage
    │   └── widgets/               # _DetailInfoSection (+план/опоздание/причина завершения), _DetailChecklistsSection, _StatusBadge, _OvertimeSection (work_schedules)
    ├── overtime_request/          # Модалка «Добавить переработку» (CustomRoute, work_schedules)
    │   ├── cubit/                 # OvertimeRequestCubit + State (только отправка формы)
    │   └── view/                  # OvertimeRequestPage
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
    ├── my_tests/                  # «Мои тесты» — список назначений (root-роут, employee_tests)
    │   ├── cubit/                 # MyTestsCubit + State
    │   ├── view/                  # MyTestsPage (фильтр по организации, если их >1)
    │   └── widgets/               # _MyTestCard, _OrgFilterRow
    ├── test_attempt/              # Прохождение одного назначения (root-роут, `:assignmentId`, employee_tests)
    │   ├── cubit/                 # TestAttemptCubit + State (резолв старт/резюме/блок, локальный выбор, submit)
    │   ├── view/                  # TestAttemptPage
    │   └── widgets/               # _BlockedView, _FillingView (+_QuestionCard), _ResultView (+_ResultQuestionCard)
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
| `OAuthConfig` | `domain/auth/models/oauth_config.dart` | `google?`/`apple?` (`OAuthProviderConfig`) — публичная конфигурация OAuth-провайдеров для платформы (`oauth_login`) |
| `OAuthProviderConfig` | `domain/auth/models/oauth_config.dart` | `clientId`, `enabled` — `null` у провайдера в `OAuthConfig` = не настроен супер-админом |
| `User` | `domain/user/models/user.dart` | id, name, isVerified, role (UserRole: superAdmin/user), createdAt, email? (nullable — `admin_created_accounts`), phone?, login? (`admin_created_accounts`), `contactLabel` (email или login, вычисляемое) |
| `Organization` | `domain/organization/models/organization.dart` | id, name, ownerId, inviteCode, isDeleted, createdAt, geoCheckEnabled, `timezone` (IANA-имя, `@Default('Europe/Moscow')`, `work_schedules`); `myRole` (OrgMembershipRole: owner/admin/employee, nullable), `myCustomRole` (nullable) |
| `Member` | `domain/organization/models/member.dart` | id, organizationId, userId, userName, userEmail (пустая строка у админ-созданных сотрудников), role (MemberRole: admin/employee), joinedAt, customRole?, userLogin? (`admin_created_accounts`), currentRate? (payroll), `contactLabel` (userEmail или userLogin, вычисляемое) |
| `OrganizationRole` | `domain/organization_role/models/organization_role.dart` | id, name, createdAt (кастомная роль; только для отображения, без write-слоя) |
| `OrgStats` / `EmployeeStats` | `domain/organization/models/org_stats.dart` | агрегаты org (totalWorked, shiftCount, average, perEmployee), period? + rangeFrom/rangeTo |
| `JoinResult` | `domain/organization/models/join_result.dart` | результат присоединения по инвайту |
| `Shift` | `domain/shift/models/shift.dart` | id, userId, startedAt, status (ShiftStatus), pauses, workedSeconds, organizationId?, finishedAt?, hasIncompleteRequiredChecklists; в орг-ответах — userName/userEmail/role/customRoleName; `work_schedules` (все nullable, `null` у персональных смен): `workScheduleId`/`scheduleName` (снимок), `scheduledStartAt`/`scheduledEndAt` (плановое окно, снимок), `lateSeconds`, `finishReason` (`ShiftFinishReason`: manual/autoSchedule, незнакомое/нет → `null`), `overtime` (`ShiftOvertimeRequest?`) |
| `Pause` | `domain/shift/models/shift.dart` | id, shiftId, startedAt, finishedAt? |
| `ShiftOvertimeRequest` | `domain/shift/models/shift_overtime_request.dart` | id, minutes, status (`OvertimeStatus`: pending/approved/rejected), comment, createdAt, reviewComment?, reviewedAt? (`work_schedules`) |
| `ShiftStats` | `domain/shift/models/shift_stats.dart` | totalWorked, shiftCount, average, period? + rangeFrom/rangeTo |
| `WorkSchedule` | `domain/work_schedule/models/work_schedule.dart` | график из эффективного набора сотрудника: id, name, startTime/endTime (`"HH:MM"`, локальное время организации), durationMinutes, crossesMidnight, nextStartAt/nextEndAt (UTC, окно «если начать сейчас»), isCurrent, startsInMinutes (`work_schedules`) |
| `MySchedules` | `domain/work_schedule/models/my_schedules.dart` | ответ `GET .../my-schedules` целиком: items (`List<WorkSchedule>`), total, requireSchedule (`work_schedules`) |
| `ChecklistInstance` / `ChecklistInstanceDetail` / `ChecklistInstanceItem` / `ChecklistItemsSummary` | `domain/checklist/models/checklist_instance.dart` | экземпляры чек-листов смены (`ChecklistInstanceStatus`: pending/completed/incomplete) и их пункты; пункт несёт `photoRequirement`/`photoSource`/`photosCount`/`photos`; detail — `maxPhotosPerItem?`; summary — `satisfiedCount`/`photosRequiredMissing` (прогресс/бейдж по фото) |
| `ChecklistItemPhoto` / `PhotoRequirement` / `PhotoSource` | `domain/checklist/models/checklist_photo.dart` | фото пункта (fileId, presigned url?, capturedAt?/lat/lng, position); enum требования (none/optional/required) и источника (camera/cameraOrGallery, snake-маппинг с безопасным дефолтом) |
| `EffectiveChecklistTemplate` | `domain/checklist/models/effective_template.dart` | эффективный шаблон участника (read-only; `ChecklistTemplateSource`: role/personalAdd); `locationIds` — точки привязки (пусто = везде), аддитивное поле, старый бэк без него → `[]` |
| `ChecklistType` | `domain/checklist/models/checklist_template.dart` | enum shiftStart/shiftEnd |
| `Rate` / `CurrentRate` | `domain/payroll/models/rate.dart` | запись истории ставок / действующая; `RateType` (hourly/perShift); деньги в копейках (int) |
| `Payroll` / `PayrollItem` / `PayrollTotals` / `PayrollPeriod` | `domain/payroll/models/payroll.dart` | отчёт «кому сколько заплатить» за период |
| `MyEarnings` | `domain/payroll/models/my_earnings.dart` | личный заработок за период + currentRate?, hasMissingRate; план/факт (`work_schedules`, `@Default(0)`): `plannedAmountMinor`, `deltaAmountMinor` (`gross − planned`), `overtimeSeconds` (сумма `approved`-заявок) |
| `StoredFile` / `FileCategory` | `domain/file_storage/models/stored_file.dart` | метаданные файла из единого хранилища + presigned `url`/`urlExpiresAt`; enum категорий (checklist_photo/knowledge_base/avatar/other) |
| `KnowledgeNode` / `KnowledgeNodeKind` | `domain/knowledge/models/knowledge_node.dart` | узел дерева базы знаний (id, kind: section/page/unknown, title, icon?, position, allMembers?, children); `unknown` — безопасный фолбэк форвард-компат |
| `KnowledgeNodeDetail` / `KnowledgeBreadcrumb` | `domain/knowledge/models/knowledge_node.dart` | деталь узла: обогащённый `content` (для page) + `breadcrumbs`; для section `content=null` |
| `KnowledgeBlock` (sealed) / `KnowledgeSpan` | `domain/knowledge/models/knowledge_block.dart` | блок контента (heading/paragraph/bulleted_list/numbered_list/quote/callout/divider/image/file/video/table + **`unknown`**-фолбэк); `KnowledgeSpan` — inline rich (bold/italic/underline/strike/code/link) |
| `AppNotification` | `domain/notification/models/app_notification.dart` | id, type, title, isRead, createdAt, body?, payload? (`Map<String, dynamic>?`, форма зависит от `type`, разбирается точечно при переходе); названа не `Notification` — коллизия с `package:flutter/widgets.dart` (`notifications`) |
| `TestTemplateBrief` | `domain/employee_test/models/test_assignment.dart` | мета шаблона теста внутри назначения: id, title, questionCount, maxAttempts, passThresholdPercent, description?, shuffleQuestions (`@Default(false)`, аддитивное — `employee_tests`) |
| `TestAssignmentAttemptBrief` | `domain/employee_test/models/test_assignment.dart` | краткая запись о попытке в истории назначения: attemptNumber, percent, passed, id?/status?(`TestAttemptStatus?`)/submittedAt? (nullable — `backend.md` не гарантирует состав), геттер `isInProgress` (`employee_tests`) |
| `TestAssignment` | `domain/employee_test/models/test_assignment.dart` | назначение теста сотруднику: id, organizationId/organizationName, template (`TestTemplateBrief`), status (`TestAssignmentStatus`: assigned/inProgress/passed/failed/unknown), attemptsUsed, passed, bestPercent?, dueAt?, attempts? (`null` в списке, заполнено в деталях, `employee_tests`) |
| `TestAttemptOption` / `TestAttemptQuestion` | `domain/employee_test/models/test_attempt.dart` | вариант/вопрос — снимок попытки; `isCorrect` — `null` до сдачи либо при `reveal_answers=false`; `TestQuestionType` (single/multiple/unknown, ручной парсинг) (`employee_tests`) |
| `TestAttempt` | `domain/employee_test/models/test_attempt.dart` | попытка прохождения: id, attemptNumber, status (`TestAttemptStatus`: inProgress/submitted/unknown), score/maxScore/percent/passed, startedAt, questions, submittedAt? — используется и для «прохождения», и для «просмотра сданной попытки» (`employee_tests`) |
| `TestSubmitAnswer` | `domain/employee_test/models/test_attempt.dart` | один ответ при `submit`: attemptQuestionId, selectedOptionIds (`employee_tests`) |
| `TestResult` | `domain/employee_test/models/test_result.dart` | ответ `submit`: score/maxScore/percent/passed/passThresholdPercent/attemptsUsed/attemptsLeft/revealAnswers, questions? (разметка верных — только при `revealAnswers=true`) (`employee_tests`) |
| `DefaultPaginator<T>` | `core/models/default_paginator.dart` | hasMore, data, total (универсальная пагинация) |

---

## API DataSources

Все пути относительные; Dio добавляет базовый префикс `/api/v1`.

| DataSource | Base Path | Методы |
|------------|-----------|--------|
| `AuthDataSource` | `/auth` | register, verify, resendCode, login, refresh, logout, getOAuthConfig (`GET /auth/oauth/config?client_type=`), loginWithGoogle (`POST /auth/oauth/google`), loginWithApple (`POST /auth/oauth/apple`) |
| `UserDataSource` | `/users` | getMe, updateMe |
| `OrganizationDataSource` | `/organizations` | getAll, getById, join, getMembers, removeMember (self-leave), getShifts (user_id/status/date_from/date_to), getShiftDetail, getStats (period XOR date_from/date_to) |
| `ShiftDataSource` | `/shifts` | getShifts (date_from/date_to), getStats (period XOR date_from/date_to), startShift (+`work_schedule_id`), pauseShift, resumeShift, finishShift, requestOvertime (`POST /shifts/{id}/overtime`), cancelOvertimeRequest (`DELETE`) — все три (work_schedules) |
| `ChecklistDataSource` | `/organizations/{orgId}` и `/shifts` | getEffectiveTemplates (member, read-only), getShiftChecklists, getInstanceDetail, updateInstanceItem |
| `PayrollDataSource` | `/organizations/{orgId}` | getRates (read), getPayroll, getMyEarnings |
| `FilesDataSource` | `/files` | uploadFile (multipart `file`/`category`/`organization_id`, onSendProgress), getFile (свежий presigned URL) |
| `KnowledgeDataSource` | `/organizations/{orgId}/knowledge` | getTree (`?tree=true`), getNode (деталь узла) — только чтение |
| `WorkScheduleDataSource` | `/organizations/{orgId}` | getMySchedules (`GET .../my-schedules?work_location_id=`) (work_schedules) |
| `NotificationDataSource` | `/notifications` | getNotifications (`limit`/`offset`/`unread`), getUnreadCount, markRead (`POST /{id}/read`), markAllRead (`POST /read-all`) (notifications) |
| `TestDataSource` | `/my/test-assignments`, `/my/test-attempts` | getMyAssignments (`organizationId?`/`status?`), getAssignmentDetail, startAttempt (`POST .../attempts`), getAttempt, submitAttempt (`POST .../submit`) — единый DataSource на обе базы (по образцу `ChecklistDataSource`) (employee_tests) |

> Write-слой org-менеджмента (create/delete/rotateInvite/updateMemberRole/getSettings/updateSettings/getAllOrganizations), управление рабочими точками, ставками и шаблонами чек-листов вынесены в веб-админку — в мобильном API их нет.

---

## Репозитории

| Репозиторий | Зависимости | Методы |
|-------------|-------------|--------|
| `AuthRepository` | AuthDataSource, AuthTokenStorage, AuthStateNotifier | checkAuthStatus, register, verify, resendCode, login, refresh, logout, getOAuthConfig, loginWithGoogle, loginWithApple (общий паттерн «получить токены → сохранить → `authNotifier.authenticated`» вынесен в приватный `_authenticateAndPersist()`, используется в login/verify/loginWithGoogle/loginWithApple) |
| `UserRepository` | UserDataSource | getMe, updateMe |
| `OrganizationRepository` | OrganizationDataSource | getAll, getById, join, getMembers, removeMember (self-leave), getShifts, getShiftDetail, getStats, watchMyOrganizations, fetchMyOrganizations, clearCache |
| `ShiftRepository` | ShiftDataSource | getShifts, getStats, startShift (+`workScheduleId`), pauseShift, resumeShift, finishShift, requestOvertime, cancelOvertimeRequest (work_schedules; зарегистрирован в локаторе, как и раньше) |
| `ChecklistRepository` | ChecklistDataSource | getEffectiveTemplates, getShiftChecklists, getInstanceDetail, updateInstanceItem, addItemPhoto, deleteItemPhoto |
| `PayrollRepository` | PayrollDataSource | getRates, getPayroll, getMyEarnings (всё read-only) |
| `FilesRepository` | FilesDataSource | uploadFile, getFile (платформенный слой `file_storage`; зарегистрирован глобально, потребители — фото чек-листов/база знаний/аватары; UI-показ — виджет `StorageImage`) |
| `KnowledgeRepository` | KnowledgeDataSource | getTree, getNode (всё read-only; файлы блоков рефрешит через `FilesRepository`/`StorageImage`) |
| `WorkScheduleRepository` | WorkScheduleDataSource | getMySchedules (work_schedules; фиче-репозиторий — создаётся в `success_app` через `RepositoryProvider(create:)` с готовым `dio`, НЕ в локаторе, как `PenaltyRepository`/`KnowledgeRepository`) |
| `NotificationRepository` | NotificationDataSource | getNotifications, getUnreadCount, markRead, markAllRead (notifications; фиче-репозиторий — `RepositoryProvider(create:)` в `success_app` с готовым `dio`) |
| `TestRepository` | TestDataSource | getMyAssignments, getAssignmentDetail, startAttempt, getAttempt, submitAttempt (employee_tests; фиче-репозиторий — `RepositoryProvider(create:)` в `success_app` с готовым `dio`) |

> `OrganizationRole` отдельного репозитория не имеет (только DTO+mapper; модель вкладывается в `Member`/`Organization`). `LocationRepository` удалён.

---

## Кубиты (UI State Management)

| Кубит | Статус | Описание |
|-------|--------|----------|
| `MainAppCubit` | Готов | Инициализация приложения |
| `ThemeCubit` | Готов | Управление темой |
| `DebugCubit` | Готов | Debug-информация |
| `AuthCubit` | Готов | Глобальное состояние авторизации (`lib/shared/auth/`) |
| `LoginCubit` | Готов | Login/Register форма с валидацией + OAuth-вход Google/Apple (`oauth_login`, см. раздел ниже) |
| `VerifyCubit` | Готов | Верификация email (код + таймер) |
| `ShiftTrackerCubit` | Готов | Трекер смены: start/pause/resume/finish + таймер; гео-проверка, офлайн/retry; предвыбор и запоминание контекста (`ShiftContextStorage`); выбор графика (work_schedules) — резолв набора по org+точке, автовыбор при 1, обязательный выбор при >1, запоминание (`WorkScheduleContextStorage`), сброс+перезапрос при `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND` |
| `ShiftChecklistsCubit` | Готов | Список чек-листов текущей смены (read) |
| `ChecklistFillCubit` | Готов | Заполнение пунктов (toggle + debounced комментарий) + фото-подтверждения: антифрод-флоу `addPhoto` (image_picker → гео → штамп в изоляте → flutter_image_compress → `POST /files` → привязка), `retryPhoto` (частичный сбой), `removePhoto`; черновики загрузки в стейте, байты — в приватной мапе; read-only для чужой/завершённой смены |
| `ShiftHistoryCubit` | Готов | Пагинированный список смен с фильтрами (статус, диапазон дат через общий пикер) |
| `ShiftStatsCubit` | Готов | Статистика смен: пресет день/неделя/месяц XOR произвольный диапазон; request-token от устаревших ответов |
| `ShiftDetailCubit` | Готов | Детали одной смены; лениво грузит организацию (только когда у смены есть график — таймзона плана), owns отмену заявки на переработку (`cancelOvertimeRequest`) и применение результата модалки подачи (`applyOvertimeRequest`) (work_schedules) |
| `OvertimeRequestCubit` | Готов | Модалка «Добавить переработку»: только отправка формы (`POST /shifts/{id}/overtime`), поля формы — в виджете, как `PenaltyFormCubit` (work_schedules) |
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
| `KnowledgeTreeCubit` | Готов | Дерево базы знаний (read-only); хранит локальную развёрнутость разделов (`expandedIds`) |
| `KnowledgePageCubit` | Готов | Деталь страницы базы знаний (read-only); `KNOWLEDGE_NODE_NOT_FOUND` → error по коду |
| `NotificationsCubit` | Готов | Глобальный кубит (`lib/shared/notifications/`, по образцу `AuthCubit`) — счётчик непрочитанных (грузится в конструкторе, нужен в аппбаре всех 4 табов) + лента (`PaginatedSectionData`, лениво при открытии `NotificationsPage`); `markRead`/`markAllRead` синхронно обновляют и ленту, и бейдж (notifications) |
| `MyTestsCubit` | Готов | «Мои тесты»: пагинированный список назначений + фильтр по организации (`OrganizationRepository.watchMyOrganizations`, скрыт при ≤1 организации) (employee_tests) |
| `TestAttemptCubit` | Готов | Прохождение одного назначения: резолв при входе (продолжить открытую попытку / показать блок «уже сдан»-«лимит исчерпан» / стартовать новую), локальный выбор ответов (`selectSingle`/`toggleMultiple`), `submit`, «Пройти ещё раз»; независим от `MyTestsCubit`/`NotificationsCubit` — только `TestRepository` (employee_tests) |

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
| `NotificationsRoute` | `/notifications` | Центр уведомлений (root, push из колокольчика аппбара любого таба) (notifications) |
| `MyTestsRoute` | `/my-tests` | «Мои тесты» — список назначений по всем организациям (root; `initialOrganizationId?` — предвыбор фильтра из хаба организации) (employee_tests) |
| `TestAttemptRoute` | `/test-attempt/:assignmentId` | Прохождение назначения (root; открывается и из «Мои тесты», и из уведомления `test_assigned`) (employee_tests) |
| `ShiftTrackerRoute` | `/shift` | Трекер смены (Tab 1, initial) |
| `ShiftChecklistsRoute` | `<tab>/shifts/:shiftId/checklists` | Чек-листы смены (push; в табах Смена/История) |
| `ChecklistFillRoute` | `<tab>/shifts/:shiftId/checklists/:instanceId` | Заполнение чек-листа (push); `organizationId?` для загрузки фото, `readOnly` для чужой/завершённой смены |
| `ChecklistPhotoViewerRoute` | `/checklist-photo-viewer` | Полноэкранный вьюер фото (root, поверх табов; `photo_view` зум/пан/свайп, удаление) |
| `ChecklistPhotoSourceRoute` | `/checklist-photo-source` | Bottom-sheet выбора источника фото (камера/галерея) для `camera_or_gallery` |
| `WorkSchedulePickerRoute` | `shift/work-schedule-picker` | Выбор графика при старте смены (CustomRoute, `WorkSchedulePickerResult?`, work_schedules) |
| `ShiftHistoryRoute` | `/history` | История смен (Tab 2, initial) |
| `ShiftDetailRoute` | `/history/detail` | Детали смены (push) |
| `OvertimeRequestRoute` | `/history/detail/overtime-request` | Модалка «Добавить переработку» (CustomRoute, `ShiftOvertimeRequest?`, work_schedules) |
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
| `KnowledgeTreeRoute` | `<org-base>/knowledge-base` | Дерево базы знаний (org_member, read-only) |
| `KnowledgePageRoute` | `<org-base>/knowledge-base/:nodeId` | Страница базы знаний — нативный рендер блоков (`initialTitle?`) |

> `<org-base>` = `detail/:orgId` (таб «Организации») или `org-detail/:orgId` (таб «Профиль»).
> CustomRoute-модалки строятся через `ModalBottomSheetRoute` (`_modalBottomSheetBuilder`).

Удалены (нет в роутере): `CreateOrgRoute`, `OrgSettingsRoute`, `WorkLocationsRoute`, `AddEditLocationRoute`, `RolesRoute`, `ChecklistTemplate*Route`, `RateFormRoute`, `SuperAdminRoute`.

**Guard**: Если не авторизован → редирект на `LoginRoute` (через `redirectUntil`)

---

## Web-поддержка

Приложение собирается под web (`flutter build web`). Платформенные различия изолированы через `kIsWeb` и conditional import.

**Что сделано в клиенте:**
- **URL-strategy**: `usePathUrlStrategy()` (без `#` в адресе) — `lib/core/web/url_strategy.dart` через conditional export (`url_strategy_web.dart` / `url_strategy_stub.dart`), вызывается из `main.dart`. Зависимость `flutter_web_plugins` в `pubspec.yaml`.
- **Remote Config: defaults + non-blocking fetch (прод-критично для web)**: `lib/app/config/remote_config/remote_config_firebase.dart` задаёт `setDefaults` (`remoteConfigDefaults`: `ENDPOINT_PROD=https://api.smenka.pro` — хост, dio добавляет `/api/v1`; `ENDPOINT_DEV`, `PRIVACY_POLICY`, `MIN_VERSION=0.0.0`, `TECH_WORK=false`) **первым делом**, до `fetchAndActivate`. На web нет кэша RC — без дефолтов пустой `endPoint` = мёртвое приложение. `init()` ловит исключения **широко** (на web `firebase_remote_config_web` не оборачивает реджекты в `FirebaseException`), а `RemoteConfigInitializer` оборачивает `init()` в `timeout(8s)` + `.catchError` — старт не блокируется и регистрация сервиса гарантирована. Бэкстоп: `MainAppCubit` бросает `AppConfigException` при пустом `endPoint` → понятный экран ошибки (`error_app.dart`), не белый.
- **Remote Config cache cleaner**: conditional import `dart:io` — `lib/app/config/remote_config/remote_config_cache_cleaner_io.dart` (реальная очистка кэша) и `..._stub.dart` (no-op для web, где `dart:io` недоступен).
- **Crashlytics не инициализируется на web**: `MainAppCubit._init` пропускает `CrashlyticsInitializer()` под `if (!kIsWeb)`; в `TalkerInitializer` поле `crashlytics` nullable, запись ошибок — `crashlytics?.recordError/recordFlutterFatalError`.
- **Geolocator на web — работает (HTTPS), ошибки безопасны**: `lib/core/services/geo_service.dart` — `getCurrentPosition` целиком обёрнут в try/catch; отказ/недоступность → структурный результат (`GeoDenied`/`GeoServiceDisabled`) или `GeoError(code: GEO_UNAVAILABLE)`. Код маппится в `error_localization.dart` → локализованный текст вместо сырого исключения; приложение не падает. `openAppSettings`/`openLocationSettings` — no-op на web. Геопроверка зон (`org.geoCheckEnabled`) на web работает как на нативе.
- **Upgrader замьючен на web**: `lib/app/main_app/view/success_app.dart` — проверка версии в сторе включается только когда `!kIsWeb`.
- **Firebase**: `lib/firebase_options.dart` содержит web-конфиг (`FirebaseOptions web`); файл закоммичен (для web эти значения не секрет — уезжают в бандл; защита — Auth + Security Rules; нужен CI-чекауту).
- **CSP-meta в `web/index.html`**: ограничивает источники (self + `api.smenka.pro` + домены Firebase/Google + объектное хранилище). `'wasm-unsafe-eval'` для CanvasKit; eval/`new Function` не нужны, т.к. web собирается с `--csp` (см. `Dockerfile`/`Makefile`). In-app картинки на CanvasKit идут через `connect-src` (XHR), не `img-src`.
- **Воспроизводимая сборка + Docker-образ web**: `Dockerfile` (multi-stage: `cirruslabs/flutter:3.41.2` → `flutter build web --release --csp` → `nginx:1.27-alpine` со SPA-fallback, конфиг `nginx.conf`), `make build-web`/`make docker-web`, CI `.github/workflows/release-web.yml` (push `main`/тег → `ghcr.io/becandier/smenka_web`) и `ci.yml` (analyze+test на PR).

**Вне клиента (нужно на стороне инфраструктуры):**
- CORS на бэке для домена web-хостинга (готово — фича `web_cors`).
- DevOps корня: сервис `web` в `docker-compose.prod.yml`, Caddy `reverse_proxy web:80`, DNS `app.smenka.pro` (см. `../docs/DEPLOY_AUDIT.md`).
- `flutter_secure_storage` на web использует IndexedDB — JWT-токены доступны JavaScript (не Keychain/Keystore, как на native) — осознанный MVP-риск; «правильно» = httpOnly-cookie (отдельная будущая фича).

---

## Выбор и подготовка фото: `PhotoPickerService`

Единая точка выбора + подготовки фото (`lib/core/services/photo_picker_service.dart`). Спроектирован по образцу `GeoService`: **никогда не бросает** — всегда возвращает типизированный `sealed`-результат. Пока единственный потребитель — заполнение чек-листов (`ChecklistFillCubit`), но сервис общий (аватарки и др. в будущем).

**Контракт.** `pickPhoto({required PhotoSource source, int maxSide = 1600, int quality = 88})` → `PhotoPickResult`:
- `PhotoPickSuccess(bytes, sourceName?, sourceMimeType?, unprocessed)` — кадр выбран, прочитан, подготовлен (JPEG, ориентация впечатана). **Меньшая** сторона приведена к ~`maxSide`; большая сторона **не гарантируется** — `compressWithList` расходится по платформам (native скейлит по min-сторонам: `4032×3024 → 2133×1600`; web 0.1.5 капит только ширину). Точный кап по большей стороне делает потребитель (`burnStamp`, см. ниже). `unprocessed=true` — ресайз не удался, отданы исходные байты (web-fallback).
- `PhotoPickCancelled` — пользователь закрыл пикер (НЕ ошибка: ни тоста, ни лога уровня error).
- `PhotoPickFailure` (sealed) с машинным `code`: `PhotoPermissionDenied` / `PhotoReadFailed` / `PhotoFileEmpty` / `PhotoDecodeFailed` / `PhotoPickFailed`. Коды маппятся в `error_localization.dart` → локализованный тост. Как у `GeoResult`, это **обычные Dart sealed** (без freezed), `detail` — сырой `e.toString()` только для логов.

**Пайплайн (3 этапа, точечная классификация, финальный `on Object` — последний рубеж → `PhotoPickFailed`):**
1. **pick** — `ImagePicker.pickImage(source:)` **без** `imageQuality`/`maxWidth`: любой из них форсирует в `image_picker_for_web` полный canvas-пере-энкод каждого кадра (~48 МБ RGBA на iOS Safari, риск зависания при `toBlob → null`); единственный ресайз — на этапе 3. Ловим `on PlatformException` (маппинг `camera_access_denied`/`photo_access_denied` → `PhotoPermissionDenied`), затем `on Object` (JS-интероп `web.Event` из onerror — не Dart `Exception`).
2. **read** — `XFile.readAsBytes()`, `on Object` + **один ретрай** через `readRetryDelay`; `bytes.isEmpty` → ретрай → `PhotoFileEmpty` (кейс iOS Safari).
3. **prepare** — `FlutterImageCompress.compressWithList` (единственный проход ресайза). Проверка `resized.isEmpty` (кейс `toDataURL → "data:,"` на iOS Safari — пустые байты без исключения). **Fallback только web**: сбой/пустой результат → `PhotoPickSuccess(bytes: original, unprocessed: true)` (браузерные/iOS-камеры отдают валидный JPEG — лучше загрузить неужатый кадр, чем блокировать сотрудника). На native → `PhotoDecodeFailed` (сбой = битый кадр / возможен HEIC, который сервер/штамп не переварят).

**Почему `on Object`, а не `on Exception`:** JS-интероп-ошибки на web (`DOMException` от `createImageBitmap`, `web.Event` из onerror пикера) не реализуют Dart `Exception` — `on Exception` пропускает их как uncaught без фидбека.

**Антифрод-штамп — вне сервиса** (`lib/pages/checklist_fill/cubit/photo_processing.dart` → `burnStamp`). Штамп зависит от результата `GeoService`, который кубит запрашивает уже после показа плейсхолдера, — пайплайн всё равно разрывается на границе «подготовленные байты». `photo_processing.dart` после миграции содержит только `burnStamp` (decode/draw/encode через `compute`); ресайз ушёл в сервис (двойной canvas-проход исчез). Именно `burnStamp` даёт **точный кап 1600px по большей стороне** (`copyResize`, только вниз, без апскейла) — сервис его не гарантирует. Декод — `img.decodeImage` (не `decodeJpg`): на web-fallback-пути (`unprocessed:true`) приходят оригинальные байты галереи, которые могут быть PNG/WebP; `null`-декод трактуется как ошибка (`PhotoStampException`), а не «вернуть кадр как есть» — нештампованный кадр не должен уехать на сервер (антифрод). Кубит по `catch`-пути делает `_removeDraft` + `PHOTO_DECODE_FAILED`.

**Логирование (`PhotoLogger`, `lib/core/services/photo_logger.dart`).** По образцу `GeoLogger`: `step(msg)` — debug-консоль под `kDebugMode` + крошка Crashlytics `[photo] ...` в любой сборке; плюс `error(stage, e, st)` — non-fatal `FirebaseCrashlytics.recordError(..., reason: 'photo/$stage', fatal: false)` с настоящим исключением и стеком (главный инструмент диагностики, которого не хватало). В крошки **не** пишутся байты кадра — только этап, `runtimeType`, длины, `name`/`mimeType`. `PhotoLogger.silent()` — для тестов. Crashlytics на web не инициализируется — прод-телеметрия web (второй sink) вне scope; логгер спроектирован под её добавление без правок сервиса.

**Зависимость от CSP.** На web `readAsBytes()` читает выбранный кадр по `blob:`-URL через XMLHttpRequest — регулируется `connect-src`. `web/index.html` содержит `blob:` в `connect-src` (иначе `cross_file` бросает «Could not load Blob from its URL» и фото не прикрепляется ни в одном браузере) — не удалять при аудите CSP.

**Инъекции для тестов:** `picker`, `logger`, `isWeb`, `compressor`, `readRetryDelay`. Юнит-тесты — `test/core/services/photo_picker_service_test.dart` (отмена, permission, не-`Exception` на каждом этапе, ретрай чтения, пустые байты, web-fallback vs native-decode-fail, happy path). Инвариант кубита «любой отказ после показа черновика убирает черновик» — `test/pages/checklist_fill/checklist_fill_cubit_test.dart`.

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
- `AppButton` — кнопка с состоянием загрузки, опц. `icon` (leading-иконка слева от текста, напр. лого OAuth-провайдера; обратно совместим) (файл: `lib/widgets/app_button.dart`)
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

## База знаний (knowledge_base)

Фича `knowledge_base` (`../docs/tasks/knowledge_base/mobile.md`, ветка `feat/knowledge-base-mobile`) — **только-читательский** клиент базы знаний организации (только орг-режим; для всех ролей, сервер фильтрует дерево по ACL).
- **Домен/инфра** `knowledge/`: `KnowledgeNode`/`KnowledgeNodeDetail`/`KnowledgeBreadcrumb`, sealed `KnowledgeBlock` (11 типов + `unknown`-фолбэк) и `KnowledgeSpan`; `KnowledgeDataSource` (getTree `?tree=true`, getNode), `KnowledgeRepositoryImpl` (`Task<…>`). DTO + extension-mapper; `content` хранится сырым (`List<dynamic>?`) и разбирается диспетчером по `type` с `whereType`-фильтрацией (forward-compat: битый/неизвестный блок не роняет страницу).
- **Cubits**: `KnowledgeTreeCubit` (дерево + локальная развёрнутость `expandedIds`), `KnowledgePageCubit` (деталь страницы). Независимы; ошибки строго по `error.code` (`KNOWLEDGE_NODE_NOT_FOUND` → «Материал недоступен»).
- **Экраны**: `KnowledgeTreePage` — раскрываемое дерево (любой узел с детьми раскрывается; страница открывает контент — контракт: и section, и page могут иметь детей); `KnowledgePageScreen` — нативный рендер блоков (heading/paragraph/списки/quote/callout/divider/table/inline-rich; `image` через `StorageImage`; `file` — карточка, открытие свежим presigned url через `FilesRepository.getFile`; `video` — обложка YouTube + open во внешнем браузере через `url_launcher`).
- **Файлы блоков** — по presigned url через платформенный `file_storage` (`StorageImage`/`FilesRepository`); голый `file_id` не показывается; `url=null` дотягивается по `fileId`.
- **Навигация**: `KnowledgeTreeRoute`/`KnowledgePageRoute` в `_orgDetailRoutes`; точка входа — пункт «База знаний» в `_org_navigation_section` (для всех ролей). **DI**: `KnowledgeRepository` создаётся в `success_app` через `RepositoryProvider(create:)` с готовым `dio`.
- **Read-only гарантия**: ни одного пишущего вызова (POST/PATCH/DELETE/PUT, POST /files) по базе знаний; управление узлами/блоками/ACL — только веб-админка.
- **Решение**: `KnowledgeNodeKind` парсится вручную (`_parseKind` switch с фолбэком `unknown`), а не через `@JsonValue`/json_serializable — в проекте нет прецедента `@JsonValue`, конвенция — ручной маппинг enum (как `FileCategory.fromValue`); поведение (строгие snake-строки + безопасный фолбэк) контракту соответствует. `video` показан обложкой+внешним открытием (без `youtube_player_flutter`/webview) — допустимый спецификацией путь, без тяжёлых нативных зависимостей в read-only вьюере.

---

## OAuth-вход (Google/Apple)

Фича `oauth_login` (`../docs/tasks/oauth_login/mobile.md`) — вход/регистрация через Google (iOS+Android+web) и Apple (iOS+web; **не Android** — продуктовое решение от 2026-07-02) как альтернатива email/паролю на `LoginPage`. Web-сборка мобилки (`app.smenka.space`) поддержана с 2026-07-06 — изначально `kIsWeb` полностью исключал OAuth, но это тот же Flutter-код, что и мобилка, и владелец продукта расширил scope после живой проверки.

- **Домен/инфра**: `OAuthConfig{google?, apple?}` + `OAuthProviderConfig{clientId, enabled}` (`domain/auth/models/oauth_config.dart`) + DTO (`infrastructure/auth/datasource/dto/oauth_config_dto.dart`) + маппер (`infrastructure/auth/mappers/oauth_config_mapper.dart`). `AuthRepository` расширен методами `getOAuthConfig({clientType})`, `loginWithGoogle({idToken, clientType})`, `loginWithApple({identityToken, clientType, email?, name?})` — все три поверх общего `_authenticateAndPersist()` в `AuthRepositoryImpl` (тот же паттерн, что у `login`/`verify`). `AuthDataSource` — новые вызовы `GET /auth/oauth/config?client_type=`, `POST /auth/oauth/google`, `POST /auth/oauth/apple`.
- **`LoginCubit`**: конструктор — только `required AuthRepository authRepository` (без доп. зависимостей); в конструкторе фоном (`unawaited`) запускается `_loadOAuthConfig()`. Прямая интеграция нативных SDK `google_sign_in: ^7.2.0` и `sign_in_with_apple: ^8.1.0` — без отдельного Service-слоя (решение ТЗ). `enum LoginResult` расширен значением `cancelled` (пользователь закрыл системный диалог OAuth, повторный тап во время загрузки, неподдерживаемая платформа — ошибка не показывается).
  - **Платформенная логика конфига**: iOS и web — один запрос (`client_type=ios`/`client_type=web` соответственно, отдаёт и google, и apple). Android — **только один** запрос `client_type=android` для Google (Apple на Android не запрашиваем и не показываем).
  - **⚠️ Технический нюанс (не буквально из ТЗ, а из требований `google_sign_in` v7 на Android)**: `serverClientId` для получения `id_token` на Android берётся из ответа `GET /auth/oauth/config?client_type=android` (`google.clientId`), а не «зашивается» в приложение — `google_sign_in` v7 на Android отдаёт `id_token` только при явном `serverClientId`, и по требованиям Google это должен быть Web-тип OAuth-клиента (аудиенс токена всегда Web, не Android-специфичный клиент).
  - **⚠️ Google на web устроен иначе, чем на iOS/Android**: `GoogleSignIn.instance.authenticate()` на web бросает `UnsupportedError` — GIS SDK разрешает вход только через свой рендер-виджет. Поэтому `signInWithGoogle()` на web — no-op (`if (kIsWeb) return LoginResult.cancelled`); реальный флоу — `_loadOAuthConfig()` после получения `client_type=web`-конфига вызывает `GoogleSignIn.instance.initialize(clientId: ...)` и подписывается на `authenticationEvents` (`_initGoogleWebSignIn`/`_handleGoogleWebAuthEvent`), а `LoginPage` рендерит `google_web.renderButton()` (`package:google_sign_in_web/web_only.dart`, добавлен в `pubspec.yaml` явной зависимостью — используется напрямую, не только транзитивно) вместо своей `AppButton`. Подписка отменяется в переопределённом `LoginCubit.close()`.
  - `signInWithApple()` — на iOS и web идентичен (`SignInWithApple.getAppleIDCredential()`), на Android — no-op (`!kIsWeb && !_isIOS` guard). На web дополнительно: `webAuthenticationOptions(clientId, redirectUri: Uri.base.origin)` (текущий домен, без хардкода `app.smenka.space`) и CSRF-защита через `state`-параметр (случайные 16 байт, `credential.state` сверяется с отправленным — та же находка, что уже закрыта в admin-треке для их Apple-кнопки).
  - Ошибки нативных SDK (не-cancel `GoogleSignInException`/`SignInWithAppleAuthorizationException`, любые прочие исключения) маппятся в синтетический клиентский код `OAUTH_CLIENT_ERROR` (не серверный).
  - Guard от гонок: `isClosed`-проверка перед `emit()` в асинхронных завершающих хелперах (cubit может закрыться, пока SDK-диалог висит) + guard `state.isLoading` в начале `signInWithGoogle`/`signInWithApple` (повторный тап не создаёт конкурентный вызов).
- **`LoginState`**: поля `oauthConfig` (`OAuthConfig?`), `activeOAuthProvider` (`OAuthSignInProvider?`, enum `google`/`apple` — для спиннера нужной кнопки); геттеры `googleEnabled`/`appleEnabled`/`showOAuthSection`/`isGoogleLoading`/`isAppleLoading` (`appleEnabled` на Android всегда `false`, т.к. `oauthConfig.apple` там не заполняется).
- **UI**: `LoginPage` — под кнопкой email/password разделитель «или» + кнопки «Продолжить с Google»/«Продолжить с Apple» (видны только если `googleEnabled`/`appleEnabled` — иначе скрыты, не задизейблены). На web кнопка Google — официальный GIS-виджет (свой брендинг, не кастомизируется под тему приложения — требование Google), Apple — обычная `AppButton` (как на iOS). `AppButton` получил опц. `icon` (leading-иконка). Новый ассет `assets/google_logo.svg` (Google — без офиц. ассета Apple, использует `Icons.apple`).
- **Ошибки**: новые коды в `error_localization.dart`/`app_ru.arb` — серверные `INVALID_OAUTH_TOKEN`, `OAUTH_EMAIL_NOT_VERIFIED`, `OAUTH_PROVIDER_UNAVAILABLE` (из `backend.md`) и клиентский `OAUTH_CLIENT_ERROR` (из `LoginCubit`).
- **Безопасность**: `TalkerDioLoggerSettings` в `dio.dart` получил `requestFilter`/`responseFilter`/`errorFilter` — тела запросов/ответов на путях `/auth/*` (пароль, access/refresh_token, id_token/identity_token) целиком исключены из Talker-логов (доступны в проде через debug-экран).
- **Платформенная настройка**:
  - iOS: `ios/Runner/Info.plist` — TODO-заглушки под `GIDClientID` и `CFBundleURLTypes` (`REVERSED_CLIENT_ID`); реальных значений ещё нет. `ios/Runner/Runner.entitlements` (`com.apple.developer.applesignin`) подключён в `project.pbxproj` (`CODE_SIGN_ENTITLEMENTS`) для всех 3 build config таргета Runner.
  - Android: изменений манифеста не требуется — браузерный колбэк Apple Sign-In (`SignInWithAppleCallback` activity/intent-filter) не заводился, т.к. Apple на Android не используется.
  - Web: `web/index.html` — добавлен `<script src="https://appleid.cdn-apple.com/.../appleid.auth.js">` (Apple JS SDK, по документации пакета не грузится лениво, инициализируется сам при загрузке страницы) и расширена CSP (`script-src`/`connect-src`/`frame-src`/`style-src` — домены `accounts.google.com` для GIS, `appleid.cdn-apple.com`/`appleid.apple.com` для Apple JS SDK).
- **Тесты**: `test/pages/auth/login_cubit_test.dart` — группа «LoginCubit OAuth config» (7 тестов: одиночный запрос на Android только для Google + `signInWithApple()` на Android no-op, одиночный на iOS, провайдер не настроен, ошибка запроса конфига не ломает email/password-форму, неподдерживаемая платформа macOS, защита от повторного тапа). Прямые вызовы нативных SDK не юнит-тестируются по существу (untestable без platform-channel мока), а **web-ветки физически недостижимы под стандартным VM-раннером** `flutter test` (`kIsWeb` компилируется в `false` вне web-таргета; нужен `flutter test --platform chrome`, не настроен в проекте) — оба класса верифицируются вручную (устройство/браузер).
- **⚠️ Незакрытые внешние зависимости** (не решаются в этом репозитории, отслеживаются в `../docs/tasks/oauth_login/STATUS.md`, «Открытые вопросы к аналитику»):
  1. реальные `REVERSED_CLIENT_ID`/`GIDClientID`/entitlements-провижининг на стороне Apple Developer консоли и Firebase/GCP (для iOS; web-домены уже закрыты владельцем 2026-07-06);
  2. уточнение в `admin.md`, что для `(google, android)` в `oauth_provider_settings` должен вводиться Web Client ID, а не Android Client ID.

---

## Графики работы и переработки (work_schedules)

Фича `work_schedules` (`../docs/tasks/work_schedules/mobile.md`, ветка `feature/work-schedules`) — выбор графика при старте организационной смены, плановое время + опоздание на активной смене, заявка на переработку на завершённой, план/факт в личном заработке. **Персональные смены не затронуты вообще** (графики/опоздания/переработки на них не распространяются, `scheduled_*`/`late_seconds`/`overtime` у них всегда `null`).

- **Домен/инфра** `work_schedule/`: `WorkSchedule` + `MySchedules` (эффективный набор + `requireSchedule`); `WorkScheduleDataSource` (`GET .../my-schedules?work_location_id=`), `WorkScheduleRepositoryImpl` (`Task<…>`). Fetch без `work_location_id` для org с гео-проверкой (точка ещё не известна — её определит сервер на старте; несовместимость обернётся `SCHEDULE_NOT_AVAILABLE`).
- **`Shift`/`ShiftDto` расширены additive**: `workScheduleId`/`scheduleName` (снимок), `scheduledStartAt`/`scheduledEndAt` (плановое окно, снимок), `lateSeconds`, `finishReason` (`ShiftFinishReason`, ручной парсинг с фолбэком `null` на незнакомое значение — конвенция проекта, не `@JsonValue`), `overtime` (`ShiftOvertimeRequest?`). `ShiftRepository`/`ShiftDataSource` — новый `workScheduleId` в `startShift`, плюс `requestOvertime`/`cancelOvertimeRequest` (`/shifts/{id}/overtime`).
- **`Organization` расширена** полями `timezone` (IANA-имя, `@Default('Europe/Moscow')` на случай устаревшего кэша) и `overtimeRequestDays` (срок подачи заявки на переработку в днях, `@Default(7)`, денормализовано в объект организации тем же принципом, что и `geoCheckEnabled`/`requireWorkLocation`).
- **`ShiftTrackerCubit`** — резолв графиков при выборе org/точки (`_loadSchedules`, request-token от гонок): 0 + `requireSchedule` → блокирует старт с пояснением; 1 → автоподстановка, старт в один тап (не ломает `shift_quick_start`); >1 → выбор обязателен на клиенте всегда (даже при `requireSchedule=false`), запоминается по паре org+точка через `WorkScheduleContextStorage` (аналог `ShiftContextStorage`, но НЕ регистрируется глобально — создаётся на месте из уже доступного в дереве `SharedPreferences`, экономия на DI-плумбинге). `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND` на старте → сброс выбора + перезапрос списка. `canStartShift` учитывает `schedulesLoading` (кнопка неактивна, пока список грузится, — так по ТЗ) только для орг-смен; персональная смена схему вообще не трогает.
- **UI старта**: `_WorkScheduleSelector` (idle-экран, только орг-смена) — skeleton/ошибка+retry/блокирующее сообщение/компактная строка (1)/строка-плейсхолдер (>1); модалка выбора — `WorkSchedulePickerPage` (`work_schedule_picker/`, **без своего cubit**: список уже загружен `ShiftTrackerCubit`, повторный фетч дал бы рассинхрон с уже показанной карточкой). Карточка графика: время `HH:MM — HH:MM` (+ пометка «через полночь»), статус-бейдж («Идёт сейчас»/«начался N мин назад» | «Начнётся через N мин/ч» | плановая дата в таймзоне организации).
- **Активная смена**: строка плана под таймером (`_SchedulePlanLine`) — «По графику: {name}, до {HH:MM}» либо при опоздании «Начало по графику {HH:MM}, опоздание {N} мин» (нейтральный тон, обычный `secondary`-цвет, без алерта). Организация резолвится через новый геттер `ShiftTrackerState.activeShiftOrganization` (по `activeShift.organizationId`, а НЕ по `selectedOrganizationId` — при холодном старте с уже активной сменой предвыбор контекста его не трогает).
- **Завершённая смена** (`shift_detail`): `_DetailInfoSection` — план (org-локальное время), опоздание (если `>0`), причина завершения (только `auto_schedule`); `_OvertimeSection` — статус текущей заявки (`pending`/`approved`/`rejected` + комментарий администратора) и действие («Добавить переработку» / «Отменить заявку»). `ShiftDetailCubit` из чисто синхронного стал грузить организацию лениво (**только** если у смены есть график — таймзона плана) и владеет отменой заявки; подача — отдельная модалка `OvertimeRequestPage`/`OvertimeRequestCubit` (`overtime_request/`, паттерн формы как `PenaltyFormCubit` — своя мутация, кубит родителя применяет результат через `applyOvertimeRequest`). Видимость «Добавить» считается в `ShiftDetailState.canAddOvertime` — клиентское приближение `OVERTIME_NOT_APPLICABLE` (график есть, факт ≤ план, нет активной заявки) плюс проверка срока подачи (`now - finishedAt <= organization.overtimeRequestDays` дней, дни организации грузятся тем же ленивым запросом, что и таймзона); пока организация не загрузилась (idle/loading/ошибка сети) — окно не ограничивается, кнопку не должен прятать сетевой сбой. Сервер в любом случае остаётся последним рубежом: `OVERTIME_PERIOD_EXPIRED` придёт тостом в модалке.
- **«Мой заработок»**: `_PlanVsFactCard` — «По графику» + «Разница» (мягкая формулировка: «Меньше/Больше плана на X ₽», не «недоработал») + согласованная переработка отдельной строкой; карточка скрыта, если `delta == 0 && overtimeSeconds == 0` (график не используется — план всегда равен факту, R8 backend.md, карточка не добавляет информации).
- **Таймзона организации без хардкода смещений**: `core/utils/org_timezone.dart` (`toOrgLocal`) — пакет `timezone` (dart-lang, `data/latest_10y.dart`), НЕ рукописная таблица UTC-офсетов (была бы неверна для зон с переходом на летнее/зимнее время и разошлась бы при следующем изменении правил). Инициализация базы ленивая при первом вызове — чистая Dart-структура без I/O, безопасно на всех платформах, включая web. Невалидное/незнакомое имя зоны → фолбэк на UTC без падения.
- **DI**: `WorkScheduleRepository` — фиче-репозиторий, создаётся в `success_app` через `RepositoryProvider(create:)` с готовым `dio` (как `PenaltyRepository`/`KnowledgeRepository`), НЕ в локаторе. `WorkScheduleContextStorage` — НЕ регистрируется нигде глобально (единственный потребитель `ShiftTrackerPage` создаёт её на месте из `context.read<SharedPreferences>()`).
- **Тесты**: `test/pages/shift_tracker/shift_tracker_cubit_test.dart` (группа «выбор графика при старте» — 0/1/>1, запоминание выбора, `SCHEDULE_NOT_AVAILABLE`, fail-open при сетевой ошибке, персональная смена не трогает графики), `test/pages/shift_detail/shift_detail_cubit_test.dart`, `test/pages/overtime_request/overtime_request_cubit_test.dart`, `test/core/utils/org_timezone_test.dart`.

---

## Центр уведомлений (notifications) и прохождение тестов (employee_tests)

Две связанные фичи одной поставки: `notifications` (`../docs/tasks/notifications/mobile.md`) — переиспользуемый внутри-апповый центр уведомлений (pull-модель, без OS/web-push — см. `backend.md`); `employee_tests` (`../docs/tasks/employee_tests/mobile.md`) — прохождение назначенных тестов сотрудником. Первый и пока единственный тип уведомления — `test_assigned`, что и связывает фичи: назначение теста в админке рождает уведомление → тап по нему открывает прохождение.

**notifications:**
- **Домен/инфра** `notification/`: `AppNotification` (id/type/title/isRead/createdAt/body?/payload?); `NotificationDataSource` (`GET /notifications`, `GET /notifications/unread-count`, `POST /notifications/{id}/read`, `POST /notifications/read-all`), `NotificationRepositoryImpl` (`Task<…>`).
- **`NotificationsCubit`** — **глобальный** кубит уровня приложения (`lib/shared/notifications/`, по образцу `AuthCubit`), не кубит одной страницы: счётчик непрочитанных нужен в бейдже колокольчика на всех 4 табах шелла одновременно, а `NotificationsPage` переиспользует тот же инстанс, чтобы `markRead`/`markAllRead` сразу отражались в бейдже без повторного похода за счётчиком. Счётчик грузится в конструкторе (дёшево, нужен сразу); лента (`PaginatedSectionData`) — лениво, при открытии `NotificationsPage.initState`.
- **UI**: `NotificationBellButton` (`lib/widgets/`) — колокольчик+бейдж (`Badge`, `99+` при переполнении), добавлен в аппбар всех 4 табов (`shift_tracker`, `shift_history`, `organizations`, `profile`); тап → `context.router.root.push(NotificationsRoute())`. `NotificationsPage` — лента pull-to-refresh + пагинация (`PaginatedSectionDataList`), кнопка «Прочитать все» в аппбаре (видна только при `unreadCount > 0`), empty-стейт.
- **Переход по тапу**: `navigateForNotification` (`lib/pages/notifications/notification_navigation.dart`) — маппинг `type → переход`, расширяемый новым `case` без правки остальной ленты; `test_assigned` достаёт `payload['assignment_id']` и пушит `TestAttemptRoute`. Незнакомый (будущий) тип — форвард-совместимость: no-op (уведомление уже помечено прочитанным вызывающей стороной до навигации).
- **DI**: `NotificationRepository` — фиче-репозиторий, `RepositoryProvider(create:)` в `success_app` с готовым `dio` (не в локаторе); `NotificationsCubit` — `BlocProvider` там же, рядом с `ThemeCubit`.
- **Тесты**: `test/data/notification/notification_mapper_test.dart`, `test/shared/notifications/notifications_cubit_test.dart`.

**employee_tests:**
- **Домен/инфра** `employee_test/`: `TestAssignment` (+вложенные `TestTemplateBrief`, `TestAssignmentAttemptBrief`), `TestAttempt` (+`TestAttemptQuestion`/`TestAttemptOption`, снимок вопросов попытки), `TestResult`, `TestSubmitAnswer`; `TestDataSource` — единый DataSource на обе базы `/my/test-assignments*` и `/my/test-attempts*` (по образцу `ChecklistDataSource`), `TestRepositoryImpl` (`Task<…>`).
- **«Мои тесты»** (`my_tests/`, root-роут `/my-tests`): `MyTestsCubit` — пагинированный список назначений + фильтр по организации (скрыт, пока организаций ≤1; список организаций — `OrganizationRepository.watchMyOrganizations`, не завязан на `NotificationsCubit`/другие кубиты). Карточка (`_MyTestCard`): название, статус-чип (assigned/in_progress/passed/failed), «Попытки: N/M», лучший % (если есть), дедлайн (если есть). Точка входа — пункт «Мои тесты» в `_OrgNavigationSection` (хаб организации, предвыбирает `initialOrganizationId`).
- **Прохождение** (`test_attempt/`, root-роут `/test-attempt/:assignmentId`): `TestAttemptCubit` резолвит при входе на экран (без отдельного «продолжить» экрана — всё в одном месте): есть открытая `in_progress`-попытка → резюмирует (`GET .../test-attempts/{id}`); уже `passed`/лимит попыток исчерпан → блокирующий экран (`_BlockedView`) с итогом из уже загруженного `assignment` (без похода за попыткой); иначе — стартует новую (`POST .../attempts`). Гонки (`TEST_ATTEMPT_IN_PROGRESS` при старте — другое устройство/повторный тап) — один переспрос деталей назначения, без риска рекурсии (`allowRaceRetry` пробрасывается `false` дальше). Локальный выбор ответа (`selectSingle`/`toggleMultiple`) живёт в `TestAttemptState.selectedOptionIds` отдельно от снимка вопросов (снимок не мутируется). `shuffleQuestions` — перемешивание на клиенте (`Fisher-Yates` через `List.shuffle()`) при загрузке попытки.
- **Экраны**: `_FillingView` (прогресс «вопрос k из N», `RadioGroup`/`CheckboxListTile` по типу вопроса, кнопка «Завершить»), `_ResultView` (баллы/%,«Зачёт»/«Не зачёт», осталось попыток; при `revealAnswers=true` — разбор по вопросам зелёным/красным; кнопки «Пройти ещё раз» (если есть попытки и не сдан) / «Готово»), `_BlockedView` (единое сообщение по `error.code`: `TEST_ALREADY_PASSED`/`TEST_ATTEMPTS_EXHAUSTED`/`TEST_ATTEMPT_ALREADY_SUBMITTED`/`TEST_TEMPLATE_ARCHIVED`).
- **DI**: `TestRepository` — фиче-репозиторий, `RepositoryProvider(create:)` в `success_app` с готовым `dio` (не в локаторе). `TestAttemptCubit`/`MyTestsCubit` независимы друг от друга и от `NotificationsCubit` — единственная связь фич идёт через навигацию (`navigateForNotification`), не через кубиты.
- **Тесты**: `test/data/employee_test/test_mapper_test.dart`, `test/pages/my_tests/my_tests_cubit_test.dart`, `test/pages/test_attempt/test_attempt_cubit_test.dart` (резолв всех веток входа, локальный выбор, submit успех/ошибка, retry, shuffle).
- **⚠️ Открытые вопросы к аналитику** (не блокируют mobile-трек — обработаны консервативно, отслеживаются в `../docs/tasks/employee_tests/STATUS.md`):
  1. `backend.md` не перечисляет `shuffle_questions` в кратком составе `TestAssignmentOut.template` (список полей в прозе), хотя `mobile.md` явно требует перемешивание на клиенте — поле сделано аддитивным (`TestTemplateBrief.shuffleQuestions`, `@Default(false)`), чтобы не упасть, если бэк его не пришлёт.
  2. `backend.md` описывает состав `GET /my/test-assignments/{id}.attempts[]` прозой («кратко: number, percent, passed, submitted_at») без явного упоминания `id`/`status` по каждой попытке — `TestAssignmentAttemptBrief.id`/`status` сделаны nullable; `TestAttemptCubit` резолвит открытую попытку по `id`, если он есть, иначе полагается на защитные коды ответа `POST .../attempts` (не ходит за несуществующим `id`).
- **Не мобильное**: `last_attempt_id` в `TestAssignmentOut` — расширение для **админского** реестра (`GET .../assignments`), сотрудник видит свои попытки через `MyTestAssignmentDetail.attempts[]`/`GET /my/test-attempts/{id}`; мобильные DTO не менялись.

---

## Вход по логину или email (admin_created_accounts)

Фича `admin_created_accounts` (`../docs/tasks/admin_created_accounts/mobile.md`) — часть сотрудников теперь заводит админ организации со стороны бэкенда/админки: у такой учётки есть логин и пароль, а email может отсутствовать вовсе. Экран входа принимает оба варианта идентификатора; регистрация, верификация и OAuth-вход не меняются — они остаются путём для тех, кто регистрируется сам.

- **`LoginState`**: поле `email` переименовано в `identifier` — в режиме `AuthMode.login` это логин ИЛИ email (сервер сам разбирает), в `AuthMode.register` — строго email, поведение не меняется. Новый геттер `isIdentifierProvided` (непустой после `trim()`) заменяет `isEmailValid` в проверке `isFormValid` для входа; для регистрации `isEmailValid` (формат `x@y.z`) используется как раньше.
- **`LoginCubit.login({login, password})`**: шлёт `state.identifier.trim()` в новый параметр `login` (было `email`). `register()` не изменился по сигнатуре — по-прежнему `email: state.identifier.trim()` (в register-режиме `identifier` — email).
- **`AuthRepository.login`/`AuthDataSource.login`**: параметр `email` → `login`; тело запроса `POST /auth/login` — `{"login": "…", "password": "…"}` (было `{"email": …}`). Обратная совместимость — на стороне бэка (старые билды с полем `email` продолжают работать), не мобилки.
- **UI (`LoginPage`)**: поле email переименовано в `_buildIdentifierField` — при `state.isLogin` label/hint меняются на «Email или логин», клавиатура `TextInputType.text` (не `emailAddress`, без автокапитализации — дефолт `TextField`), без валидации формата; при регистрации — как раньше (`authEmail`/`emailAddress`). Autofill-хинты и их порядок (`AutofillHints.username` первым, `email` запасным) и `finishAutofillContext`-коммит по успеху/`register→needsVerification` **не изменились** — это критично для web (см. `login_autofill_web`/`web_password_update_prompt`), поэтому лейбл/клавиатура переключаются по `state.isLogin` без пересборки `AutofillGroup`/полей на каждый символ (`BlocBuilder.buildWhen` слушает только `mode`/`obscurePassword`, как раньше).
- **Ошибка `INVALID_CREDENTIALS`** (401) — текст обновлён на «Неверный логин или пароль» (`app_ru.arb`), маппинг добавлен в `error_localization.dart` (раньше не был явно замаплен и падал в фолбэк).
- **`User`/`Member` — контакт вместо безусловного email**: `User.email`/`UserDto.email` стали nullable (учётка без email); добавлено `User.login`/`Member.userLogin` (`String?`, заполнено только у админ-созданных учёток, `null` у остальных и у старого бэка — аддитивные поля). `Member.userEmail` остаётся non-null строкой по контракту бэка, но у админ-созданных сотрудников приходит `""`.
- **`resolveContactLabel(email, login)`** (`lib/core/utils/contact_label.dart`) — общий чистый хелпер: email (после `trim`), если непуст, иначе login (после `trim`), иначе `null`. Используется в `User.contactLabel` и `Member.contactLabel` (геттеры на моделях) и подключён во всех местах, где раньше безусловно выводился email: `_ProfileHeader`, `_PersonalInfoSection` (email-поле профиля переключает лейбл на «Логин», когда email пуст), `_MemberTile`, `_HeaderSection` (member_detail), `EmployeePickerPage` — везде через `if (member.contactLabel case final contact?) ...` (или через `contactLabel ?? fallback`), т.е. пустая строка никогда не рендерится как отдельная строка/«—».
- **Не задеты**: `Shift.userEmail`/`OrgStats.userEmail` (списки смен/статистика) — по `backend.md` эти ответы продолжают отдавать `user_email: str` без сопутствующего `login`, `user_login` бэк добавляет только в `MemberResponse`/`UserResponse`/`AdminUserResponse`. `ShiftAuthorBlock` (карточки смен) и без того уже условно скрывал пустую email-строку (`_secondary` показывается только если оба — имя и email — непусты) — регрессии нет, изменений в эти файлы не вносилось.
- **Тесты**: `test/pages/auth/login_cubit_test.dart` (переименованные + новый тест `login()` шлёт `trim(identifier)` в поле `login`), `test/pages/auth/login_state_test.dart` (`isFormValid` для входа по логину/email/пустому значению и для регистрации), `test/data/user/user_mapper_test.dart`/`test/data/organization/member_mapper_test.dart` (`contactLabel` — email/login/оба пусты/старый бэк без поля), `test/core/utils/contact_label_test.dart` (сам хелпер).
- **Обратная совместимость**: бэк продолжает принимать старое тело `{"email", "password"}`, поэтому уже установленные билды продолжают работать; мобилка с новым полем `login` выкатывается только после бэка (см. `../docs/tasks/admin_created_accounts/STATUS.md`, «Порядок выката»).

---

## Ключевые решения

См. `docs/decisions/` для полных ADR.
