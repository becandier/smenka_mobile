# Архитектура — текущее состояние

Последнее обновление: 2026-09-02 (фича: optional_schedule_start)

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
│   ├── services/                  # GeoService (geolocator + пост-диагностика), PhotoPickerService (image_picker/camera)
│   ├── pwa/                       # Промо установки PWA: PwaInstallPlatformApi + web/stub (conditional export), PwaInstallMethod
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
│   ├── notifications/             # NotificationsCubit + State (глобальный счётчик/лента, notifications)
│   └── pwa/                       # PwaInstallCubit + State (промо установки PWA, web-only, pwa_install_promo)
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
    ├── geo_diagnostics/           # «Проверка геолокации» (root-роут, geo_troubleshooting)
    ├── geo_fallback_start/        # Старт смены по фото при недоступной гео (таб «Смена», shift_geo_photo_fallback)
    ├── notifications/             # Центр уведомлений (root-роут, notifications)
    │   ├── notification_navigation.dart  # Маппинг type → переход (test_assigned → TestAttemptRoute; незнакомый тип — no-op)
    │   ├── view/                  # NotificationsPage (лента + «Прочитать все»; кубит — глобальный, из lib/shared/notifications)
    │   └── widgets/               # _NotificationTile
    ├── shift_tracker/             # Трекер смены (Tab 1 «Смена»)
    │   ├── cubit/                 # ShiftTrackerCubit + State
    │   ├── view/                  # ShiftTrackerPage
    │   └── widgets/               # _IdleShiftContent, _ActiveShiftContent (+_SchedulePlanLine), _OfflineBanner, _OrgSelector (только между организациями, myRole != owner), _SingleOrgBadge, _PersonalShiftLink, _LocatingIndicator (shift_start_location_choice), _WorkLocationSelector, _WorkScheduleSelector (work_schedules), _PauseList, _PauseCard, _ShiftActionErrorBar, _ShiftChecklistsTile
    ├── nearby_work_location_picker/  # Выбор точки при пересечении гео-зон (CustomRoute, shift_start_location_choice)
    │   └── view/                  # NearbyWorkLocationPickerPage (без cubit — список уже резолвлен ShiftTrackerCubit)
    ├── work_schedule_picker/      # Выбор графика при старте смены (CustomRoute, work_schedules)
    │   └── view/                  # WorkSchedulePickerPage (без cubit — список уже загружен ShiftTrackerCubit)
    ├── personal_shift_confirm/    # Подтверждение персональной смены при доступных организациях (CustomRoute, shift_org_default)
    │   └── view/                  # PersonalShiftConfirmPage (без cubit — чистое подтверждение)
    ├── shift_checklists/          # Чек-листы текущей смены (push)
    │   ├── cubit/                 # ShiftChecklistsCubit + State
    │   └── view/                  # ShiftChecklistsPage
    ├── checklist_fill/            # Заполнение чек-листа смены (push; read-only для чужой/завершённой смены)
    │   ├── cubit/                 # ChecklistFillCubit + State + ChecklistPhotoDraft + photo_processing (штамп в изоляте)
    │   ├── view/                  # ChecklistFillPage + ChecklistPhotoViewerPage (вьюер) + ChecklistPhotoSourcePage (камера/галерея)
    │   └── widgets/               # _FillItemTile + _ItemPhotosSection (лента превью/кнопка/бейдж/черновики)
    ├── shift_history/             # История смен (Tab 2 «История»)
    │   ├── cubit/                 # ShiftHistoryCubit, ShiftStatsCubit, ShiftHistoryContextCubit (shift_history_scope), ShiftHistoryPeriodCubit + ShiftEarningsCubit (shift_history_earnings) + States
    │   ├── view/                  # ShiftHistoryPage
    │   └── widgets/               # _StatsSection (+_PeriodSelector/_StatsContent/_EarningsSummary), _ShiftFilters, _ShiftCard (+_ShiftEarningsBlock), _FilterChip, _ContextSelector (shift_history_scope)
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
| `Organization` | `domain/organization/models/organization.dart` | id, name, ownerId, inviteCode, isDeleted, createdAt, geoCheckEnabled, `timezone` (IANA-имя, `@Default('Europe/Moscow')`, `work_schedules`); `myRole` (OrgMembershipRole: owner/admin/employee, nullable), `myCustomRole` (nullable); `checklistGraceMinutes?` (`checklist_grace_period`, additive `int?` — минуты окна дозаполнения; бэк контрактно денормализует настройку сюда только по прецеденту `overtimeRequestDays`, для employee без доступа к `/settings`; `null` — поле не пришло, предупреждение при завершении смены окно не упоминает) |
| `Member` | `domain/organization/models/member.dart` | id, organizationId, userId, userName, userEmail (пустая строка у админ-созданных сотрудников), role (MemberRole: admin/employee), joinedAt, customRole?, userLogin? (`admin_created_accounts`), currentRate? (payroll), `contactLabel` (userEmail или userLogin, вычисляемое) |
| `OrganizationRole` | `domain/organization_role/models/organization_role.dart` | id, name, createdAt (кастомная роль; только для отображения, без write-слоя) |
| `OrgStats` / `EmployeeStats` | `domain/organization/models/org_stats.dart` | агрегаты org (totalWorked, shiftCount, average, perEmployee), period? + rangeFrom/rangeTo |
| `JoinResult` | `domain/organization/models/join_result.dart` | результат присоединения по инвайту |
| `Shift` | `domain/shift/models/shift.dart` | id, userId, startedAt, status (ShiftStatus), pauses, workedSeconds, organizationId?, `organizationTimezone?` (IANA-зона, additive, `null` для персональной смены и старого бэка — `shift_timezone_display`, см. `ShiftTimeContext.timeContext()`), finishedAt?, hasIncompleteRequiredChecklists; в орг-ответах — userName/userEmail/role/customRoleName; `work_schedules` (все nullable, `null` у персональных смен): `workScheduleId`/`scheduleName` (снимок), `scheduledStartAt`/`scheduledEndAt` (плановое окно, снимок), `lateSeconds`, `finishReason` (`ShiftFinishReason`: manual/autoSchedule, незнакомое/нет → `null`), `overtime` (`ShiftOvertimeRequest?`) |
| `Pause` | `domain/shift/models/shift.dart` | id, shiftId, startedAt, finishedAt? |
| `ShiftOvertimeRequest` | `domain/shift/models/shift_overtime_request.dart` | id, minutes, status (`OvertimeStatus`: pending/approved/rejected), comment, createdAt, reviewComment?, reviewedAt? (`work_schedules`) |
| `ShiftStats` | `domain/shift/models/shift_stats.dart` | totalWorked, shiftCount, average, period? + rangeFrom/rangeTo |
| `WorkSchedule` | `domain/work_schedule/models/work_schedule.dart` | график из эффективного набора сотрудника: id, name, startTime/endTime (`"HH:MM"`, локальное время организации), durationMinutes, crossesMidnight, nextStartAt/nextEndAt (UTC, окно «если начать сейчас»), isCurrent, startsInMinutes (`work_schedules`) |
| `MySchedules` | `domain/work_schedule/models/my_schedules.dart` | ответ `GET .../my-schedules` целиком: items (`List<WorkSchedule>`), total, requireSchedule; `startableSchedulesAt(now)` — единая выборка графиков по `WorkSchedule.isStartableAt` для всех сценариев старта (`work_schedules`, `optional_schedule_start`) |
| `ChecklistInstance` / `ChecklistInstanceDetail` / `ChecklistInstanceItem` / `ChecklistItemsSummary` | `domain/checklist/models/checklist_instance.dart` | экземпляры чек-листов смены (`ChecklistInstanceStatus`: pending/completed/incomplete) и их пункты; пункт несёт `photoRequirement`/`photoSource`/`photosCount`/`photos`; detail — `maxPhotosPerItem?`, `organizationTimezone?` (IANA-зона, additive self-contained detail response — `shift_timezone_display`, см. `ChecklistTimeContext.timeContext()`); summary — `satisfiedCount`/`photosRequiredMissing` (прогресс/бейдж по фото). И список, и деталь несут `fillAllowed`/`fillDeadlineAt` (`checklist_grace_period`, additive, `@Default(true)`/`null`) — можно ли сейчас редактировать и когда закроется окно дозаполнения после завершения смены; источник `readOnly`/обратного отсчёта на клиенте |
| `ChecklistItemPhoto` / `PhotoRequirement` / `PhotoSource` | `domain/checklist/models/checklist_photo.dart` | фото пункта (fileId, presigned url?, capturedAt?/lat/lng, position); enum требования (none/optional/required) и источника (camera/cameraOrGallery, snake-маппинг с безопасным дефолтом) |
| `EffectiveChecklistTemplate` | `domain/checklist/models/effective_template.dart` | эффективный шаблон участника (read-only; `ChecklistTemplateSource`: role/personalAdd); `locationIds` — точки привязки (пусто = везде), аддитивное поле, старый бэк без него → `[]` |
| `ChecklistType` | `domain/checklist/models/checklist_template.dart` | enum shiftStart/shiftEnd |
| `Rate` / `CurrentRate` | `domain/payroll/models/rate.dart` | запись истории ставок / действующая; `RateType` (hourly/perShift); деньги в копейках (int) |
| `Payroll` / `PayrollItem` / `PayrollTotals` / `PayrollPeriod` | `domain/payroll/models/payroll.dart` | отчёт «кому сколько заплатить» за период |
| `MyEarnings` | `domain/payroll/models/my_earnings.dart` | личный заработок за период + currentRate?, hasMissingRate; план/факт (`work_schedules`, `@Default(0)`): `plannedAmountMinor`, `deltaAmountMinor` (`gross − planned`), `overtimeSeconds` (сумма `approved`-заявок), `lateCount`/`lateSecondsTotal` (опоздания, `earnings_drilldown`); геттер `hasScheduleSignal` (`delta != 0 \|\| overtime != 0 \|\| lateCount != 0`) — единственный источник условия показа блока «Сколько можно было заработать» |
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
| `OrganizationDataSource` | `/organizations` | getAll, getById, join, getMembers, removeMember (self-leave), getShifts (user_id/status/date_from/date_to), getShiftDetail, getStats (period XOR date_from/date_to), getNearbyWorkLocations (`GET .../work-locations/nearby?latitude=&longitude=`, shift_start_location_choice) |
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
| `OrganizationRepository` | OrganizationDataSource | getAll, getById, join, getMembers, removeMember (self-leave), getShifts, getShiftDetail, getStats, getNearbyWorkLocations (shift_start_location_choice), watchMyOrganizations, fetchMyOrganizations, clearCache |
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
| `ShiftTrackerCubit` | Готов | Трекер смены: start/pause/resume/finish + таймер; гео-проверка, офлайн/retry; предвыбор контекста (`shift_org_default`) — дефолт всегда организация (первая доступная, `myRole != owner`), персональная смена только осознанным выбором через `startPersonalShift()` + модалку подтверждения (`PersonalShiftConfirmPage`), не запоминается (`ShiftContextStorage`, только `org_id`); при гео-check — явный выбор рабочей точки по координатам (`shift_start_location_choice`: 0 → `noNearbyWorkLocation`, 1 → авто, >1 → `NearbyWorkLocationPickerRoute`) перед резолвом графика; выбор графика (work_schedules) — резолв набора по org+точке, автовыбор при 1 стартуемом, обязательный выбор при >1 стартуемом, запоминание (`WorkScheduleContextStorage`), закрытые графики не отправляются (`optional_schedule_start`), сброс+перезапрос при `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND` |

