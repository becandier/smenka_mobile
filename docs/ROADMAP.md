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

## Фаза 6 — Организации `[ ]`
- [ ] **OrganizationsList** — список организаций пользователя
- [ ] Карточки: название, роль (owner/admin/employee), дата создания
- [ ] **CreateOrganization** — модалка с вводом названия
- [ ] **JoinOrganization** — модалка с вводом 8-значного инвайт-кода
- [ ] **OrganizationDetail** — экран организации (контент по роли)
- [ ] Для employee: название, мои смены, кнопка "Покинуть"
- [ ] Для admin: + список сотрудников, локации, смены всех, статистика
- [ ] Для owner: + редактирование, настройки, инвайт-код, удаление орг, удаление сотрудников
- [ ] Кубиты: OrganizationsCubit, OrganizationDetailCubit, CreateOrgCubit, JoinOrgCubit
- [ ] Интеграция с OrganizationRepository (getAll, create, join, getById, update, delete, rotateInvite)
- [ ] Локализация

---

## Фаза 7 — Управление организацией `[ ]`
- [ ] **MembersList** — список участников (имя, email, роль, дата)
- [ ] Удаление участника (owner)
- [ ] **OrgSettings** — настройки организации (owner only)
- [ ] Toggle geo_check, auto_finish_hours, max_pause_minutes, max_pauses_per_shift
- [ ] **WorkLocations** — список рабочих точек + карта с маркерами и радиусами
- [ ] **AddEditLocation** — карта с выбором точки, название, радиус
- [ ] **OrgShifts** — смены сотрудников (admin/owner), фильтры, пагинация
- [ ] **OrgStats** — статистика организации + per_employee таблица
- [ ] Кубиты: MembersCubit, OrgSettingsCubit, LocationsCubit, OrgShiftsCubit, OrgStatsCubit
- [ ] Интеграция с OrganizationRepository, LocationRepository
- [ ] Локализация

---

## Фаза 8 — Полировка `[ ]`
- [ ] Пустые состояния (empty states) для всех списков
- [ ] Pull-to-refresh везде где есть списки
- [ ] Skeleton/shimmer загрузка
- [ ] Анимации переходов
- [ ] Обработка потери сети (connectivity wrapper уже есть)
- [ ] Deep links (инвайт-код)
- [ ] Push-уведомления (напоминание завершить смену)
- [ ] Финальная проверка локализации
