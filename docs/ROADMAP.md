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