| `ShiftTrackerCubit` | Готов | Трекер смены: start/pause/resume/finish + таймер; гео-проверка, офлайн/retry; предвыбор контекста (`shift_org_default`) — дефолт всегда организация (первая доступная, `myRole != owner`), персональная смена только осознанным выбором через `startPersonalShift()` + модалку подтверждения (`PersonalShiftConfirmPage`), не запоминается (`ShiftContextStorage`, только `org_id`); выбор графика (work_schedules) — резолв набора по org+точке, автовыбор при 1 стартуемом, обязательный выбор при >1 стартуемом, запоминание (`WorkScheduleContextStorage`), закрытые графики не отправляются (`optional_schedule_start`), сброс+перезапрос при `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND`; блок дозаполнения чек-листа на idle-экране (`checklist_grace_period`) — после (авто-)завершения смены с незакрытыми обязательными пунктами проверяет окно (`GET /shifts/{id}/checklists`), тикающий отсчёт до серверного `fill_deadline_at`, авто-скрытие по истечении |
| `ShiftChecklistsCubit` | Готов | Список чек-листов текущей смены (read) |
| `ChecklistFillCubit` | Готов | Заполнение пунктов (toggle + debounced комментарий) + фото-подтверждения: антифрод-флоу `addPhoto` (image_picker → гео → штамп в изоляте → flutter_image_compress → `POST /files` → привязка), `retryPhoto` (частичный сбой), `removePhoto`; черновики загрузки в стейте, байты — в приватной мапе; read-only — по серверному `fill_allowed` из детали (`checklist_grace_period`), не по статусу смены; пока смена завершена и окно дозаполнения открыто — тикающий отсчёт от `fill_deadline_at`, по истечении локально уходит в read-only с тем же нотисом, что и `SHIFT_FINISHED` от сервера |
| `ShiftHistoryCubit` | Готов | Пагинированный список смен, фильтр статуса; окно периода (`dateFrom`/`dateTo`, `shift_history_earnings`) и контекст (`scope`/`organizationId`, `shift_history_scope`) приходят извне через `setPeriod`/`setContext` — первая загрузка ждёт оба, смена любого из них сбрасывает пагинацию, фильтр статуса сохраняется |
| `ShiftStatsCubit` | Готов | Статистика смен за окно, заданное извне (`setPeriod`, `shift_history_earnings` — серверный `period` не передаётся); request-token от устаревших ответов; контекст (`scope`/`organizationId`, `shift_history_scope`) приходит извне через `setContext`, независимо от `ShiftHistoryCubit` |
| `ShiftHistoryContextCubit` | Готов | Селектор контекста истории смен (`shift_history_scope`): организации (`myRole != owner`) + «Персональные» + «Все смены»; дефолт — сохранённый маркер (`ShiftHistoryContextStorage`) применяется сразу, иначе первая доступная организация после загрузки, иначе без ограничения; молча откатывается на дефолт, если сохранённая организация пропала из доступных; персистится только осознанный выбор пользователя. Не зависит от `ShiftHistoryCubit`/`ShiftStatsCubit`/`ShiftEarningsCubit` — `ShiftHistoryPage` слушает его и прокидывает контекст в каждый |
| `ShiftHistoryPeriodCubit` | Готов | Единый источник окна периода экрана «История смен» (`shift_history_earnings`): пресеты «Неделя»/«Месяц» (день не показывается) XOR произвольный диапазон; чистое вычисление границ на клиенте (UTC), без сети и без зависимости от других кубитов — `ShiftHistoryPage` прокидывает вычисленные `dateFrom`/`dateTo` в `ShiftHistoryCubit`/`ShiftStatsCubit`/`ShiftEarningsCubit` через `setPeriod` |
| `ShiftEarningsCubit` | Готов | Заработок за период в шапке истории (`shift_history_earnings`, `GET /organizations/{org_id}/my-earnings`); контекст и окно приходят извне через `setContext`/`setPeriod` (тот же приём) — запрос уходит, только когда `scope == organization`, иначе секция молча остаётся пустой (блок не рисуется, это не «0 ₽»); ошибка запроса не трогает остальной экран, `retry()` повторяет |
| `ShiftDetailCubit` | Готов | Детали одной смены; лениво грузит организацию (только когда у смены есть график — таймзона плана), owns отмену заявки на переработку (`cancelOvertimeRequest`) и применение результата модалки подачи (`applyOvertimeRequest`) (work_schedules) |
| `OvertimeRequestCubit` | Готов | Модалка «Добавить переработку»: только отправка формы (`POST /shifts/{id}/overtime`), поля формы — в виджете, как `PenaltyFormCubit` (work_schedules) |
| `OrganizationsCubit` | Готов | Список организаций (watch), присоединение по инвайту, текущий юзер |
| `OrganizationDetailCubit` | Готов | Хаб организации (read-only); единственная мутация — `leaveOrganization` (self-leave) |
| `ProfileCubit` | Готов | Профиль: загрузка юзера, организаций (watch), обновление, logout |
| `MembersCubit` | Готов | Участники: список (read-only; гейтинг UI по роли наблюдателя) |
| `MemberDetailCubit` | Готов | Деталь участника: эффективные чек-листы (read-only) |
| `OrgShiftsCubit` | Готов | Смены сотрудников (пагинация + фильтры: статус, дата, **сотрудник `?user_id`**); грузит таймзону организации отдельным запросом (`organizationTimezone`, shift_timezone_display) — карточки и date-range фильтр в её IANA-зоне, приоритет у собственной зоны смены (`Shift.organizationTimezone`) |
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
| `GeoFallbackStartCubit` | Готов | Фолбэк-старт смены по фото: точка → график → кадр → `POST /files` + `POST /shifts/start` с `geo_fallback_*`; независим от `ShiftTrackerCubit` (связь через результат навигации) (shift_geo_photo_fallback) |
| `GeoDiagnosticsCubit` | Готов | Страница «Проверка геолокации»: состояние разрешений (`GeoService.diagnose`) + ручной тест `getCurrentPosition`; зависит только от `GeoService` (geo_troubleshooting) |
| `PwaInstallCubit` | Готов | Глобальный кубит (`lib/shared/pwa/`) — состояние установки PWA: web? standalone? пойман `beforeinstallprompt`? уже показывали промо? Триггерит разовое промо (`promoRequested`) и прячет точку входа после `appinstalled`; весь браузерный код за `PwaInstallPlatformApi`, на native кубит пустой (pwa_install_promo) |
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
| `GeoDiagnosticsRoute` | `/geo-diagnostics` | «Проверка геолокации» (root; из диалога гео-ошибки на старте смены и из настроек профиля) (geo_troubleshooting) |
| `ShiftTrackerRoute` | `/shift` | Трекер смены (Tab 1, initial) |
| `ShiftChecklistsRoute` | `<tab>/shifts/:shiftId/checklists` | Чек-листы смены (push; в табах Смена/История) |
| `ChecklistFillRoute` | `<tab>/shifts/:shiftId/checklists/:instanceId` | Заполнение чек-листа (push); `organizationId?` для загрузки фото, `readOnly` для чужой/завершённой смены |
| `ChecklistPhotoViewerRoute` | `/checklist-photo-viewer` | Полноэкранный вьюер фото (root, поверх табов; `photo_view` зум/пан/свайп, удаление) |
| `ChecklistPhotoSourceRoute` | `/checklist-photo-source` | Bottom-sheet выбора источника фото (камера/галерея) для `camera_or_gallery` |
| `PwaInstallRoute` | `/install-app` | Промо установки PWA — bottom-sheet (root, поверх табов): разово после первого входа + по иконке в аппбаре главной; только web (pwa_install_promo) |
| `WorkSchedulePickerRoute` | `shift/work-schedule-picker` | Выбор графика при старте смены (CustomRoute, `WorkSchedulePickerResult?`, work_schedules) |
| `NearbyWorkLocationPickerRoute` | `shift/nearby-work-location-picker` | Выбор точки при пересечении гео-зон (CustomRoute, `NearbyWorkLocationPickerResult?`, shift_start_location_choice) |
| `PersonalShiftConfirmRoute` | `shift/personal-shift-confirm` | Подтверждение персональной смены при доступных организациях (CustomRoute, `PersonalShiftConfirmAction?`, shift_org_default) |
| `GeoFallbackStartRoute` | `shift/geo-fallback-start` | Старт смены по фото при недоступной геолокации (push внутри таба «Смена», возвращает `Shift?`) (shift_geo_photo_fallback) |
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
| `MyEarningsRoute` | `<org-base>/my-earnings` | «Мой заработок» (org_member); опциональные `initialDateFrom`/`initialDateTo` (не query, передаются программно через `context.router.push` — `earnings_drilldown`) — открыт из истории смен, стартует на том же окне |
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
- **Geolocator на web — работает (HTTPS), ошибки безопасны**: `lib/core/services/geo_service.dart` — `getCurrentPosition` целиком обёрнут в try/catch; отказ/недоступность → структурный `sealed`-результат `GeoFailure` (`GeoServiceDisabled` / `GeoPermissionDenied` / `GeoPermissionDeniedForever` / `GeoUnavailable` / `GeoInsecureContext` / `GeoUnsupported`) с машинным `code`; UI выбирает текст по типу отказа (`GeoFailureDialog`), а не по сообщению платформы, и приложение не падает. `openAppSettings`/`openLocationSettings` — no-op на web (кнопок настроек web-ветка не рисует). Уровень блокировки на web различает пост-диагностика (`geo_troubleshooting`, раздел ниже). Геопроверка зон (`org.geoCheckEnabled`) на web работает как на нативе.
- **Точность на web — high-first с фолбэком на medium** (`shift_start_location_choice`): первая попытка `LocationAccuracy.high`, короткий таймаут `webHighAccuracyTimeout` (6с, конструкторный параметр рядом с `webTimeout`); любая ошибка/таймаут этой попытки не классифицируется и не долетает до пользователя — код молча уходит в фолбэк `LocationAccuracy.medium`/`webTimeout` (20с, поведение и таксономия ошибок не изменились). Мотивация — мобильный браузер на `medium` отдавал устаревшую позицию по Wi-Fi/вышкам, из-за чего сотрудник, стоящий на точке, получал ложное «вы вне зоны».
- **Upgrader замьючен на web**: `lib/app/main_app/view/success_app.dart` — проверка версии в сторе включается только когда `!kIsWeb`.
- **Firebase**: `lib/firebase_options.dart` содержит web-конфиг (`FirebaseOptions web`); файл закоммичен (для web эти значения не секрет — уезжают в бандл; защита — Auth + Security Rules; нужен CI-чекауту).
- **CSP-meta в `web/index.html`**: ограничивает источники (self + `api.smenka.pro` + домены Firebase/Google + объектное хранилище). `'wasm-unsafe-eval'` для CanvasKit; eval/`new Function` не нужны, т.к. web собирается с `--csp` (см. `Dockerfile`/`Makefile`). In-app картинки на CanvasKit идут через `connect-src` (XHR), не `img-src`.
- **Воспроизводимая сборка + Docker-образ web**: `Dockerfile` (multi-stage: `cirruslabs/flutter:3.41.2` → `flutter build web --release --csp` → `nginx:1.27-alpine` со SPA-fallback, конфиг `nginx.conf`), `make build-web`/`make docker-web`, CI `.github/workflows/release-web.yml` (push `main`/тег → `ghcr.io/becandier/smenka_web`) и `ci.yml` (analyze+test на PR).
- **Промо установки PWA (`pwa_install_promo`)**: весь JS-interop фичи живёт в одном файле `lib/core/pwa/pwa_install_platform_web.dart` (события `beforeinstallprompt` c `preventDefault` + отложенным `prompt()`, `appinstalled`, media query `display-mode: standalone`, легаси `navigator.standalone` и UA-детект iOS/iPadOS). Наружу торчит только `PwaInstallPlatformApi`; на native подключается no-op `pwa_install_platform_stub.dart` (conditional export по `dart.library.js_interop`, как у `url_strategy`), поэтому native-сборки и `flutter test` (VM) браузерного кода не видят. Зависимость `web: ^1.1.1` в `pubspec.yaml` — ровно для этого файла. Состояние — глобальный `PwaInstallCubit` (`lib/shared/pwa/`), отметка «промо показано» — `PwaPromoStorage` (SharedPreferences → localStorage, привязка к браузеру, не к пользователю). UI: разовая модалка `PwaInstallRoute` (`/install-app`), которую пушит шелл `MainRouterPage` по `promoRequested` (задержка 3с — Chromium присылает `beforeinstallprompt` уже после загрузки), и постоянная иконка `PwaInstallButton` в аппбаре трекера смены. Содержимое модалки зависит от браузера: кнопка «Установить» (Chromium), инструкция «Поделиться → На экран „Домой“» (iOS), универсальная подсказка (прочие). В standalone и после `appinstalled` обе точки входа скрыты.

**Вне клиента (нужно на стороне инфраструктуры):**
- CORS на бэке для домена web-хостинга (готово — фича `web_cors`).
- DevOps корня: сервис `web` в `docker-compose.prod.yml`, Caddy `reverse_proxy web:80`, DNS `app.smenka.pro` (см. `../docs/DEPLOY_AUDIT.md`).
- `flutter_secure_storage` на web использует IndexedDB — JWT-токены доступны JavaScript (не Keychain/Keystore, как на native) — осознанный MVP-риск; «правильно» = httpOnly-cookie (отдельная будущая фича).

---

## Выбор и подготовка фото: `PhotoPickerService`

Единая точка выбора + подготовки фото (`lib/core/services/photo_picker_service.dart`). Спроектирован по образцу `GeoService`: **никогда не бросает** — всегда возвращает типизированный `sealed`-результат. Потребители — заполнение чек-листов (`ChecklistFillCubit`) и фолбэк-старт смены по фото (`GeoFallbackStartCubit`, см. раздел `shift_geo_photo_fallback`); сервис общий (аватарки и др. в будущем).

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

**Инъекции для тестов:** `picker`, `logger`, `isWeb`, `compressor`, `cameraProbe`, `readRetryDelay`. Юнит-тесты — `test/core/services/photo_picker_service_test.dart` (отмена, permission, не-`Exception` на каждом этапе, ретрай чтения, пустые байты, web-fallback vs native-decode-fail, happy path). Инвариант кубита «любой отказ после показа черновика убирает черновик» — `test/pages/checklist_fill/checklist_fill_cubit_test.dart`.

---

## Локальное хранение

| Сервис | Хранилище | Данные |
|--------|-----------|--------|
| `AuthTokenStorage` | **flutter_secure_storage** (+ in-memory кэш) | access_token, refresh_token |
| `ThemeLocalStorageApi` | SharedPreferences | Режим темы (light/dark/system) |
| `PendingInviteStorage` | SharedPreferences | pending_invite_code |
| `ShiftContextStorage` | SharedPreferences | last_shift_context — UUID организации (`shift_org_default`: персональный контекст больше не пишется; легаси-значение `personal` при чтении игнорируется и чистится) |
| `ShiftHistoryContextStorage` | SharedPreferences | shift_history_context — контекст таба «История смен» (`shift_history_scope`): UUID организации либо `ShiftScope.personal`/`ShiftScope.all` (`.value`); отдельный ключ от `ShiftContextStorage`, не синхронизируется с контекстом главного экрана; не регистрируется глобально, создаётся на месте в `ShiftHistoryPage` (по образцу `WorkScheduleContextStorage`) |
| `PwaPromoStorage` | SharedPreferences (на web — localStorage) | pwa_install_promo_shown — отметка «разовое промо установки PWA показано»; привязана к браузеру/устройству, переживает перелогин (pwa_install_promo) |

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
- `ShiftPauseList` — список пауз смены (переиспользуется в персональной и орг-детали); принимает обязательный `timeContext` (`AppTimeContext` родительской смены — паузы своей зоны не несут) (файл: `lib/widgets/shift_pause_list.dart`, shift_timezone_display)
- `WorkLocationLine` — компактная строка «📍 название точки» (приглушённый цвет, ellipsis) для карточек смен — история и орг-смены (файл: `lib/widgets/work_location_line.dart`)
- `ChecklistInstanceTile` — плитка экземпляра чек-листа с `onTap` (список чек-листов + read-only блок на детали) (файл: `lib/widgets/checklist_instance_tile.dart`)
- `DateRangeFilterChip` — чип фильтра диапазона дат («01.06 – 09.06» / «с…» / «по…», крестик-сброс); принимает `timeContext` (org-зона экрана либо устройство) — подпись форматируется через `AppTime`, не `.toLocal()`; используется в истории смен, орг-сменах, статистике и payroll-экранах (файл: `lib/widgets/date_range_filter_chip.dart`)
- `PeriodPresetSelector` — селектор окна периода payroll-экранов: SegmentedButton (день/неделя/месяц) + чип произвольного диапазона; тот же обязательный `timeContext` (файл: `lib/widgets/period_preset_selector.dart`)
- `PwaInstallButton` — иконка «Установить приложение» в аппбаре трекера смены; читает глобальный `PwaInstallCubit` и сама схлопывается в `SizedBox.shrink()` вне web / в standalone / после `appinstalled` (файл: `lib/widgets/pwa_install_button.dart`, pwa_install_promo)
- Barrel file: `lib/widgets/_widgets.dart`

### Утилиты дат и денег
- `lib/core/time/app_time.dart` (shift_timezone_display) — единая stateless-точка форматирования и календарных вычислений времени. Sealed `AppTimeContext`: `.organization(timeZone)` (бизнес-событие организации — IANA-зона независимо от устройства) / `.device()` (персональное/платформенное событие). `AppTime`: `wallTime`/`formatDate`/`formatTime`/`formatDateTime`/`utcBoundsForDay(calendarDay, context)` (IANA-сутки контекста, 23/25ч в дни DST — не безусловные 24ч). `.toLocal()` вызывается только внутри `DeviceTimeContext`-ветки — единственное разрешённое место, см. архитектурный guard `test/architecture/time_boundary_test.dart`. Presentation-код не форматирует UTC-момент напрямую через `DateFormat`/`intl` — только через этот интерфейс с явным контекстом (документированные низкоуровневые исключения — сам модуль, `org_timezone.dart`, `date_range_picker_page.dart`)
- `lib/core/utils/org_timezone.dart` — низкоуровневый IANA/DST-движок (`timezone` package: `getLocation`/`TZDateTime`), на котором построен `AppTime` (`toOrgLocal`/`orgUtcDayBounds`); `orgLocalDayDiff` (календарный день-diff, не форматирование) остаётся доступен напрямую presentation-коду графиков (`shift_tracker`/`work_schedule_picker`)
- `lib/data/domain/shift/models/shift_time_context.dart` (shift_timezone_display) — `Shift.timeContext({scopedOrganizationTimezone})`: персональная смена → `device()`; организационная → `Shift.organizationTimezone` (additive backend-поле), при его отсутствии (rolling deploy) — переданная таймзона уже загруженной организации экрана, иначе тоже `device()` (без подстановки угаданной зоны). `lib/data/domain/checklist/models/checklist_time_context.dart` — тот же приём для `ChecklistInstanceDetail` (self-contained detail response)
- `lib/core/models/period_preset.dart` — `PeriodPreset` (day/week/month) + `boundsUtc(nowUtc, AppTimeContext)`: границы пресета (календарные дни явного контекста → UTC через `AppTime.utcBoundsForDay`) для payroll-эндпоинтов без `period`
- `lib/core/utils/money_format.dart` — `formatMoneyMinor` (копейки → «12 345,67 ₽») и `parseRublesToMinor` (строгий разбор ввода ₽ → копейки, без double)
- `lib/l10n/applied_range_label.dart` — подпись применённого окна (`range_from`/`range_to`) в явном `AppTimeContext`, поддерживает открытые границы
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

## Организация по умолчанию при старте смены (shift_org_default)

Фича `shift_org_default` (`../docs/tasks/shift_org_default/mobile.md`, продолжение `shift_quick_start`) чинит прод-баг: сотрудники организаций массово стартовали персональные смены — персональная была равноправным пунктом дропдауна и дефолтом при 2+ организациях, а однажды выбранная запоминалась навсегда. Персональная смена не привязана к организации: не видна руководителю, не попадает в отчёты/начисления, чинится только вручную (`manual_time_entry`). Изменение чисто клиентское — контракты `GET /organizations`/`GET /shifts`/`POST /shifts/start` не меняются.

- **`ShiftTrackerState.availableOrganizations`** — подмножество `organizations`, где `myRole != owner` (по ADR-001 owner НЕ member — старт с `organization_id` такой организации отвечает `403 FORBIDDEN`). `hasOrganizations`/`selectedOrganization` теперь читают именно этот список, а не сырой `organizations.data` — организация, где пользователь только владелец, в селектор не попадает и не предвыбирается.
- **`ShiftTrackerCubit._maybePreselectContext`** — правило инвертировано: (1) сохранённый `org_id` есть среди `availableOrganizations` → подставить; (2) иначе, если доступных организаций одна и более → **первая** (раньше — персональная при 2+, только единственная org предвыбиралась); (3) доступных организаций нет → персональный контекст. Легаси-маркер `ShiftContextStorage.personalMarker` при чтении игнорируется и чистится (`clear()`) — на предвыбор больше не влияет.
- **`ShiftTrackerCubit.selectOrganization(String organizationId)`** — сигнатура стала non-nullable: селектор выбирает только между организациями, «Персональная» ушла из дропдауна. `ShiftContextStorage` хранит только `org_id`, маркер `personal` больше не пишется.
- **`ShiftTrackerCubit.startPersonalShift()`** — отдельный метод для осознанного старта персональной смены поверх открытого организационного контекста: НЕ читает/не трогает `selectedOrganizationId`/`selectedWorkLocation`/`selectedWorkScheduleId` (org-контекст на экране остаётся как есть при отмене), шлёт `POST /shifts/start` без параметров, гео не запрашивает, чистит `ShiftContextStorage` (разовый выбор — на следующем заходе снова правило A).
- **UI idle-экрана** (`_IdleShiftContent`): 0 доступных организаций — как раньше (без селектора/плашки/ссылки, «Начать» стартует персональную). 1 — неинтерактивная плашка `_SingleOrgBadge` («Смена в: {orgName}») вместо селектора. 2+ — `_OrgSelector` без пункта «Персональная», заголовок «Организация». Кнопка «Начать» при наличии организаций всегда стартует организационную смену. Второстепенная ссылка `_PersonalShiftLink` («Начать персональную смену») — блёклым стилем под основной кнопкой, видна только когда есть организационная альтернатива.
- **Подтверждение** (`personal_shift_confirm/`, `PersonalShiftConfirmPage`, `CustomRoute<PersonalShiftConfirmAction?>` bottom sheet): тап по ссылке показывает модалку с предупреждением; основное действие — «Начать в «Name»» (1 org, продолжает обычный флоу `startShift()`) либо «Выбрать организацию» (2+ orgs, просто закрывает модалку, `context.router.maybePop()`); второстепенное — «Всё равно персональную» (`startPersonalShift()`). Закрытие свайпом = отмена, контекст не меняется.
- **Тесты**: группа «предвыбор контекста — инверсия дефолта (shift_org_default)» и «персональная смена при активном орг-контексте» в `shift_tracker_cubit_test.dart` — 2+ орг → первая доступная, пропавший `org_id` → первая доступная, легаси `personal` → игнор+чистка, owner-only org исключена из списка, 0 организаций → персональный контекст без предвыбора, `startPersonalShift()` не трогает org-контекст и чистит storage.

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

### Старт смены только в окне графика (schedule_window_enforcement)

Фича `schedule_window_enforcement` (`../docs/tasks/schedule_window_enforcement/mobile.md`) чинит прод-баг: доступность старта смены раньше зависела только от наличия графика, время окна не учитывалось — после авто-финиша смены в конце окна кнопка «Начать смену» оставалась активной со старым списком графиков до перезагрузки экрана. Бэк теперь отклоняет старт вне окна (`SCHEDULE_WINDOW_CLOSED`) — мобилка сделала доступность старта реактивной.

- **Домен**: `MySchedules.earlyStartMinutes` (`@Default(0)` — обратная совместимость со старым бэком, ещё не отдающим поле) и `WorkSchedule.isStartableAt(now, {earlyStartMinutes})`/`earliestStartAt(earlyStartMinutes)` — правило S1 (`now` в `[next_start_at − early_start_minutes, next_end_at]`, обе границы включительно). `can_start_now` из ответа сознательно НЕ парсится — верен только на момент ответа, мобилка пересчитывает сама.
- **`ShiftTrackerCubit`** — idle-тикер (`Timer.periodic(1s)`, тот же принцип, что и у тикера активной смены): пока нет активной/приостановленной смены, выбрана org и `schedules` успешно загружены, раз в секунду обновляет `ShiftTrackerState.idleNow`, сбрасывает выбор графика, если его окно закрылось (`_resetClosedSelection`), и раз в `_windowCloseRefetchCooldown` (5с, порог по времени, а не «была ли уже свежая загрузка» — устойчиво даже если очередной ответ снова окажется с закрытым окном) перезапрашивает список, если ближайшее окно закрылось (`_maybeRefetchOnWindowClosed`). Старт/стоп тикера синхронизируется в переопределённом `emit()` (`_syncIdleTicker`) — реагирует на любую смену состояния, а не только на явные точки вызова. Принудительный перезапрос графиков — также после авто-финиша смены (`_pollSync`) и при возврате видимости экрана (`onAppResumed`/`onScreenVisible`, общий хвост `_refreshVisibleContext`). `SCHEDULE_WINDOW_CLOSED` на старте — тот же сброс+перезапрос, что и `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND`.
- **`ShiftTrackerState`** — новые геттеры: `scheduleBlockedWindowClosed` (есть графики, но ни один не стартуем сейчас — блокирует старт при `requireSchedule`), `selectedScheduleStillStartable`, `scheduleWindowReasonSource` (график для подписи-причины; сервер сортирует `items` по близости старта, первый элемент — ближайший). `canStartShift` дополнен этими проверками.
- **Возврат на таб «Смена»**: `AutoRouterObserver()` зарегистрирован в `success_app.dart` (`navigatorObservers`), `ShiftTrackerPage` подмешивает `AutoRouteAwareStateMixin` и переопределяет `didChangeTabRoute` → `onScreenVisible()` — `AutoTabsRouter` держит таб живым (`IndexedStack`), поэтому `initState` при возврате не перезапускается.
- **UI**: `_WorkScheduleSelector` приглушает строку (`Opacity`), если показанный график сейчас не стартуем, и показывает подпись-причину под ней («Смену можно начать с {time}» / «График «{name}» закончился. Ближайший старт — завтра в {time}»). `WorkSchedulePickerPage` приглушает и блокирует тап по нестартуемым карточкам, оставляя их видимыми. Общий day-diff helper — `orgLocalDayDiff` (`core/utils/org_timezone.dart`), переиспользован пикером и селектором.
- **Тесты**: группа «окно графика (schedule_window_enforcement)» в `shift_tracker_cubit_test.dart` (через `package:fake_async` — граница `next_end_at`/`next_start_at − early_start_minutes` без перезапроса экрана, сброс выбора, дебаунс перезапроса, `SCHEDULE_WINDOW_CLOSED`, авто-финиш во время фонового поллинга); `test/data/infrastructure/work_schedule/work_schedule_dto_test.dart` (обратная совместимость парсинга `early_start_minutes`).

### Старт без закрытого необязательного графика (optional_schedule_start)

Фича `optional_schedule_start` (`../docs/tasks/optional_schedule_start/mobile.md`) устраняет прод-регрессию: единственный эффективный, но закрытый график раньше автоматически подставлялся в `POST /shifts/start`, поэтому сервер возвращал `SCHEDULE_WINDOW_CLOSED` даже при `require_schedule=false`.

- **Единый алгоритм**: `MySchedules.startableSchedulesAt(now)` фильтрует эффективный набор через существующий `WorkSchedule.isStartableAt`; его используют `ShiftTrackerState`/`ShiftTrackerCubit`, geo-check резолв и `GeoFallbackStartState`/`GeoFallbackStartCubit`. Закрытые графики остаются в `availableSchedules` для информационного UI, но не участвуют в автоподстановке, восстановлении сохранённого выбора и подсчёте обязательности выбора.
- **Optional**: при 0 стартуемых графиков выбор очищен, кнопка остаётся доступной и запрос отправляется без `work_schedule_id`; при 1 стартуемом он выбирается автоматически; при нескольких нужен выбор. Перед каждым `POST /shifts/start` идентификатор дополнительно проверяется по актуальному времени и не отправляется, если окно успело закрыться.
- **Required**: отсутствие эффективных графиков и отсутствие стартуемых графиков остаются разными блокирующими состояниями; валидный старт требует выбранного стартуемого графика. Idle-тикер теперь не только очищает закрывшийся выбор, но и автоматически выбирает единственный график, когда его окно открывается.
- **Geo**: geo-check решает, показывать ли picker, по числу стартуемых графиков и переиспользует уже полученные координаты; geo-fallback применяет ту же выборку после выбора точки и перед отправкой фото-старта. В geo-fallback момент `scheduleNow` обновляется раз в секунду после успешной загрузки, поэтому UI и submit используют один источник времени и не удерживают закрывшееся окно. Кубиты остаются независимыми.
- **Тесты**: регрессии обычного старта, geo-check и geo-fallback покрывают optional/required, закрытый единственный график, смесь открытого и закрытого, очистку сохранённого закрытого выбора, запрос без `work_schedule_id`, открытие/закрытие окна и `SCHEDULE_WINDOW_CLOSED`.

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
- **Снятие назначения админом** (`test_assignment_unassign`): админ может снять назначение в любой момент без уведомления сотруднику — клиент узнаёт об этом только по коду ошибки. `TestAttemptState.unassigned` (+ `TestUnassignedReason.fromValue(errorCode)`) взводится на любом из четырёх путей репозитория (`getAssignmentDetail`/`startAttempt`/`getAttempt`/`submitAttempt`) при коде `TEST_ASSIGNMENT_NOT_FOUND` (снято) или `TEST_TEMPLATE_DELETED` (тест удалён, гонка с soft-delete шаблона) — экран `_UnassignedView` («Тест больше не назначен» / «Тест удалён», без ретраев) вместо технического error-экрана; кнопка — `context.router.maybePop()` (возврат на «Мои тесты» либо назад, если экран открыт из уведомления `test_assigned` — отдельной обработки в ленте не требуется). «Мои тесты»: `onTap` дожидается возврата с `TestAttemptRoute` и перезапрашивает список (`MyTestsCubit.loadAssignments`), чтобы снятая карточка сразу пропала.
- **Экраны**: `_FillingView` (прогресс «вопрос k из N», `RadioGroup`/`CheckboxListTile` по типу вопроса, кнопка «Завершить»), `_ResultView` (баллы/%,«Зачёт»/«Не зачёт», осталось попыток; при `revealAnswers=true` — разбор по вопросам зелёным/красным; кнопки «Пройти ещё раз» (если есть попытки и не сдан) / «Готово»), `_BlockedView` (единое сообщение по `error.code`: `TEST_ALREADY_PASSED`/`TEST_ATTEMPTS_EXHAUSTED`/`TEST_ATTEMPT_ALREADY_SUBMITTED`/`TEST_TEMPLATE_ARCHIVED`), `_UnassignedView` (`AppEmptyState`, см. выше).
- **DI**: `TestRepository` — фиче-репозиторий, `RepositoryProvider(create:)` в `success_app` с готовым `dio` (не в локаторе). `TestAttemptCubit`/`MyTestsCubit` независимы друг от друга и от `NotificationsCubit` — единственная связь фич идёт через навигацию (`navigateForNotification`), не через кубиты.
- **Тесты**: `test/data/employee_test/test_mapper_test.dart`, `test/pages/my_tests/my_tests_cubit_test.dart`, `test/pages/test_attempt/test_attempt_cubit_test.dart` (резолв всех веток входа, локальный выбор, submit успех/ошибка, retry, shuffle, снятие/удаление `TEST_ASSIGNMENT_NOT_FOUND`/`TEST_TEMPLATE_DELETED` на всех четырёх путях).
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

## Прозрачность ручных правок и начисления (manual_time_entry)

Фича `manual_time_entry` (`../docs/tasks/manual_time_entry/mobile.md`) — сотрудник не инициирует ничего сам (создаёт/правит/удаляет смены и заводит начисления только owner/admin из веб-админки); мобилка только **читает и показывает**: пометки на смене, два новых типа уведомлений, экран «Мои начисления», строка в «Мой заработок».

- **`Shift` (additive)**: `isManual`/`isEdited` (`@Default(false)`), `manualNote`, `editedAt`, `createdByName`/`editedByName` (только орг-эндпоинты, в персональном `GET /shifts` — всегда `null`), `isDeleted` (`@Default(false)`) — старый бэк не ломает парсинг.
- **`shift_history`**: карточка (`_ShiftCard`) показывает компактный чип «Добавлена администратором»/«Изменена администратором» (`isManual` приоритетнее `isEdited`), нейтральный цвет `colors.info`, без алармизма.
- **`shift_detail`**: новая секция `_ManualNoticeSection` (`widgets/manual_notice_section.dart`, `part of` — по образцу `_OvertimeSection`) — банер с фактом правки + `manualNote`, если задан. Показывается только при `isManual || isEdited`.
- **Уведомления**: в `notification_navigation.dart` добавлены `case 'shift_manual_changed'` и `case 'payroll_adjustment_changed'`.
  - `shift_manual_changed` → деталь смены. `ShiftDetailPage` принимает уже загруженный объект `Shift` (не id), поэтому переход резолвит смену через `ShiftRepository.getShiftById` (`GET /shifts/{shift_id}`, `shift_self_detail`) по `payload['shift_id']`, затем пушит `ShiftDetailRoute(shift: shift)`; `started_at` из payload не используется. `action == "deleted"` — без перехода (уведомление остаётся информационным). `404 SHIFT_NOT_FOUND` (смена удалена/недоступна) и прочие ошибки → `context.modals.showError(localizedErrorMessage(code: error.code, ...))` — до `shift_self_detail` смена искалась костылём `findShiftByExactStart` (`core/utils/shift_lookup.dart`, точное окно `started_at` через список `GET /shifts`), удалённым этой фичей.
  - `payroll_adjustment_changed` → «Мои начисления». **Расхождение с контрактом**: `NotificationOut`/payload (`{ adjustment_id, action, amount_minor, occurred_at }`) не несёт `organization_id`, а `MyAdjustmentsRoute` требует `orgId` — резолвится клиентом через `OrganizationRepository.getAll()`: ровно одна организация → переход напрямую; несколько — `context.modals.showInfo` с просьбой открыть «Мой заработок» вручную (однозначно определить нельзя).
  - `ShiftDetailRoute`/`MyAdjustmentsRoute` дополнительно зарегистрированы root-уровня (`/shift-detail`, `/my-adjustments/:orgId`) — тот же приём, что уже используют `ShiftChecklistsRoute`/`ChecklistFillRoute` у нескольких родителей: нужны для пуша из `NotificationsPage` (root, без орг/таб-контекста).
- **«Мои начисления»** (`my_adjustments/`, нестед-роут `$orgBase/my-adjustments`) — по образцу `my_penalties`: домен/инфра `adjustment/` (`MyAdjustment`; `AdjustmentDataSource` — только `GET .../my-adjustments`, `AdjustmentRepositoryImpl`); `MyAdjustmentsCubit` (`PaginationMixin`, offset-пагинация, фильтр периода — идентично `MyPenaltiesCubit`). Строка: сумма со знаком (`+` зелёным/`−` красным), основание, дата, комментарий; при наличии `shiftId` — тап ведёт на деталь смены через `ShiftRepository.getShiftById` (`shift_self_detail`), без привязки к `occurred_at` начисления (которое админ мог переопределить независимо от `started_at` смены). CRUD начислений — только веб-админка, вне scope мобилки.
- **`MyEarnings` (additive)**: `adjustmentAmountMinor` (знаковый), `adjustmentsCount` (`@Default(0)`). На экране «Мой заработок» блок `_PenaltiesEarningsCard` расширен строкой начислений (скрыта при `adjustmentsCount == 0`) и кнопкой-ссылкой «Мои начисления» рядом с «Мои штрафы»; «К выплате» (`netAmountMinor`) показывается один раз — в блоке штрафов, если начислений нет, иначе в блоке начислений (бэк уже прислал готовую сумму `gross − penalty + adjustment`, клиент не пересчитывает).
- **DI**: `AdjustmentRepository` — фиче-репозиторий, `RepositoryProvider(create:)` в `success_app` с готовым `dio` (не в локаторе), как `PenaltyRepository`/`NotificationRepository`.
- **Тесты**: `test/data/adjustment/adjustment_mapper_test.dart`, `test/data/shift/shift_manual_fields_mapper_test.dart`, `test/data/payroll/my_earnings_adjustment_fields_mapper_test.dart` (additive-поля + безопасные дефолты). Кубит `MyAdjustmentsCubit` без отдельного теста — как и `MyPenaltiesCubit`, тонкая обёртка над `PaginationMixin`.
- **Не мобильное**: правка/удаление/восстановление смен (A1–A4), CRUD начислений (B1–B4), колонка начислений в орг-отчёте `payroll`/XLSX-экспорте — веб-админка (`admin.md`), вне scope этого трека.

## Деталь собственной смены (shift_self_detail)

Фича `shift_self_detail` (`../docs/tasks/shift_self_detail/mobile.md`) закрывает дыру в API, оставшуюся после `manual_time_entry`: у сотрудника не было эндпоинта «моя смена по id», поэтому оба перехода на деталь смены (из уведомления и из «Мои начисления») искали смену костылём `findShiftByExactStart` (`core/utils/shift_lookup.dart`) — точным окном `started_at` через список `GET /shifts`. Костыль ломался, если админ сдвигал `started_at` смены или переопределял `occurred_at` начисления.

- **`ShiftRepository.getShiftById(shiftId)`** (`ShiftDataSource.getShiftById` → `GET /shifts/{shift_id}`) — своя смена, персональная или орг (где пользователь сотрудник), в том же виде, что и в `GET /shifts` (`created_by_name`/`edited_by_name` — `null`). Чужая/несуществующая/soft-deleted смена → `404 SHIFT_NOT_FOUND`.
- Оба перехода (`notification_navigation.dart._navigateToShift`, `my_adjustments/view/my_adjustments_page.dart._MyAdjustmentTile._openShift`) переведены на `getShiftById`: успех — `context.router.root.push(ShiftDetailRoute(shift: shift))`; ошибка — `context.modals.showError(localizedErrorMessage(code: error.code, fallback: error.message))`, т.е. `SHIFT_NOT_FOUND` показывает «Смена не найдена», а не общий текст (общий l10n-ключ `notificationShiftUnavailable` убран как более не используемый).
- `core/utils/shift_lookup.dart` и `test/core/utils/shift_lookup_test.dart` удалены полностью.
- **Тесты**: `test/data/infrastructure/shift/shift_repository_impl_test.dart` — `getShiftById` мапит DTO в успех и пробрасывает `SHIFT_NOT_FOUND` в `Task.failure`.
- **Не мобильное**: любые действия сотрудника над сменой (правка/восстановление) — их нет по решению заказчика.

---

## Диагностика геолокации (geo_troubleshooting)

Фича `../docs/tasks/geo_troubleshooting/mobile.md`. Проблема прода: на web разрешение геолокации **двухуровневое** — уровень сайта (🔒 в адресной строке) и уровень ОС (macOS «Службы геолокации», Windows «Расположение» — для самого браузера). Если браузеру запрещено системой, сайт получает тот же `PERMISSION_DENIED`, и старый диалог, говоривший только про настройки сайта, заводил в тупик «там уже разрешено → Повторить → та же ошибка».

**Пост-диагностика в `GeoService`** (`lib/core/services/geo_service.dart`):
- `checkPermissionState()` → `GeoPermissionState` (`granted` / `blocked` / `notRequested` / `unknown`). Под капотом — `GeolocatorPlatform.checkPermission()`; на web `geolocator_web` читает `navigator.permissions` и маппит `granted→whileInUse`, `prompt→denied`, `denied→deniedForever`, поэтому обратный маппинг делается здесь один раз и с комментарием. Исключение (нет Permissions API — старый Safari; `ArgumentError` на незнакомом состоянии) → `unknown`, а не падение.
- `diagnoseBlockLevel()` → `GeoBlockLevel`: разрешение есть, а позиции нет → `system` (запрещает ОС/браузер глобально); разрешения нет → `site`; состояние неизвестно → `unknown`.
- `diagnose()` → `GeoDiagnostics(permission, serviceEnabled?)`; `serviceEnabled == null` на web (у браузера нет своего тумблера).
- `GeoSuccess.accuracyMeters` (additive, nullable) — фактическая точность для экрана самопроверки.

> ⚠️ Это **только пост-диагностика**: флоу получения позиции по состоянию разрешения по-прежнему НЕ строится (см. док-стринг `GeoService` — на web `checkPermission`/`requestPermission` лгут до фактического запроса).

**`GeoFailureDialog`** (`lib/widgets/geo/geo_permission_dialogs.dart`) — один диалог на все ветки `GeoFailure` вместо прежних `GeoServiceDisabledDialog`/`GeoDeniedForeverDialog` (они удалены). Текст выбирается по типу отказа + `GeoBlockLevel` (для web-`deniedForever`: «настройки сайта» / «запрещает система» / универсальный текст про оба уровня). Диалог ничего не делает сам — возвращает `GeoFailureAction` (`retry` / `howToFix` / `openAppSettings` / `openLocationSettings`), навигацию выполняет экран. Кнопка системных настроек рисуется только на native (на web она была бы no-op), «Повторить» — везде кроме `GeoUnsupported`.

**`ShiftTrackerCubit`**: гео-отказ кладёт в состояние сам объект `lastGeoFailure` (а не только ветку `StartShiftResult`) и `geoBlockLevel`; пост-диагностика дёргается **только** для `GeoPermissionDeniedForever` (у остальных отказов состояние разрешения ничего не объясняет). Новая попытка старта сбрасывает оба поля. Системные настройки открываются через `openGeoAppSettings`/`openGeoLocationSettings` кубита — второй экземпляр `GeoService` на экране не создаётся.

**Страница «Проверка геолокации»** (`lib/pages/geo_diagnostics/`, `GeoDiagnosticsRoute` — `/geo-diagnostics`, root-уровня): блок «Статус» (разрешение + службы на native), «Тест» (гоняет тот же `getCurrentPosition`, показывает координаты/точность/предупреждение о низкой точности либо классифицированную ошибку) и «Что делать» — платформенные инструкции. `GeoDiagnosticsCubit` зависит только от `GeoService`; после теста статус перечитывается (браузерный prompt мог его изменить), повторный тап во время прогона игнорируется.

Платформа инструкций (`GeoInstructionsTarget`) резолвится из `kIsWeb` + `defaultTargetPlatform`: на web движок Flutter вычисляет платформу по данным браузера — это и есть требуемое ТЗ «по User-Agent», без собственного парсера и js-interop-зависимости. Варианты: web macOS / Windows / Android / iOS(Safari) / прочее + native (там вместо текста — кнопки «Открыть настройки приложения»/«Открыть настройки геолокации»).

**Точки входа**: кнопка «Как исправить» в `GeoFailureDialog` на старте смены и пункт «Проверка геолокации» в настройках профиля (`_SettingsSection`).

**Тесты**: `test/core/services/geo_service_test.dart` (маппинг состояний, уровень блокировки, `diagnose` web vs native, точность), `test/widgets/geo/geo_permission_dialogs_test.dart` (тексты и наборы действий по веткам/уровням/платформам), `test/pages/geo_diagnostics/geo_diagnostics_cubit_test.dart` (резолв платформы, статус, тест, защита от двойного прогона), `test/pages/shift_tracker/shift_tracker_cubit_test.dart` (сохранение отказа, пост-диагностика только для `deniedForever`, сброс на новой попытке).

---

## Старт смены по фото при недоступной геолокации (shift_geo_photo_fallback)

Фича `../docs/tasks/shift_geo_photo_fallback/mobile.md`. `geo_troubleshooting` учит гео чинить; эта фича даёт выход, когда починить не вышло: смена стартует с фото вместо координат и уходит на бэк помеченной — админ разбирается в админке.

**Вход**: действие «Начать по фото» в `GeoFailureDialog` — доступно на **любой** финальной ветке `GeoFailure` и только в организации с геопроверкой (`allowPhotoFallback`). Серверный `GEO_CHECK_FAILED` (координаты получены, сотрудник вне зоны) сюда не приводит вовсе: он прилетает как ошибка действия, а не как `GeoFailure`, — обходить «вне зоны» фотографией нельзя.

**Экран** `GeoFallbackStartRoute` (`shift/geo-fallback-start`) зарегистрирован **внутри таба «Смена»**, чтобы переиспользовать соседние модалки `WorkLocationPickerRoute`/`WorkSchedulePickerRoute` без дублей регистрации. Три шага на одной прокручиваемой странице: точка (обязательна — сервер её не резолвит, координат нет) → график (`my-schedules?work_location_id=…`, правила 0/1/>1 считаются по стартуемому подмножеству; закрытые остаются видимыми) → кадр. Возвращает стартовавшую `Shift` через `pop`.

**`GeoFallbackStartCubit`** ни от каких кубитов не зависит; связь с трекером — только через результат навигации: `ShiftTrackerCubit.adoptStartedShift(shift)` показывает смену активной и запускает таймер. `submit()` грузит `POST /files` (`category=shift_geo_photo`, `organization_id`) и затем `POST /shifts/start` с `geo_fallback_photo_id` + `geo_fallback_reason`. Файл грузится на **каждой** попытке: бэк принимает только непривязанный файл, а после отказа старта его состояние клиенту неизвестно — сирот подберёт штатная чистка. Реакции строго по `error.code`: `GEO_FALLBACK_PHOTO_INVALID` → кадр сброшен, шаг фото заново; `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND`/`SCHEDULE_WINDOW_CLOSED` → выбор сброшен + перезапрос набора.

**Кадр — только съёмка in-app.** Добавлена зависимость `camera` (на web это `getUserMedia` + живое `<video>`-превью): `image_picker` с `ImageSource.camera` для «только съёмки» не годится — на десктопе атрибут `capture` игнорируется и открывается обычный файловый диалог. `CameraController` живёт в виджете `_CameraCapture` (свой жизненный цикл, привязанный к дереву), наружу уходит только снятый `XFile`.

`PhotoPickerService` расширен под этот режим, таксономия та же:
- `isCameraAvailable()` — проба `availableCameras()` (инъекция `cameraProbe` для тестов). Пустой список и любая ошибка = «камеры нет»;
- `preparePhoto(XFile)` — публичный вход в этапы read+prepare для источников, добывающих кадр сами (пайплайн `pickPhoto` теперь делегирует туда же);
- `classifyCaptureError(Object)` — `CameraException` отказа доступа (native-коды + `NotAllowedError`/`PermissionDeniedError` из getUserMedia) → `PhotoPermissionDenied`, прочее → `PhotoPickFailed`.

Выбор файла предлагается **только** когда камеры нет или доступ к ней не дали (`GeoFallbackPhotoMode.file`) — фолбэк фолбэка «мало ли человек с компа сидит», а не равноправный источник.

**Контракт данных**: `FileCategory.shiftGeoPhoto` (`shift_geo_photo`); `ShiftRepository/DataSource.startShift` + `geoFallbackPhotoId`/`geoFallbackReason` (передаются строго вместе и только без координат); `ShiftDto`/`Shift` + additive `geoFallback`/`geoFallbackReason`/`geoFallbackPhotoFileId` (старый бэк → `false`/`null`; в UI сотрудника не выводятся — это для админки). `geo_fallback_reason` — `GeoFailure.code` фактически полученного отказа, никаких строк по месту. Новый код `GEO_FALLBACK_PHOTO_INVALID` замаплен в `error_localization.dart`.

**CSP/разрешения**: правок `web/index.html` не потребовалось — `MediaStream` через `srcObject` под CSP не попадает, а `blob:` в `connect-src` (нужен для чтения снятого кадра) уже был. iOS `NSCameraUsageDescription`/`NSPhotoLibraryUsageDescription` расширены упоминанием старта смены; Android-разрешение `CAMERA` приносит сам `camera_android_camerax`.

**Тесты**: `test/pages/geo_fallback_start/geo_fallback_start_cubit_test.dart` (режим камеры/файла, резолв графика по точке, блокировки старта, happy path с проверкой категории файла и кода причины, сбой аплоада, `GEO_FALLBACK_PHOTO_INVALID`, повторный аплоад, `SCHEDULE_WINDOW_CLOSED`), `test/core/services/photo_picker_service_test.dart` (проба камеры, `preparePhoto`, классификация ошибок камеры), `test/data/shift/shift_geo_fallback_mapper_test.dart` (additive-поля), `test/widgets/geo/geo_permission_dialogs_test.dart` (действие есть на всех ветках `GeoFailure` и отсутствует без разрешения).

---

## Тарифы и подписки (tariffs)

Фича `../docs/tasks/tariffs/mobile.md`. Мобилка тарифами не управляет (оплата/выбор плана — веб-кабинет и админка); её задача — понятные тексты вместо сырых ошибок и ненавязчивый баннер владельцу/админу. Персональный режим не затронут вовсе — там подписки нет.

**Данные**: additive-поле `Organization.subscription` (`OrganizationSubscription?`) — `status` (`enum SubscriptionStatus` со значениями `active`/`trialing`/`pastDue`/`suspended`/`canceled`, парсинг через `value`/`fromValue`, незнакомый статус → `null`, не падение), `daysLeft`, `currentPeriodEnd`, `graceEndsAt`. Модель мапит только подмножество backend-контракта `SubscriptionResponse` — лимиты/фичи/цена мобилке не нужны (гейтинга нет, штрафы видны на всех тарифах, импорт тестов — только в админке). `banner`-геттер на модели — чистая derived-функция, возвращает freezed sealed union `SubscriptionBanner` (trialing + `daysLeft ≤ 5` → `trialEnding(daysLeft)`; `pastDue` → `pastDue(paidUntil, accessUntil)`; `suspended`/`canceled` → `readOnly()`; иначе `null`). Union, а не enum, сознательно: данные для текста уезжают в сам вариант, поэтому «у trialEnding всегда есть `daysLeft`» — свойство типа, а не инвариант в комментарии, и в виджете нет недостижимых null-веток. Протестирован на все статусы.

**Отдельного Cubit нет** — состояние подписки приезжает вместе с организацией. Важная особенность контракта: бэк заполняет `subscription` ТОЛЬКО в `GET /organizations/{org_id}` (единичный fetch, только owner/admin/super_admin) — список организаций (`GET /organizations`), которым живёт `ShiftTrackerCubit`/главный таб «Смена», это поле не содержит никогда, даже для owner/admin (см. `src/app/api/v1/organizations.py`, `list_organizations`). Поэтому баннер размещён на `OrganizationDetailPage` (навигационный хаб организации, единственный экран, уже фетчащий объект с этим полем через `OrganizationDetailCubit._loadOrganization` → `getById`) — без нового Cubit и нового сетевого вызова. Виджет `_SubscriptionBanner` (`pages/organization_detail/widgets/_subscription_banner.dart`) некликабельный, с общей подписью «Продлите тариф в веб-кабинете»; для employee `organization.subscription == null` — виджет не создаётся вовсе, для `active` — `banner == null`, тоже не рисуется.

**Ошибки**: три новых кода в `error_localization.dart` — `SUBSCRIPTION_INACTIVE`/`PLAN_LIMIT_REACHED`/`PLAN_FEATURE_UNAVAILABLE`, тексты без слов «оплата»/«тариф»/«долг» (сотрудник на тариф не влияет). Кнопки завершения/паузы уже начатой смены не трогались — бэк их не блокирует в read-only организации (`require_active_subscription` гейтит только `start_shift`, не `pause`/`resume`/`finish`).

**Находка вне явного текста ТЗ**: `join_by_invite` на бэке проверяет `require_active_subscription` раньше `require_capacity` — вступление по инвайт-коду в приостановленную организацию даёт `SUBSCRIPTION_INACTIVE`, а не только `PLAN_LIMIT_REACHED` (единственный код, упомянутый в mobile.md для этого экрана). `InviteCubit`/`InvitePage` (`invite_links`) раньше сваливали оба тарифных кода в общий бакет `InviteErrorKind.network` (иконка wifi-off, заголовок «Произошла ошибка», сырой `message` с бэка) — заведены отдельные финальные (неповторяемые) состояния `planLimitReached`/`subscriptionInactive` с текстами из `error_localization.dart`.

**Тесты**: `test/data/organization/organization_subscription_mapper_test.dart` (DTO → domain, включая незнакомый статус и отсутствие поля; `banner` на всех статусах), `test/pages/invite/invite_cubit_test.dart` (новые кейсы `PLAN_LIMIT_REACHED`/`SUBSCRIPTION_INACTIVE`).

---

## Фильтр контекста в истории смен (shift_history_scope)

Фича `../docs/tasks/shift_history_scope/mobile.md` — продолжение `shift_org_default`, но для таба «История». После `shift_org_default` главный экран по умолчанию работает в организационном контексте; история — до этой фичи нет: показывала все смены пользователя (персональные + все организации) вперемешку. Контракт `GET /shifts`/`GET /shifts/stats` получил два новых query-параметра — `scope` (`all`/`personal`/`organization`, дефолт `all`) и `organization_id` (обязателен только при `scope=organization`); отсутствие параметра = прежнее поведение (обратная совместимость).

- **`ShiftScope`** (`data/domain/shift/models/shift_scope.dart`) — enum с полем `value` и `fromValue`, значения `all`/`personal`/`organization`; строковых литералов контракта в коде нет. `null` на уровне репозитория/кубитов = параметр `scope` не передаётся вовсе.
- **`ShiftHistoryContextStorage`** (`data/api/local/`) — своё хранилище (ключ `shift_history_context`), НЕ `ShiftContextStorage` главного экрана: выбор истории независим от контекста трекера и не синхронизируется с ним. Не регистрируется глобально — создаётся на месте в `ShiftHistoryPage` из `SharedPreferences` (по образцу `WorkScheduleContextStorage`).
- **`ShiftHistoryContextCubit`** — резолвит контекст (правило): (1) сохранённый маркер валиден (для организации — она среди доступных, `myRole != owner`, ADR-001) → применяется сразу, не дожидаясь загрузки организаций (список смен/статистика уходят с ним немедленно); (2) иначе, после загрузки организаций, доступна хотя бы одна → первая; (3) иначе — без ограничения (селектор скрыт, `scope` не уходит на бэк — для персонального пользователя ничего не меняется). Сохранённая организация пропала из доступных (исключили/удалили/стал owner) → молча правило 2/3, без ошибки и тоста. Персистится только осознанный выбор пользователя (`selectOrganization`/`selectPersonal`/`selectAll`) — авто-резолв и авто-коррекция в хранилище не пишут, по аналогии с `ShiftTrackerCubit._maybePreselectContext`.
- **`ShiftHistoryCubit`/`ShiftStatsCubit`** не знают об источнике контекста: получают его извне через метод `setContext(ShiftScope?, String?)` — смена контекста сбрасывает пагинацию списка, фильтр статуса сохраняется (ортогонален контексту). Дата больше не отдельный фильтр — окно периода унифицировано `shift_history_earnings` (см. ниже).
- **`ShiftHistoryPage`/`_ShiftHistoryViewState`** — координатор: слушает `ShiftHistoryContextCubit.stream` И явно читает его текущее состояние в `initState` (не полагается на один `BlocListener` — тот не увидел бы состояние, если контекст резолвился синхронно ещё внутри конструктора кубита, до подписки любого слушателя), прокидывает в независимые кубиты экрана. Пока контекст не резолвлен — экран показывает общий `SectionLoader` вместо списка/статистики.
- **`_ContextSelector`** (`pages/shift_history/widgets/`) — компактный `PopupMenuButton`-пилюля над фильтрами; пункты: организации (порядок из репозитория) → «Персональные» → «Все смены»; текущий выбор виден без раскрытия списка. Скрыт целиком при `!hasOrganizations`.
- **Тесты**: `shift_history_context_cubit_test.dart` (дефолт без сохранённого выбора, eager-применение сохранённого маркера до загрузки организаций, перепроверка валидности/молчаливый откат, owner-only организация исключена, персонал/all персистятся, авто-резолв не пишет в storage).

## Единый период и заработок в истории смен (shift_history_earnings)

Фича `../docs/tasks/shift_history_earnings/mobile.md` — переработка экрана поверх `shift_history_scope`: раньше на экране было два независимых выбора периода (пресеты «День/Неделя/Месяц» в карточке статистики + отдельный произвольный диапазон в строке фильтров списка), а денег не было вовсе. ADR-005 (`docs/decisions/005-earnings-calculation.md`) фиксирует, что заработок считает только бэк — клиент лишь форматирует готовые суммы.

- **Один блок периода**: пресеты «Неделя»/«Месяц» (день убран) + произвольный диапазон, дефолт — неделя. Управляет списком, статистикой и заработком одновременно; `DateRangeFilterChip` из строки фильтров списка убран, фильтр статуса и `_ContextSelector` остаются на месте.
- **`ShiftHistoryPeriodCubit`/`ShiftHistoryPeriodState`** (новые, независимые) — единственный источник `dateFrom`/`dateTo`. Границы вычисляет клиент через существующий `PeriodPresetBounds.boundsUtc` (`core/models/period_preset.dart`, тот же механизм, что у payroll-экранов); пресет пересчитывает границы синхронно в конструкторе (дефолт — неделя) и в `changePeriod`, произвольный диапазон — `setCustomRange` (допускает открытую границу, обе `null` — возврат к неделе). Серверный параметр `period` в `GET /shifts/stats` не передаётся — только `date_from`/`date_to`, одинаковые для всех трёх запросов экрана.
- **Двойной гейт первой загрузки**: `ShiftHistoryCubit`/`ShiftStatsCubit`/`ShiftEarningsCubit` получают окно через `setPeriod(DateTime?, DateTime?)`, тем же приёмом, что и контекст через `setContext`. Первый запрос уходит, только когда применены ОБА источника (контекст и период) — независимо от порядка, в котором их применит `ShiftHistoryPage._applyContext`/`_applyPeriod` в `initState`. Период вычисляется синхронно при создании `ShiftHistoryPeriodCubit`, поэтому на практике он не блокирует — блокирует только асинхронный резолв контекста.
- **`ShiftEarningsCubit`/`ShiftEarningsState`** (новые, независимые) — заработок за период (`GET /organizations/{org_id}/my-earnings`, контракт не менялся). Запрос уходит, только когда `scope == ShiftScope.organization`; иначе (`personal`/`all`/контекст ещё не пришёл) секция молча остаётся в дефолтном `SectionData` — блок в шапке не рисуется вовсе, это не «заработал 0». Переключение с организации на другой контекст сбрасывает данные предыдущей организации. Ошибка — `SectionData.toError`, не ломает список/время; `retry()` повторяет запрос.
- **`Shift.earnings`** (`data/domain/shift/models/shift_earnings.dart`, `ShiftEarnings`) — новое additive nullable-поле элемента `GET /shifts` (`shift_history_earnings/backend.md`, п.1): `currency`, `grossAmountMinor`, `penaltyAmountMinor`/`penaltiesCount`, `adjustmentAmountMinor`/`adjustmentsCount` (только привязанные к этой смене), `netAmountMinor`, `overtimeSeconds`, `hasRate`. DTO/маппер — по образцу `PauseDto`/`ShiftOvertimeRequestDto` (вложенный DTO в `shift_dto.dart` + extension-маппер в `shift_mapper.dart`). `earnings == null` — персональная смена либо смена не в статусе `finished` (ADR-005 п.6/8); `hasRate == false` — сумма посчитана, но действующей ставки не было (ADR-005 п.3, `gross == 0`, это НЕ «заработал 0»). Клиент нигде не складывает/не вычитает/не округляет `*_amount_minor` — только `formatMoneyMinor` (ADR-005 п.9).
- **UI денег**: в `_StatsSection` — «К выплате» (`net_amount_minor`) крупно + расшифровка (начислено/штрафы/доплаты, штрафы и доплаты скрыты при нуле) + пометка `payrollMissingRateBadge` при `has_missing_rate`, только при `scope == organization`, плейсхолдер (`AppShimmerLoader`) пока грузится отдельно от времени/количества смен. В `_ShiftCard` — `_ShiftEarningsBlock`: `hasRate == false` → `payrollRateNotSet` («Ставка не задана») вместо суммы; иначе — `net_amount_minor` + компактная расшифровка, только если у смены есть штраф/корректировка (`penaltiesCount`/`adjustmentsCount` > 0); `earnings == null` → блока нет вовсе.
- **Пустые состояния списка**: период теперь всегда применён (не отдельный «фильтр» — `ShiftHistoryState.hasFilters` смотрит только на `filterStatus`), поэтому подсказка про контекст (`historyEmptyOrganization`/`historyEmptyPersonal` + `historyEmptyContextHint`) приоритетнее и показывается, пока не включён фильтр статуса; иначе — общий `shiftsEmptyForRange` («нет смен за период»).
- **Тесты**: `shift_history_period_cubit_test.dart` (дефолт-неделя с вычисленными границами, пересчёт при смене пресета, идемпотентность, произвольный диапазон с открытой границей, сброс к неделе), `shift_history_cubit_test.dart`/`shift_stats_cubit_test.dart` (загрузка блокируется до применения ОБОИХ — контекста и периода, независимо от порядка; смена периода перезапрашивает с новыми границами, сохраняя контекст/статус; серверный `period` не передаётся), `shift_earnings_cubit_test.dart` (запрос уходит только при `scope == organization`; ошибка не бросает, `retry()` восстанавливает; смена контекста на неорганизационный сбрасывает данные), `test/data/shift/shift_earnings_mapper_test.dart` (additive-совместимость, `hasRate == false`, отрицательный `net`).

## Короткий итог в истории, подробный расчёт в «Моём заработке» (earnings_drilldown)

Фича `../docs/tasks/earnings_drilldown/mobile.md` — переработка поверх `shift_history_earnings`: история смен показывала деньги с расшифровкой (по ставке/штрафы/доплаты в шапке, мини-расшифровка в каждой карточке), хотя её задача — список смен. Расшифровка переехала туда, где для неё есть место — на «Мой заработок», а история оставляет одну цифру и открывает его по тапу за тот же период. ADR-005 не менялся: бэк по-прежнему единственный, кто считает деньги.

- **История смен, шапка (`_EarningsSummary`/`_EarningsContent`, `stats_section.dart`)**: расшифровка (по ставке/штрафы/доплаты, ранее `Wrap` под суммой) убрана — остаётся только «Заработано» (`net_amount_minor`) + пометка `has_missing_rate`. Блок обёрнут в `Material`/`InkWell` с `Icons.chevron_right` — тап читает актуальный `ShiftEarningsCubit.state` (`organizationId`/`dateFrom`/`dateTo`, уже несёт всё нужное) и пушит `MyEarningsRoute(orgId:, initialDateFrom:, initialDateTo:)`; `organizationId == null` (контекст не организация — блок и не рисуется, но защита есть) — тап молча не срабатывает.
- **Карточка смены (`_ShiftEarningsBlock`, `shift_card.dart`)**: мини-расшифровка (`hasBreakdown`/`_breakdownLabel`) удалена целиком — только сумма (`net_amount_minor`) или `payrollRateNotSet` при `hasRate == false`. Поведение `earnings == null` (блока нет вовсе) не менялось.
- **`MyEarningsPage`/`MyEarningsRoute`** — новые опциональные конструкторные поля `initialDateFrom`/`initialDateTo` (`DateTime?`, НЕ query-параметры URL — передаются программно через `context.router.push`, по образцу `ChecklistFillPage.organizationId`; после `make gen` `MyEarningsRouteArgs` несёт оба поля). `MyEarningsCubit` резолвит стартовое состояние сам в `super(...)` (канон DI — кубит не принимает готовое `initialValue` извне): оба поля заданы → произвольное окно с этими границами (`preset: null`); хотя бы одно `null` → как раньше, дефолтный пресет «месяц». Пользователь может переключить пресет после открытия из истории — кубит не залипает на произвольном окне.
- **`MyEarnings`** (`domain/payroll/models/my_earnings.dart`) — additive-поля `lateCount`/`lateSecondsTotal` (`work_schedules`, опоздания; `@Default(0)`, старые ответы бэка парсятся без падения) + геттер `hasScheduleSignal` (`delta != 0 || overtime != 0 || lateCount != 0`) — единственный источник условия показа блока «Сколько можно было заработать»; виджет только читает геттер, вся логика проверяется тестом на домен-модели (полноценный виджет-тест страницы в этом репо структурно невозможен — `my_earnings_page.dart` импортирует `core/router/app_router.dart`, который транзитивно тянет весь роут-трей вплоть до `login_page.dart`/`google_sign_in_web`, недоступный на VM-платформе `flutter test`; поэтому в проекте нет ни одного виджет-теста `@RoutePage`-экрана).
- **`MyEarningsPage`, порядок блоков сверху вниз**: `_EarnedCard` («Заработано», `net_amount_minor`, `headlineMedium`, крупно первым) → `_BreakdownCard` («Из чего сложилось»: по ставке `gross_amount_minor` → −штрафы/+доплаты (строками, только если есть) → «Заработано» ещё раз тем же термином, замыкает цепочку; ссылки «Мои штрафы»/«Мои начисления» — всегда) → `_PotentialEarningsCard` («Сколько можно было заработать»: по графику/разница как раньше + новые опоздания `lateCount`/`lateSecondsTotal` + переработка с явным пояснением «уже учтена в заработке»; скрыт при `!hasScheduleSignal`) → `_WorkedStatsCard` (отработано/смен, без «по ставке» — та цифра теперь в `_BreakdownCard`) → `_CurrentRateCard` → `_MissingRateBanner`.
- **Термин «К выплате» (`l10n.finesToPay`)** зарезервирован за админским `payroll` (`pages/payroll`, не трогался) — на «Моём заработке» везде «Заработано» (`l10n.historyEarned`, тот же ключ, что и в истории — Формулировки ТЗ явно требуют один термин на двух экранах).
- **Тесты**: `test/pages/my_earnings/my_earnings_cubit_test.dart` (стартовое состояние с/без `initialDateFrom`/`initialDateTo`, первый запрос уходит с правильными границами, переключение пресета после открытия из истории), `test/data/payroll/my_earnings_late_fields_mapper_test.dart` (additive-совместимость `late_count`/`late_seconds_total`), `test/data/payroll/my_earnings_schedule_signal_test.dart` (`hasScheduleSignal` по всем комбинациям трёх сигналов).

## Единое отображение времени смены в таймзоне организации (shift_timezone_display)

Фича `../docs/tasks/shift_timezone_display/mobile.md` — прод-баг: смена организации `04:39:06Z–18:00:00Z` (`Europe/Moscow`) показывалась как `04:39–18:00` (сырой UTC в `DateFormat`), а не `07:39–21:00`. Общая политика — `../docs/tasks/shift_timezone_display/design.md`: UTC-момент хранится/передаётся/сравнивается, настенное время строится только на UI-границе в явном контексте. Единая семантика: организационное событие — таймзона `Shift.organizationTimezone`/организации; персональное/платформенное — таймзона устройства. Никакой глобальный mutable-контекст не заводится: «Все смены» одновременно показывает смены разных организаций.

- **Time-сервис** — см. «Утилиты дат и денег» выше (`lib/core/time/app_time.dart`, `shift_time_context.dart`, `checklist_time_context.dart`).
- **Контракт**: `Shift.organizationTimezone`/`ShiftDto.organizationTimezone` — additive nullable String (backend `553a235`); `null` для персональной смены и для старого бэка без поля. `ChecklistInstanceDetail(Dto).organizationTimezone` — тот же приём для self-contained `GET /shifts/{shift_id}/checklists/{instance_id}` (backend `d84750c`). Ни один маппер не подставляет дефолтную зону вместо `null` — только явный rolling-deploy fallback на уровне вызывающей стороны (`scopedOrganizationTimezone`), либо `device()`.
- **Cubit-паттерн для org-scoped экранов без своего `Shift`** (штрафы/корректировки/ставки/payroll/статистика/тесты): состояние несёт `organizationTimezone` (`@Default('Europe/Moscow')`, совпадает с server_default `Organization.timezone`) + геттер `timeContext`; конструктор кубита грузит `Organization` один раз через уже внедрённый `OrganizationRepository.getById` и обновляет поле (`MyPenaltiesCubit`, `MyAdjustmentsCubit`, `MyEarningsCubit`, `OrgStatsCubit`, `PayrollCubit`, `OrgShiftsCubit`, `PenaltyFormCubit`). Кубиты остаются независимыми — контекст не читается из состояния другого кубита; на экранах, где `Organization` уже загружена соседним cubit'ом ради другого поля (`ShiftDetailCubit` — `overtimeRequestDays`, `MemberDetailCubit` — `viewerRole`), виджет комбинирует данные на UI-уровне (`context.select`) вместо повторного сетевого вызова.
- **Смешанные списки нескольких организаций** (история смен «Все смены», «Мои тесты»): контекст строки — своя организация (`ShiftHistoryContextState.timeContextFor`/`MyTestsState.timeContextFor`, резолв по уже загруженному списку организаций пользователя, без N+1); контекст календарного фильтра экрана — устройство (один фильтр не может одновременно представлять сутки нескольких организаций, `ShiftHistoryContextState.periodContext`).
- **Календарные фильтры**: `DateRangePickerPage` возвращает голый календарный день (`DateRangePickerResult`, без привязки к таймзоне) — перевод в UTC-границы явного контекста делает вызывающая сторона через `AppTime().utcBoundsForDay`/`DateRangePickerResultBounds.fromUtc(context)`/`toUtc(context)`; `appTimeCalendarDay(utcMoment, context)` — обратное преобразование для предзаполнения пикера. `PeriodPresetSelector`/`DateRangeFilterChip` принимают `timeContext` явным параметром.
- **Чек-лист/фото**: антифрод-штамп фото (`ChecklistFillCubit._stampText`) сжигает `captured_at` в пиксели в таймзоне организации чек-листа (`ChecklistInstanceDetail.timeContext()`), а не устройства снимающего — важно для случая, когда телефон сотрудника настроен на другой часовой пояс. `ChecklistPhotoViewerPage` получает тот же `timeContext` явным параметром роута.
- **Платформенные/личные поверхности** (уведомления, баннер подписки `tariffs`, персональная смена без организации) переведены на тот же `AppTime` с явным `AppTimeContext.device()` — не оставлены на разрозненном форматировании, чтобы новый код не возвращался к прежнему паттерну.
- **Архитектурный guard** `test/architecture/time_boundary_test.dart` — сканирует рукописный `lib/**/*.dart` (кроме `.g.dart`/`.freezed.dart`/`.gr.dart`, генерируемой `lib/l10n/app_localizations*.dart`) на прямой `import 'package:intl/intl.dart'`/`.toLocal()`/`DateFormat(`; три задокументированных исключения — `app_time.dart`, `org_timezone.dart` (низкоуровневый IANA-движок) и `date_range_picker_page.dart` (форматирует уже выбранный голый календарный день, не API-момент). Провал перечисляет каждый файл+паттерн. Guard проверен внедрённой нарушающей фикстурой перед финальным коммитом.
- **Тесты**: `test/core/time/app_time_test.dart` (Москва, Berlin зима/лето, DST-сутки 23/25ч, невалидная IANA-зона — безопасный fallback без падения, device-контекст, устойчивость к `TZ` процесса — прогнан под `UTC`/`Europe/Moscow`/`America/Los_Angeles`/`Pacific/Kiritimati`), `test/data/shift/shift_organization_timezone_mapper_test.dart` (rolling-deploy: поле есть/`null`/отсутствует в JSON — маппер не падает и не угадывает).
- **Вне scope**: изменение таймзоны организации, изменение UTC-значений в БД/API, перенос глобальных платформенных событий (уведомления/платежи) в org-зону, нативная публикация.

## Явный выбор рабочей точки при старте смены + точность геолокации (shift_start_location_choice)

Фича `../docs/tasks/shift_start_location_choice/mobile.md` — прод-баг: при включённой геопроверке сервер сам резолвил ближайшую точку из тех, в чьи радиусы попал сотрудник, а клиент об этом не знал и не мог повлиять на выбор; вторая проблема — на мобильном web-браузере запрашивалась только `LocationAccuracy.medium`, из-за чего позиция отставала от реального перемещения и людям писало «вы вне зоны», хотя они стояли на точке.

- **Новый эндпоинт** `GET /organizations/{org_id}/work-locations/nearby?latitude=&longitude=` (`OrganizationDataSource.getNearbyWorkLocations` → `OrganizationRepository.getNearbyWorkLocations` → `Task<NearbyWorkLocations>`) — точки организации в радиусе координат, отсортированные по возрастанию расстояния; сортировку клиент не пересчитывает. Домен: `NearbyWorkLocation` (`id`/`name`/`address`/`distanceMeters`/`isNearest`, гео-поля `latitude`/`longitude`/`radius_meters` ответа игнорируются — карты нет, вне scope), `NearestOutsideWorkLocation` (`name`/`distanceMeters` — подсказка при пустом `items`), `NearbyWorkLocations` (`items` + `nearestOutside?`). DTO+mapper — по канону проекта (`nearby_work_location_dto.dart`/`nearby_work_location_mapper.dart`), отдельного DataSource/интерфейса не заводили — 1 новый эндпоинт.
- **`ShiftTrackerCubit.startShift()`, новый шаг между геолокацией и резолвом графика** — только для `geoCheckEnabled` организаций: `_resolveWorkLocationForGeoStart` дергает `nearby` по только что полученным координатам и кладёт результат в `state.selectedWorkLocation` (переиспользует то же поле, что и ручной выбор точки для организаций без гео-проверки — `_performStart` шлёт его как `work_location_id` в обоих случаях без дополнительных веток).
  - **0 точек** → `StartShiftResult.noNearbyWorkLocation`, подсказка о ближайшей точке ВНЕ радиуса — `state.nearestOutsideHint` (`null`, если у организации нет точек за пределами радиуса вовсе). UI (`_IdleShiftContent._handleNoNearbyWorkLocation`) показывает `AlertDialog` (`showDialog`, по образцу `GeoFailureDialog` — не полноценная модалка-пикер, поэтому не роут) с текстом-подсказкой и «Повторить», который заново вызывает `startShift()` — весь сценарий (свежий GPS + новый `nearby`) проходит с нуля, кубит ничего не кэширует между попытками.
  - **1 точка** → подставляется в `selectedWorkLocation` молча, без лишнего шага (владелец: «лишнего шага быть не должно»).
  - **>1 точки** → `state.nearbyWorkLocations` (порядок сервера) + `StartShiftResult.workLocationSelectionRequired`; UI пушит `NearbyWorkLocationPickerRoute` (bottom-sheet, `CustomRoute`) и по результату вызывает `continueStartAfterWorkLocationSelection(location)` — переиспользует координаты этой попытки (`_pendingStartCoords`, поле теперь переживает ОБЕ возможные модалки — точка и график — до финального `_performStart`).
- **Резолв графика теперь по явной точке, не по сырым координатам** — `_resolveScheduleForGeoStart(orgId, workLocationId)` вызывает `getMySchedules(orgId, workLocationId: …)` вместо `lat`/`lng`: без этого выбор сотрудником НЕ ближайшей точки в модалке разошёлся бы с тем, location-only графики какой точки резолвит бэк (тот самый баг, который чинил `work_schedules_geo_resolve`, здесь уточняется). Ключ кэша выбора графика (`WorkScheduleContextStorage`) для гео-org сознательно остаётся `null`, как и до этой фичи (симметрично с `selectWorkSchedule`) — привязка к реальной точке вынесена как отдельное улучшение вне scope. Ретрай-перезапрос после `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND`/`SCHEDULE_WINDOW_CLOSED` (`_reloadSchedulesAfterStartFailure`) не тронут — остаётся по координатам, как раньше.
- **`WORK_LOCATION_OUT_OF_RANGE`** (новый код, 403; `POST /shifts/start` валидирует присланный `work_location_id` по радиусу — «гонка «список устарел»», сотрудник отошёл между `nearby` и стартом) — замаплен в `error_localization.dart` (обычный тост, без спецUI); кубит сбрасывает `selectedWorkLocation`/`selectedWorkScheduleId`, весь сценарий начинается заново со следующего тапа «Начать» (fresh GPS обязателен, отдельного молчаливого перезапроса нет).
- **Индикатор «Определяем местоположение…»** (`ShiftTrackerState.isLocating`, `_LocatingIndicator`) — идёт только на время самого запроса координат (не всей операции старта, которую и так блокирует общий `isActionLoading`-спиннер кнопки); выставляется/сбрасывается вокруг `_geoService.getCurrentPosition()` внутри `startShift()`.
- **Точность геолокации на web** — см. «Геолокация (гео-проверка зон и разрешения)» выше: high-first (`webHighAccuracyTimeout`, 6с) с молчаливым фолбэком на текущий medium-путь; порог низкой точности (`_lowAccuracyThreshold = 100.0`) и предупреждение `showLowAccuracyWarning` не изменились — старт по-прежнему не блокируется погрешностью (осознанное решение владельца: люди со слабым сигналом должны иметь возможность начать смену).
- **Организационный контекст на живом экране** — `_refreshVisibleContext` (уже существующий хвост `onAppResumed`/`onScreenVisible`) теперь также перечитывает список организаций (`fetchMyOrganizations`), а не только опрашивает активную смену: переключение `geoCheckEnabled` админом подхватывается при возврате на вкладку/экран без выхода из приложения.
- **UI модалки** (`NearbyWorkLocationPickerPage`, без своего cubit — список уже резолвлен `ShiftTrackerCubit`): заголовок «Вы рядом с несколькими точками», строки с названием/адресом/расстоянием (`~N м`), бейдж «Ближайшая» у элемента с `isNearest == true` (сервер гарантирует ровно один такой, первым по списку). Тап по строке сразу закрывает модалку с результатом (тот же паттерн, что и `WorkLocationPickerPage`/`WorkSchedulePickerPage` — без отдельной кнопки подтверждения); закрытие свайпом/тапом по фону возвращает `null`, старт не продолжается.
- **Вне scope**: блокировка старта по погрешности координат, повторная геопроверка на паузе/завершении смены, изменение точки после старта, карта с точками и маршрутом, передача `accuracy` на бэк.
- **Тесты**: `test/core/services/geo_service_test.dart` (web: успех сразу на high, фолбэк на medium после таймаута/неожиданной ошибки high-попытки, без спецклассификации первой попытки), `test/pages/shift_tracker/shift_tracker_cubit_test.dart` (группы «выбор графика — С гео-проверкой» обновлена под резолв по `workLocationId`; новая группа «выбор рабочей точки при пересечении зон»: 1/>1/0 точек, сохранение порядка сервера и `isNearest`, выбор НЕ ближайшей точки в модалке, `nearestOutsideHint` с подсказкой и без, повтор сценария с нуля после `noNearbyWorkLocation`, сетевой сбой `nearby`, `WORK_LOCATION_OUT_OF_RANGE`), `test/data/organization/nearby_work_location_mapper_test.dart` (парсинг `items`/`nearest_outside`, пустой список, точка без адреса).

## Окно дозаполнения чек-листа после завершения смены (checklist_grace_period)

Фича `../docs/tasks/checklist_grace_period/mobile.md`. Раньше `readOnly` чек-листа вычислялся клиентом как `shift.status == ShiftStatus.finished`: после завершения смены (в т.ч. авто-завершения) чек-лист мгновенно уходил в read-only, а точка входа исчезала вместе с активным экраном — сотрудник, не успевший заполнить обязательные пункты, терял к ним доступ насовсем. Владелец завёл окно дозаполнения (`checklist_grace_minutes`, по умолчанию 30 мин, настройка организации) — задача мобилки сделать это окно видимым и достижимым, а не просто снять блокировку.

- **Контракт — только сервер решает.** Список (`ChecklistInstance`) и деталь (`ChecklistInstanceDetail`) чек-листов смены несут additive `fillAllowed`/`fillDeadlineAt` (UTC, `null` для активной смены и для закрытого окна). Клиент НЕ вычисляет окно по часам устройства — только читает эти поля. Отказ по истечении окна — существующий код `SHIFT_FINISHED`, семантика которого изменилась (означает не «смена завершена», а «время на дозаполнение истекло»).
- **`ChecklistFillCubit`**: `readOnly` теперь выставляется в `loadInstance()` из `detail.fillAllowed` (не из статуса смены) — единственная точка правды. Пока `fillDeadlineAt != null`, кубит тикает раз в секунду (`fillDeadlineTick`, testable через инъекцию `now`) и по достижении дедлайна ЛОКАЛЬНО переводит экран в read-only с тем же `PhotoNotice.shiftFinished`, что уже используется для серверного `SHIFT_FINISHED` при фото/отметке пункта (второй механизм не заводили — п.4 ТЗ). Заголовок страницы (`_FillDeadlineBanner`) показывает «Осталось N мин», видна только когда `fillRemaining != null`.
- **Точка входа после завершения** (`ShiftTrackerCubit`/idle-экран): кубит после (авто-)завершения смены с `Shift.hasIncompleteRequiredChecklists == true` запрашивает `GET /shifts/{id}/checklists` — дешёвый предфильтр по уже существующему серверному флагу экономит второй запрос, когда дозаполнять нечего. Если хотя бы один пункт всё ещё `fillAllowed`, на idle-экране (`_ChecklistGraceBlock`, самый верх колонки — «заметный блок» по ТЗ) показывается ссылка на существующий `ShiftChecklistsRoute` с тикающим отсчётом; блок гасится локально по истечении и перепроверяется после возврата с экрана чек-листов (`refreshChecklistGrace()`). Отдельный `Timer` (`_checklistGraceTimer`), не завязан на тикер окна графика (`_idleTimer`) — разные условия существования.
- **`readOnly` в существующей навигации** (`_DetailChecklistsSection` — история смен, `ShiftChecklistsPage._openInstance`) переведён с `shift.status == ShiftStatus.finished` на `!item.fillAllowed` из уже загруженного списка; `ChecklistFillCubit.loadInstance()` авторитетно перепроверяет по детали. Read-only-режим админа на чужой смене (`_OrgShiftDetailChecklists`) не менялся — дозаполнение админом за сотрудника вне scope.
- **Предупреждение при завершении смены** (`_onFinishShift`, диалог подтверждения) дополнено фразой про окно, только если `Organization.checklistGraceMinutes` известен и `> 0`; завершение по-прежнему не блокируется. `checklistGraceMinutes` — additive `int?` на `Organization`, добавлен по прецеденту `overtimeRequestDays` (employee не имеет доступа к `GET/PATCH /organizations/{id}/settings`, а контракт фичи денормализует настройку явно только туда) — контракт backend.md явно не обещает это поле на `GET /organizations`, так что при его отсутствии диалог просто не упоминает окно (безопасная деградация без выдуманных чисел).
- **`wholeMinutesCeil`** (`core/utils/duration_format.dart`) — округление `Duration` вверх до минут для обоих счётчиков (шапка заполнения + idle-блок); не через `AppTime` — это разница двух UTC-моментов, а не настенное время, и не подпадает под `time_boundary_test.dart`.
- **Тесты**: `checklist_fill_cubit_test.dart` (`fillAllowed` из детали переопределяет конструкторный readOnly в обе стороны, отсчёт от серверного `fillDeadlineAt`, истечение во время заполнения переводит в read-only с нотисом без перезагрузки), `shift_tracker_cubit_test.dart` (блок появляется/не появляется по `hasIncompleteRequiredChecklists`+`fillAllowed`, тикает и гасится по истечении, подхватывается и ручным `finishShift()`, и авто-завершением фоновым поллингом).
- **Вне scope**: блокировка завершения смены при незаполненном чек-листе, дозаполнение админом за сотрудника, пуш-уведомление о скором закрытии окна, офлайн-дозаполнение.

## Ключевые решения

См. `docs/decisions/` для полных ADR.
