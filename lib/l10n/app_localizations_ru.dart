// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get success => 'Успешно';

  @override
  String get error => 'Ошибка';

  @override
  String get loading => 'Загрузка';

  @override
  String get techWorks => 'Технические работы';

  @override
  String get techWorksDescription =>
      'В данный момент в приложении производятся технические работы. Приложение будет доступно после их окончания.';

  @override
  String get refresh => 'Обновить';

  @override
  String get attention => 'Внимание';

  @override
  String get close => 'Закрыть';

  @override
  String get deviceNotConnected =>
      'Устройство не подключено к сети. Проверьте соединение.';

  @override
  String get vpnEnabled =>
      'VPN включён. Это может повлиять на работу приложения.';

  @override
  String get home => 'Главная';

  @override
  String get settings => 'Настройки';

  @override
  String get enterInDebugMode => 'Вход в режим разработчика';

  @override
  String get password => 'Пароль';

  @override
  String get login => 'Войти';

  @override
  String get logout => 'Выйти';

  @override
  String get cancel => 'Отмена';

  @override
  String get passwordIncorrect => 'Неверный пароль';

  @override
  String get debugMode => 'Режим разработчика';

  @override
  String get flavor => 'Среда';

  @override
  String get logs => 'Логи';

  @override
  String get azkars => 'Азкары';

  @override
  String get errorOccurred => 'Произошла ошибка';

  @override
  String get errorDescription =>
      'К сожалению, что-то пошло не так. Мы уже работаем над исправлением этой проблемы.';

  @override
  String get tryAgain => 'Попробовать снова';

  @override
  String get errorDetails => 'Детали ошибки';

  @override
  String get errorVpnDescription =>
      'Не удалось загрузить необходимые данные для работы приложения. Пожалуйста, выключите VPN и повторите попытку.';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Тёмная';

  @override
  String get system => 'Системная';

  @override
  String get noData => 'Нет данных';

  @override
  String get retry => 'Повторить';

  @override
  String get authLogin => 'Войти';

  @override
  String get authRegister => 'Зарегистрироваться';

  @override
  String get authEmail => 'Email';

  @override
  String get authEmailHint => 'example@mail.com';

  @override
  String get authLoginOrEmail => 'Email или логин';

  @override
  String get authLoginOrEmailHint => 'example@mail.com или логин';

  @override
  String get authPassword => 'Пароль';

  @override
  String get authName => 'Имя';

  @override
  String get authNameHint => 'Иван Иванов';

  @override
  String get authNoAccount => 'Нет аккаунта? Зарегистрироваться';

  @override
  String get authHasAccount => 'Уже есть аккаунт? Войти';

  @override
  String get authOrDivider => 'или';

  @override
  String get authContinueWithGoogle => 'Продолжить с Google';

  @override
  String get authContinueWithApple => 'Продолжить с Apple';

  @override
  String get authVerifyTitle => 'Подтверждение email';

  @override
  String authVerifySubtitle(String email) {
    return 'Код отправлен на $email';
  }

  @override
  String get authResendCode => 'Отправить повторно';

  @override
  String authResendCodeTimer(int seconds) {
    return 'Отправить повторно ($secondsс)';
  }

  @override
  String get authPasswordMinLength => 'Минимум 8 символов';

  @override
  String get authPasswordNeedLetter => 'Хотя бы одна буква';

  @override
  String get authPasswordNeedDigit => 'Хотя бы одна цифра';

  @override
  String get authCodeSent => 'Код отправлен на почту';

  @override
  String get authCodeResent => 'Код отправлен повторно';

  @override
  String get authEmailTaken => 'Пользователь с таким email уже существует';

  @override
  String get authInvalidCredentials => 'Неверный логин или пароль';

  @override
  String get authInvalidCode => 'Неверный или просроченный код';

  @override
  String get authEmailNotVerified => 'Email не подтверждён, введите код';

  @override
  String get shiftTracker => 'Смена';

  @override
  String get shiftHistory => 'История';

  @override
  String get shiftProfile => 'Профиль';

  @override
  String get shiftStart => 'Начать смену';

  @override
  String get shiftPause => 'Пауза';

  @override
  String get shiftResume => 'Продолжить';

  @override
  String get shiftFinish => 'Завершить';

  @override
  String get shiftSelectOrg => 'Организация';

  @override
  String shiftOrgBadge(String orgName) {
    return 'Смена в: $orgName';
  }

  @override
  String get shiftStartPersonalLink => 'Начать персональную смену';

  @override
  String get shiftPersonalConfirmTitle => 'Начать персональную смену?';

  @override
  String get shiftPersonalConfirmBody =>
      'Персональная смена не привязана к организации: руководитель её не увидит, в отчёты и начисления она не попадёт.';

  @override
  String shiftPersonalConfirmStartOrg(String orgName) {
    return 'Начать в «$orgName»';
  }

  @override
  String get shiftPersonalConfirmChooseOrg => 'Выбрать организацию';

  @override
  String get shiftPersonalConfirmStartPersonal => 'Всё равно персональную';

  @override
  String get shiftActive => 'Смена активна';

  @override
  String get shiftPaused => 'Смена на паузе';

  @override
  String get shiftElapsed => 'Время работы';

  @override
  String get shiftPauses => 'Паузы';

  @override
  String shiftPauseNumber(int number) {
    return 'Пауза $number';
  }

  @override
  String get shiftNoPauses => 'Пауз нет';

  @override
  String get shiftStarted => 'Смена начата';

  @override
  String get shiftFinished => 'Смена завершена';

  @override
  String get shiftAutoFinishedNotice => 'Смена завершена автоматически';

  @override
  String get shiftPauseStarted => 'Пауза начата';

  @override
  String get shiftResumed => 'Смена продолжена';

  @override
  String get shiftLocationRequired =>
      'Для этой организации требуется геопроверка';

  @override
  String get shiftLocationDenied => 'Доступ к геолокации запрещён';

  @override
  String get shiftLocationOutOfRange =>
      'Вы находитесь за пределами рабочей зоны';

  @override
  String get shiftWorkLocation => 'Рабочая точка';

  @override
  String get shiftWorkLocationSelect => 'Выберите рабочую точку';

  @override
  String get shiftWorkLocationPickerTitle => 'Рабочая точка';

  @override
  String get shiftWorkLocationPickerNone => 'Без точки';

  @override
  String get shiftWorkLocationPickerEmpty => 'У организации нет рабочих точек';

  @override
  String get workScheduleFieldLabel => 'График';

  @override
  String get workScheduleSelectPlaceholder => 'Выберите график';

  @override
  String get workSchedulePickerTitle => 'График работы';

  @override
  String get workScheduleRequiredEmpty =>
      'Для вас не настроен график работы. Обратитесь к администратору.';

  @override
  String get workScheduleCrossesMidnight => 'через полночь';

  @override
  String get workScheduleBadgeCurrent => 'Идёт сейчас';

  @override
  String workScheduleStartedMinutesAgo(int minutes) {
    return 'начался $minutes мин назад';
  }

  @override
  String workScheduleStartsInMinutes(int minutes) {
    return 'Начнётся через $minutes мин';
  }

  @override
  String workScheduleStartsInHours(int hours) {
    return 'Начнётся через $hours ч';
  }

  @override
  String workScheduleStartsTodayAt(String time) {
    return 'Начнётся сегодня в $time';
  }

  @override
  String workScheduleStartsTomorrowAt(String time) {
    return 'Начнётся завтра в $time';
  }

  @override
  String workScheduleStartsOnDateAt(String date, String time) {
    return 'Начнётся $date в $time';
  }

  @override
  String workScheduleAvailableFrom(String time) {
    return 'Смену можно начать с $time';
  }

  @override
  String workScheduleClosedNextTomorrowAt(String name, String time) {
    return 'График «$name» закончился. Ближайший старт — завтра в $time';
  }

  @override
  String shiftPlannedSchedule(String schedule, String time) {
    return 'По графику: $schedule, до $time';
  }

  @override
  String shiftPlannedUntil(String time) {
    return 'По графику: до $time';
  }

  @override
  String shiftLateNotice(String time, int minutes) {
    return 'Начало по графику $time, опоздание $minutes мин';
  }

  @override
  String get overtimeSectionTitle => 'Переработка';

  @override
  String get overtimeAddButton => 'Добавить переработку';

  @override
  String get overtimeCancelButton => 'Отменить заявку';

  @override
  String get overtimeCancelConfirmTitle => 'Отменить заявку на переработку?';

  @override
  String overtimeStatusPending(int minutes) {
    return 'Переработка $minutes мин · на согласовании';
  }

  @override
  String overtimeStatusApproved(int minutes) {
    return 'Переработка $minutes мин · согласована';
  }

  @override
  String get overtimeStatusRejected => 'Переработка отклонена';

  @override
  String get overtimeFormTitle => 'Добавить переработку';

  @override
  String get overtimeMinutesLabel => 'Минуты переработки';

  @override
  String overtimeMinutesPreset(int minutes) {
    return '$minutes мин';
  }

  @override
  String get overtimeCommentLabel => 'Комментарий';

  @override
  String get overtimeMinutesInvalid => 'Укажите от 1 до 1440 минут';

  @override
  String get overtimeCommentRequired => 'Добавьте комментарий';

  @override
  String get overtimeSubmit => 'Отправить';

  @override
  String get geoPermissionDenied =>
      'Для начала смены необходим доступ к геолокации';

  @override
  String get geoPermissionDeniedForeverTitle => 'Геолокация недоступна';

  @override
  String get geoPermissionDeniedForeverMessage =>
      'Вы запретили доступ к геолокации. Откройте настройки приложения и разрешите доступ к местоположению.';

  @override
  String get geoOpenAppSettings => 'Открыть настройки';

  @override
  String get geoServiceDisabledTitle => 'Геолокация выключена';

  @override
  String get geoServiceDisabledMessage =>
      'Включите геолокацию на устройстве для начала смены.';

  @override
  String get geoOpenSettings => 'Включить';

  @override
  String get geoLowAccuracy =>
      'Низкая точность GPS — координаты могут быть неточными';

  @override
  String get geoPermissionWebTitle => 'Доступ к геолокации заблокирован';

  @override
  String get geoPermissionWebMessage =>
      'Разрешите доступ к геолокации в настройках сайта (значок 🔒 или ⓘ слева от адреса) и повторите.';

  @override
  String get geoRetry => 'Повторить';

  @override
  String get geoUnsupportedMessage =>
      'Геолокация не поддерживается этим браузером. Обновите браузер или используйте другой.';

  @override
  String get geoInsecureContextMessage =>
      'Для доступа к геолокации откройте сайт по защищённому соединению (HTTPS).';

  @override
  String get geoPermissionDeniedTitle => 'Нужен доступ к геолокации';

  @override
  String get geoUnavailableTitle => 'Геопозиция не определена';

  @override
  String get geoUnsupportedTitle => 'Геолокация не поддерживается';

  @override
  String get geoInsecureContextTitle => 'Небезопасное соединение';

  @override
  String get geoBlockedBySystemTitle => 'Геолокацию запрещает система';

  @override
  String get geoBlockedBySystemMessage =>
      'В браузере доступ разрешён, но система запрещает геолокацию самому браузеру. Включите доступ к геопозиции для браузера в настройках операционной системы.';

  @override
  String get geoBlockedUnknownLevelMessage =>
      'Доступ к геолокации заблокирован. Проверьте два уровня: настройки сайта в браузере (значок 🔒 слева от адреса) и разрешение геолокации для браузера в настройках системы.';

  @override
  String get geoHowToFix => 'Как исправить';

  @override
  String get geoDiagnosticsTitle => 'Проверка геолокации';

  @override
  String get geoDiagnosticsStatusSection => 'Статус';

  @override
  String get geoDiagnosticsPermissionSiteLabel => 'Доступ сайта к геолокации';

  @override
  String get geoDiagnosticsPermissionAppLabel =>
      'Доступ приложения к геолокации';

  @override
  String get geoDiagnosticsServiceLabel => 'Службы геолокации устройства';

  @override
  String get geoDiagnosticsStateGranted => 'Разрешено';

  @override
  String get geoDiagnosticsStateBlocked => 'Заблокировано';

  @override
  String get geoDiagnosticsStateNotRequested => 'Не запрошено';

  @override
  String get geoDiagnosticsStateUnknown => 'Неизвестно';

  @override
  String get geoDiagnosticsStateOn => 'Включены';

  @override
  String get geoDiagnosticsStateOff => 'Выключены';

  @override
  String get geoDiagnosticsRefreshStatus => 'Обновить статус';

  @override
  String get geoDiagnosticsTestSection => 'Тест';

  @override
  String get geoDiagnosticsRunTest => 'Проверить геолокацию';

  @override
  String get geoDiagnosticsTestRunning => 'Определяем геопозицию…';

  @override
  String get geoDiagnosticsTestSuccess => 'Геопозиция получена';

  @override
  String geoDiagnosticsTestCoords(String coords) {
    return 'Координаты: $coords';
  }

  @override
  String geoDiagnosticsTestAccuracy(String meters) {
    return 'Точность: ±$meters м';
  }

  @override
  String get geoDiagnosticsInstructionsSection => 'Что делать';

  @override
  String get geoDiagnosticsSiteStepTitle => 'Шаг 1. Доступ в браузере';

  @override
  String get geoDiagnosticsSiteStepBody =>
      'Нажмите значок 🔒 (или ⓘ) слева от адреса сайта → «Настройки сайтов» → «Геопозиция» → «Разрешить». Затем обновите страницу.';

  @override
  String get geoDiagnosticsSystemStepTitle => 'Шаг 2. Доступ в системе';

  @override
  String get geoDiagnosticsSystemStepMacOs =>
      'Системные настройки → Конфиденциальность и безопасность → Службы геолокации: включите службы и разрешите доступ вашему браузеру.';

  @override
  String get geoDiagnosticsSystemStepWindows =>
      'Параметры → Конфиденциальность и защита → Расположение: включите «Службы определения местоположения» для устройства и доступ для вашего браузера.';

  @override
  String get geoDiagnosticsSystemStepAndroid =>
      'Настройки → Приложения → ваш браузер → Разрешения → «Местоположение» → «Разрешить». Проверьте, что геолокация включена в шторке устройства.';

  @override
  String get geoDiagnosticsSystemStepIos =>
      'Настройки → Конфиденциальность и безопасность → Службы геолокации: включите службы, затем Настройки → Приложения → Safari → «Геопозиция» → «Спросить» или «Разрешить».';

  @override
  String get geoDiagnosticsSystemStepOther =>
      'Разрешите геолокацию вашему браузеру в настройках операционной системы — раздел конфиденциальности или местоположения.';

  @override
  String get geoDiagnosticsNativeStepTitle => 'Настройки приложения';

  @override
  String get geoDiagnosticsNativeStepBody =>
      'Разрешите доступ к геопозиции для приложения и убедитесь, что службы геолокации устройства включены.';

  @override
  String get geoDiagnosticsOpenLocationSettings =>
      'Открыть настройки геолокации';

  @override
  String get shiftStartWithPhoto => 'Начать по фото';

  @override
  String get geoFallbackTitle => 'Старт смены по фото';

  @override
  String get geoFallbackIntro =>
      'Геолокация недоступна. Чтобы не терять учёт времени, выберите рабочую точку и приложите фото — администратор увидит пометку и разберётся.';

  @override
  String get geoFallbackLocationStep => '1. Рабочая точка';

  @override
  String get geoFallbackScheduleStep => '2. График работы';

  @override
  String get geoFallbackPhotoStep => '3. Фото';

  @override
  String get geoFallbackLocationSelect => 'Выбрать точку';

  @override
  String get geoFallbackScheduleSelect => 'Выбрать график';

  @override
  String get geoFallbackScheduleLocationFirst =>
      'Сначала выберите рабочую точку';

  @override
  String get geoFallbackScheduleEmpty =>
      'Доступных графиков нет — обратитесь к администратору';

  @override
  String get geoFallbackScheduleNotRequired => 'График не требуется';

  @override
  String get geoFallbackCameraPreparing => 'Проверяем камеру…';

  @override
  String get geoFallbackCameraHint =>
      'Сделайте снимок — он подтвердит, что вы на месте.';

  @override
  String get geoFallbackCameraShoot => 'Снять';

  @override
  String get geoFallbackCameraUnavailable =>
      'Камера недоступна — приложите файл с изображением.';

  @override
  String get geoFallbackPickFile => 'Выбрать файл';

  @override
  String get geoFallbackRetakePhoto => 'Переснять';

  @override
  String get geoFallbackPhotoProcessing => 'Готовим снимок…';

  @override
  String get geoFallbackSubmit => 'Начать смену';

  @override
  String get geoFallbackStarted =>
      'Смена начата, старт помечен как без геопроверки';

  @override
  String get errorGeoFallbackPhotoInvalid =>
      'Не удалось прикрепить фото, попробуйте снять заново';

  @override
  String get shiftConfirmFinish => 'Завершить смену?';

  @override
  String get shiftConfirmFinishBody =>
      'Вы уверены, что хотите завершить текущую смену?';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get historyTitle => 'История смен';

  @override
  String get historyEmpty => 'Нет смен';

  @override
  String get historyFilterAll => 'Все';

  @override
  String get historyFilterActive => 'Активные';

  @override
  String get historyFilterPaused => 'На паузе';

  @override
  String get historyFilterFinished => 'Завершённые';

  @override
  String get historyDateFrom => 'Дата от';

  @override
  String get historyDateTo => 'Дата до';

  @override
  String get historyResetFilters => 'Сбросить';

  @override
  String get historyContextLabel => 'Контекст истории';

  @override
  String get historyContextPersonal => 'Персональные';

  @override
  String get historyContextAll => 'Все смены';

  @override
  String get historyEmptyOrganization => 'В этой организации смен пока нет';

  @override
  String get historyEmptyPersonal => 'Персональных смен пока нет';

  @override
  String get historyEmptyContextHint =>
      'Переключите контекст выше, чтобы увидеть другие смены';

  @override
  String get historyEarned => 'Заработано';

  @override
  String get historyByRate => 'По ставке';

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsPeriodDay => 'День';

  @override
  String get statsPeriodWeek => 'Неделя';

  @override
  String get statsPeriodMonth => 'Месяц';

  @override
  String get statsTotalWorked => 'Отработано';

  @override
  String get statsShiftCount => 'Смен';

  @override
  String get statsAverage => 'Среднее';

  @override
  String statsHours(int hours, int minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String get detailTitle => 'Детали смены';

  @override
  String get detailStarted => 'Начало';

  @override
  String get detailFinished => 'Конец';

  @override
  String get detailDuration => 'Длительность';

  @override
  String get detailStatus => 'Статус';

  @override
  String get detailOrganization => 'Организация';

  @override
  String get detailWorkLocation => 'Рабочая точка';

  @override
  String get detailPauses => 'Паузы';

  @override
  String get detailPersonal => 'Персональная';

  @override
  String get detailInProgress => 'В процессе';

  @override
  String get detailPlan => 'План';

  @override
  String get detailLate => 'Опоздание';

  @override
  String detailLateMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String get detailFinishReason => 'Причина завершения';

  @override
  String get detailFinishReasonAutoSchedule =>
      'Завершена автоматически по графику';

  @override
  String get shiftManualAddedBadge => 'Добавлена администратором';

  @override
  String get shiftManualEditedBadge => 'Изменена администратором';

  @override
  String get shiftManualAddedNotice => 'Смену добавил администратор';

  @override
  String shiftManualEditedNotice(String date) {
    return 'Смену изменил администратор, $date';
  }

  @override
  String get statusActive => 'Активна';

  @override
  String get statusPaused => 'На паузе';

  @override
  String get statusFinished => 'Завершена';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get personalInfo => 'Личные данные';

  @override
  String get editProfile => 'Редактировать';

  @override
  String get profileLogin => 'Логин';

  @override
  String get myOrganizations => 'Мои организации';

  @override
  String get noOrganizations => 'Вы не состоите в организациях';

  @override
  String get logoutConfirmTitle => 'Выход';

  @override
  String get logoutConfirmMessage => 'Вы уверены, что хотите выйти?';

  @override
  String get save => 'Сохранить';

  @override
  String get phone => 'Телефон';

  @override
  String get phoneHint => '+7 999 123 45 67';

  @override
  String get phoneNotSpecified => 'Не указан';

  @override
  String memberSince(String date) {
    return 'Зарегистрирован с $date';
  }

  @override
  String get profileUpdated => 'Профиль обновлён';

  @override
  String get theme => 'Тема';

  @override
  String get roleOwner => 'Владелец';

  @override
  String get roleMember => 'Участник';

  @override
  String get nameRequired => 'Имя не может быть пустым';

  @override
  String get organizationsTitle => 'Организации';

  @override
  String get organizationsEmpty => 'Вы не состоите ни в одной организации';

  @override
  String get organizationsJoin => 'Присоединиться';

  @override
  String get organizationsJoinByCode => 'Присоединиться по коду';

  @override
  String get createOrgTitle => 'Новая организация';

  @override
  String get createOrgNameLabel => 'Название организации';

  @override
  String get createOrgNameHint => 'Введите название';

  @override
  String get createOrgNameRequired => 'Название не может быть пустым';

  @override
  String get createOrgSuccess => 'Организация создана';

  @override
  String get joinOrgTitle => 'Присоединиться к организации';

  @override
  String get joinOrgCodeLabel => 'Инвайт-код';

  @override
  String get joinOrgCodeHint => 'Введите 8-значный код';

  @override
  String get joinOrgCodeRequired => 'Код не может быть пустым';

  @override
  String joinOrgSuccess(String orgName) {
    return 'Вы присоединились к $orgName';
  }

  @override
  String get orgDetailTitle => 'Организация';

  @override
  String get orgDetailMembers => 'Участники';

  @override
  String orgDetailMembersCount(int count) {
    return '$count участников';
  }

  @override
  String get orgDetailLeave => 'Покинуть организацию';

  @override
  String get orgDetailLeaveConfirm =>
      'Вы уверены, что хотите покинуть организацию?';

  @override
  String get orgDetailLeft => 'Вы покинули организацию';

  @override
  String get orgDetailShifts => 'Смены сотрудников';

  @override
  String get orgDetailStats => 'Статистика';

  @override
  String get roleOwnerFull => 'Владелец';

  @override
  String get roleAdmin => 'Администратор';

  @override
  String get roleEmployee => 'Сотрудник';

  @override
  String memberSinceDate(String date) {
    return 'С $date';
  }

  @override
  String get membersTitle => 'Участники';

  @override
  String get membersEmpty => 'Нет участников';

  @override
  String get membersMakeAdmin => 'Назначить администратором';

  @override
  String get membersMakeEmployee => 'Снять администратора';

  @override
  String get membersRoleChanged => 'Роль изменена';

  @override
  String get membersCantEditSelf => 'Нельзя изменить свою роль';

  @override
  String membersJoinedAt(String date) {
    return 'С $date';
  }

  @override
  String get orgShiftsTitle => 'Смены сотрудников';

  @override
  String get orgShiftsEmpty => 'Нет смен';

  @override
  String get orgShiftsEmptyForEmployee => 'У сотрудника нет смен за период';

  @override
  String get orgShiftsFilterEmployee => 'Сотрудник';

  @override
  String get orgShiftsAllEmployees => 'Все сотрудники';

  @override
  String get shiftFilterByEmployee => 'Фильтр по сотруднику';

  @override
  String get shiftFilterReset => 'Сбросить фильтр';

  @override
  String get shiftEmployeePickerTitle => 'Выбор сотрудника';

  @override
  String get shiftEmployeePickerEmpty => 'Сотрудников нет';

  @override
  String get shiftAuthorFormerEmployee => 'Бывший сотрудник';

  @override
  String get shiftDetailTitle => 'Смена сотрудника';

  @override
  String get shiftDetailBackToList => 'Назад к списку';

  @override
  String get shiftChecklistsSection => 'Чек-листы';

  @override
  String get errorShiftNotFound => 'Смена не найдена';

  @override
  String get errorOrgNotFound => 'Организация не найдена';

  @override
  String get errorForbidden => 'Недостаточно прав';

  @override
  String get errorInvalidStatusFilter => 'Неверный статус-фильтр';

  @override
  String get orgStatsTitle => 'Статистика организации';

  @override
  String get orgStatsTotalHours => 'Всего часов';

  @override
  String get orgStatsShiftCount => 'Кол-во смен';

  @override
  String get orgStatsAvgShift => 'Средняя смена';

  @override
  String get orgStatsChartTitle => 'Часы по сотрудникам';

  @override
  String get orgStatsTableName => 'Сотрудник';

  @override
  String get orgStatsTableShifts => 'Смены';

  @override
  String get orgStatsTableHours => 'Часы';

  @override
  String get orgStatsTableAvg => 'Средн.';

  @override
  String get membersCustomRoleNone => 'Без роли';

  @override
  String get membersAssignRole => 'Назначить роль';

  @override
  String get membersAssignRoleTitle => 'Кастомная роль';

  @override
  String get membersCustomRoleAssigned => 'Роль назначена';

  @override
  String get membersCustomRoleCleared => 'Роль снята';

  @override
  String get memberDetailTitle => 'Сотрудник';

  @override
  String get memberDetailSystemRole => 'Системная роль';

  @override
  String get memberDetailCustomRole => 'Кастомная роль';

  @override
  String get memberDetailEffectiveSection => 'Эффективные чек-листы';

  @override
  String get memberDetailEffectiveHint =>
      'Что получит сотрудник при старте смены';

  @override
  String get memberDetailEffectiveEmpty => 'Нет активных чек-листов';

  @override
  String get memberDetailEffectiveAllLocations => 'На всех точках';

  @override
  String get memberDetailEffectiveLocationsUnnamed =>
      'Только на выбранных точках';

  @override
  String memberDetailEffectiveLocationsExtra(int count) {
    return '+$count';
  }

  @override
  String get memberDetailSourceRole => 'От роли';

  @override
  String get memberDetailSourcePersonal => 'Персонально';

  @override
  String get memberDetailOverridesSection => 'Персональные исключения';

  @override
  String get memberDetailOverridesHint =>
      'Добавленные поверх роли (+) или исключённые из роли (−) шаблоны';

  @override
  String get memberDetailOverridesEmpty => 'Нет персональных переопределений';

  @override
  String get memberDetailOverrideAction => 'Действия';

  @override
  String get memberDetailOverrideAdd => '+';

  @override
  String get memberDetailOverrideRemove => '−';

  @override
  String get memberDetailOverrideSwitchAdd => 'Добавить поверх роли';

  @override
  String get memberDetailOverrideSwitchRemove => 'Исключить из роли';

  @override
  String get memberDetailOverrideClear => 'Снять переопределение';

  @override
  String get checklistTemplatesShiftStart => 'При начале смены';

  @override
  String get checklistTemplatesShiftEnd => 'При завершении смены';

  @override
  String get shiftChecklistsTitle => 'Чек-листы смены';

  @override
  String get shiftChecklistsEmpty => 'Чек-листов нет';

  @override
  String get shiftChecklistsStartGroup => 'При начале смены';

  @override
  String get shiftChecklistsEndGroup => 'При завершении смены';

  @override
  String shiftChecklistProgress(int completed, int total) {
    return '$completed из $total';
  }

  @override
  String get shiftChecklistStatusPending => 'В процессе';

  @override
  String get shiftChecklistStatusCompleted => 'Выполнен';

  @override
  String get shiftChecklistStatusIncomplete => 'Не выполнен';

  @override
  String get shiftChecklistRequiredBadge => 'Обязательный';

  @override
  String get checklistFillTitle => 'Заполнение чек-листа';

  @override
  String get checklistFillCommentHint => 'Комментарий (необязательно)';

  @override
  String get checklistFillReadOnly =>
      'Смена завершена, редактирование недоступно';

  @override
  String get checklistFillSaving => 'Сохранение...';

  @override
  String get checklistFillSaved => 'Сохранено';

  @override
  String get checklistFillSaveError => 'Не удалось сохранить';

  @override
  String get checklistPhotoAdd => 'Добавить фото';

  @override
  String get checklistPhotoTakePhoto => 'Снять фото';

  @override
  String get checklistPhotoChooseGallery => 'Выбрать из галереи';

  @override
  String get checklistPhotoSourceTitle => 'Добавить фото';

  @override
  String get checklistPhotoRequiredBadge => 'Нужно фото';

  @override
  String get checklistPhotoDeleteConfirmTitle => 'Удалить фото?';

  @override
  String get checklistPhotoDelete => 'Удалить';

  @override
  String get checklistPhotoGeoUnavailable => 'Координаты недоступны';

  @override
  String get checklistPhotoShiftFinished =>
      'Время на дозаполнение чек-листа истекло';

  @override
  String checklistPhotoCaptionTaken(String datetime) {
    return 'Снято: $datetime';
  }

  @override
  String checklistPhotoCaptionAdded(String datetime) {
    return 'Добавлено: $datetime';
  }

  @override
  String checklistPhotoCaptionCoords(String lat, String lng) {
    return 'Координаты: $lat, $lng';
  }

  @override
  String get shiftFinishIncompleteWarning =>
      'Есть незаполненные обязательные чек-листы';

  @override
  String get shiftIncompleteRequiredBadge => 'Чек-листы не выполнены';

  @override
  String shiftFinishGraceWindowNotice(int minutes) {
    return 'После завершения будет ещё $minutes мин на дозаполнение чек-листа';
  }

  @override
  String checklistGraceRemainingMinutes(int minutes) {
    return 'Осталось $minutes мин';
  }

  @override
  String get shiftTrackerGraceBlockTitle =>
      'Дозаполните чек-лист последней смены';

  @override
  String inviteSuccessTitle(String orgName) {
    return 'Вы вступили в организацию «$orgName»';
  }

  @override
  String get inviteContinueAction => 'Продолжить';

  @override
  String get inviteGoHomeAction => 'На главный';

  @override
  String get inviteErrorInvalidTitle => 'Приглашение недействительно';

  @override
  String get inviteErrorInvalidDescription =>
      'Код мог быть отозван. Попросите у руководителя новую ссылку.';

  @override
  String get inviteErrorOwnerTitle => 'Вы владелец этой организации';

  @override
  String get inviteErrorOwnerDescription =>
      'Вступить как сотрудник нельзя — вы уже управляете этой организацией.';

  @override
  String get inviteErrorAlreadyMemberTitle =>
      'Вы уже состоите в этой организации';

  @override
  String get dateRangeFilterTitle => 'Диапазон дат';

  @override
  String get dateRangeFrom => 'С';

  @override
  String get dateRangeTo => 'По';

  @override
  String get dateRangeApply => 'Применить';

  @override
  String get dateRangeReset => 'Сбросить';

  @override
  String dateRangeChipBoth(String from, String to) {
    return '$from – $to';
  }

  @override
  String dateRangeChipFromOnly(String from) {
    return 'с $from';
  }

  @override
  String dateRangeChipToOnly(String to) {
    return 'по $to';
  }

  @override
  String get statsModeCustom => 'Произвольный период';

  @override
  String statsAppliedRange(String from, String to) {
    return 'за $from – $to';
  }

  @override
  String get shiftsEmptyForRange => 'Нет смен за выбранный период';

  @override
  String get errorInvalidDateRange => 'Дата начала позже даты окончания';

  @override
  String get errorMissingStatsRange => 'Не указан период статистики';

  @override
  String get errorAmbiguousStatsRange =>
      'Нельзя задать одновременно пресет и произвольный период';

  @override
  String get errorInvalidPeriod => 'Некорректный период';

  @override
  String get payrollMyEarningsTitle => 'Мой заработок';

  @override
  String get payrollReportTitle => 'Зарплата';

  @override
  String get payrollRateSectionTitle => 'Ставка';

  @override
  String get payrollCurrentRateTitle => 'Текущая ставка';

  @override
  String get payrollAccrued => 'Начислено';

  @override
  String get payrollToPay => 'К выплате';

  @override
  String get payrollWorked => 'Отработано';

  @override
  String get payrollShiftsCount => 'Смен';

  @override
  String get payrollRateHourly => 'за час';

  @override
  String get payrollRatePerShift => 'за смену';

  @override
  String payrollRateEffectiveFrom(String date) {
    return 'Действует с $date';
  }

  @override
  String get payrollRateCurrent => 'Действующая';

  @override
  String get payrollRateNotSet => 'Ставка не задана';

  @override
  String get myEarningsNoRate => 'Ставка ещё не задана';

  @override
  String get myEarningsMissingRateHint =>
      'Некоторые смены не оплачены — для них не была задана ставка. Обратитесь к администратору.';

  @override
  String get myEarningsPlanned => 'По графику';

  @override
  String get myEarningsDelta => 'Разница';

  @override
  String get myEarningsDeltaEven => 'Точно по плану';

  @override
  String myEarningsDeltaLess(String amount) {
    return 'Меньше плана на $amount';
  }

  @override
  String myEarningsDeltaMore(String amount) {
    return 'Больше плана на $amount';
  }

  @override
  String myEarningsApprovedOvertime(String duration) {
    return 'Переработка $duration уже учтена в заработке';
  }

  @override
  String get myEarningsLateCount => 'Опоздания';

  @override
  String get myEarningsLateDuration => 'Время опозданий';

  @override
  String get payrollMissingRateBadge => 'Есть смены без ставки';

  @override
  String payrollUnpaidHint(num count, String hours) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count смены',
      many: '$count смен',
      few: '$count смены',
      one: '$count смена',
    );
    return '$_temp0 / $hours не оплачены: нет ставки на дату смены';
  }

  @override
  String get payrollEmptyNoShifts => 'Нет завершённых смен за период';

  @override
  String get payrollRatesEmpty => 'Ставок пока нет';

  @override
  String get showMore => 'Показать ещё';

  @override
  String get finesMyTitle => 'Мои штрафы';

  @override
  String get finesMemberSectionTitle => 'Штрафы';

  @override
  String get finesAssign => 'Назначить штраф';

  @override
  String get finesQuickAssign => 'Оштрафовать';

  @override
  String get finesAssignedSuccess => 'Штраф назначен';

  @override
  String get finesRemove => 'Снять штраф';

  @override
  String get finesEdit => 'Исправить запись';

  @override
  String get finesRemoveConfirm =>
      'Снять этот штраф? Действие можно посмотреть в истории.';

  @override
  String get finesSourceTemplate => 'Из шаблона';

  @override
  String get finesSourceCustom => 'Свой';

  @override
  String get finesFieldReason => 'Причина';

  @override
  String get finesFieldAmount => 'Сумма, ₽';

  @override
  String get finesFieldShift => 'Смена (необязательно)';

  @override
  String get finesFieldDate => 'Дата';

  @override
  String get finesFieldComment => 'Комментарий (необязательно)';

  @override
  String get finesTemplatePick => 'Выберите шаблон';

  @override
  String get finesTemplateEmpty => 'Шаблоны не заданы — добавьте в веб-админке';

  @override
  String get finesAmount => 'Штрафы';

  @override
  String get finesToPay => 'К выплате';

  @override
  String finesCount(int count) {
    return '$count шт.';
  }

  @override
  String get finesAttachedToShift => 'По смене';

  @override
  String get finesMyEmpty => 'Штрафов нет за выбранный период';

  @override
  String get myAdjustmentsTitle => 'Мои начисления';

  @override
  String get myAdjustmentsEmpty => 'Начислений пока нет';

  @override
  String get myEarningsAdjustments => 'Начисления и удержания';

  @override
  String get shiftHistoryAdjustments => 'Доплаты';

  @override
  String get notificationOpenMyEarningsHint =>
      'Откройте «Мой заработок» в организации, чтобы посмотреть начисления';

  @override
  String get finesMemberEmpty => 'Штрафов нет';

  @override
  String get finesEditHint =>
      'Это исправление ошибочной записи. Снять штраф — отдельным действием.';

  @override
  String get finesReasonInvalid => 'Укажите причину (до 200 символов)';

  @override
  String get finesAmountInvalid => 'Сумма должна быть больше нуля';

  @override
  String get finesDateRequired => 'Выберите дату или привяжите смену';

  @override
  String get finesDateRequiredHint => 'Выберите дату';

  @override
  String get finesDateFromShift => 'Возьмётся из смены';

  @override
  String get finesShiftNone => 'Без смены';

  @override
  String get finesShiftPickerTitle => 'Выберите смену';

  @override
  String get finesShiftPickerEmpty => 'У сотрудника нет смен';

  @override
  String get payrollIncludePenalties => 'Учитывать штрафы';

  @override
  String get knowledgeBaseTitle => 'База знаний';

  @override
  String get knowledgeTreeEmpty => 'Нет доступных материалов';

  @override
  String get knowledgePageEmpty => 'Страница пока пустая';

  @override
  String get knowledgeBlockUnsupported =>
      'Этот блок не поддерживается в текущей версии приложения';

  @override
  String get knowledgeOpenYoutube => 'Открыть на YouTube';

  @override
  String get errorPenaltyNotFound => 'Штраф не найден';

  @override
  String get errorPenaltyTemplateNotFound => 'Шаблон штрафа не найден';

  @override
  String get errorKnowledgeNodeNotFound => 'Материал недоступен';

  @override
  String get errorRateNotFound => 'Запись о ставке не найдена';

  @override
  String get errorRateEffectiveFromTaken =>
      'На эту дату у сотрудника уже есть ставка. Выберите другую дату или исправьте существующую.';

  @override
  String get errorMemberNotFound => 'Сотрудник не найден';

  @override
  String get errorValidation => 'Проверьте введённые данные';

  @override
  String get errorAccountLocked =>
      'Слишком много попыток входа. Попробуйте позже';

  @override
  String get errorRateLimitExceeded =>
      'Слишком много запросов. Подождите немного';

  @override
  String get errorTooManyCodeAttempts =>
      'Превышено число попыток. Запросите новый код';

  @override
  String get errorFileTooLarge => 'Файл слишком большой';

  @override
  String get errorUnsupportedFileType => 'Недопустимый формат файла';

  @override
  String get errorStorageUnavailable =>
      'Хранилище недоступно, попробуйте позже';

  @override
  String get errorFileNotFound => 'Файл не найден';

  @override
  String get errorFileInUse => 'Файл используется и не может быть удалён';

  @override
  String get errorInvalidFileCategory => 'Неизвестная категория файла';

  @override
  String get errorPhotoNotAllowed => 'К этому пункту нельзя прикреплять фото';

  @override
  String get errorPhotoLimitExceeded => 'Достигнут лимит фото для пункта';

  @override
  String get errorPhotoNotFound => 'Фото не найдено';

  @override
  String get errorPhotoFileInvalid => 'Файл недоступен, снимите фото заново';

  @override
  String get errorPhotoPermissionDenied =>
      'Нет доступа к камере или галерее. Разрешите доступ в настройках и повторите';

  @override
  String get errorPhotoReadFailed =>
      'Не удалось прочитать фото. Снимите фото заново';

  @override
  String get errorPhotoFileEmpty =>
      'Не удалось прочитать фото. Снимите фото заново';

  @override
  String get errorPhotoDecodeFailed =>
      'Не удалось обработать фото. Попробуйте другой снимок';

  @override
  String get errorPhotoPickFailed =>
      'Не удалось открыть камеру или галерею. Повторите';

  @override
  String get errorShiftFinished => 'Смена завершена';

  @override
  String get errorInstanceNotFound => 'Чек-лист не найден';

  @override
  String get errorItemNotFound => 'Пункт чек-листа не найден';

  @override
  String get errorWorkLocationRequired =>
      'Выберите рабочую точку, чтобы начать смену';

  @override
  String get errorWorkLocationNotFound => 'Рабочая точка не найдена';

  @override
  String get errorScheduleRequired => 'Выберите график работы';

  @override
  String get errorScheduleNotAvailable =>
      'Этот график недоступен на выбранной точке';

  @override
  String get errorScheduleNotFound => 'График не найден, обновите список';

  @override
  String get errorScheduleWindowClosed =>
      'Сейчас не рабочее время по графику. Попробуйте позже';

  @override
  String get errorOvertimeAlreadyRequested =>
      'Заявка по этой смене уже отправлена';

  @override
  String get errorOvertimePeriodExpired => 'Срок подачи заявки истёк';

  @override
  String get errorOvertimeNotApplicable =>
      'По этой смене переработку добавить нельзя';

  @override
  String get errorOvertimeRequestNotFound => 'Заявка на переработку не найдена';

  @override
  String get errorOvertimeAlreadyReviewed =>
      'Заявка уже рассмотрена администратором';

  @override
  String get errorGeoUnavailable =>
      'Не удалось определить геопозицию. Проверьте доступ к геолокации и повторите.';

  @override
  String get errorInvalidOauthToken =>
      'Не удалось подтвердить вход. Попробуйте снова';

  @override
  String get errorOauthEmailNotVerified =>
      'Email в аккаунте не подтверждён. Используйте другой способ входа';

  @override
  String get errorOauthProviderUnavailable =>
      'Сервис входа временно недоступен. Попробуйте позже';

  @override
  String get errorOauthClientError =>
      'Не удалось выполнить вход. Попробуйте снова';

  @override
  String get commonNoConnection => 'Нет соединения';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get shiftOfflineBanner => 'Нет соединения. Проверьте интернет';

  @override
  String get commonDone => 'Готово';

  @override
  String get notificationsTitle => 'Уведомления';

  @override
  String get notificationsEmpty => 'Уведомлений пока нет';

  @override
  String get notificationsMarkAllRead => 'Прочитать все';

  @override
  String get errorNotificationNotFound => 'Уведомление не найдено';

  @override
  String get myTestsTitle => 'Мои тесты';

  @override
  String get myTestsEmpty => 'Назначенных тестов нет';

  @override
  String get myTestsStatusAssigned => 'Не начат';

  @override
  String get myTestsStatusInProgress => 'В процессе';

  @override
  String get myTestsStatusPassed => 'Сдан';

  @override
  String get myTestsStatusFailed => 'Не сдан';

  @override
  String myTestsAttemptsProgress(int used, int max) {
    return 'Попытки: $used/$max';
  }

  @override
  String myTestsBestPercent(int percent) {
    return 'Лучший результат: $percent%';
  }

  @override
  String myTestsDueDate(String date) {
    return 'Срок: $date';
  }

  @override
  String get myTestsAllOrganizations => 'Все организации';

  @override
  String get testAttemptTitle => 'Тест';

  @override
  String testAttemptProgress(int answered, int total) {
    return 'Отвечено $answered из $total';
  }

  @override
  String testAttemptQuestionNumber(int number) {
    return 'Вопрос $number';
  }

  @override
  String get testAttemptUnsupportedQuestion =>
      'Этот тип вопроса пока не поддерживается в приложении';

  @override
  String get testAttemptSubmit => 'Завершить';

  @override
  String get testAttemptResultPassed => 'Зачёт';

  @override
  String get testAttemptResultFailed => 'Не зачёт';

  @override
  String testAttemptResultScore(int score, int maxScore) {
    return 'Баллы: $score из $maxScore';
  }

  @override
  String testAttemptResultPercent(int percent) {
    return '$percent%';
  }

  @override
  String testAttemptResultAttemptsLeft(int count) {
    return 'Осталось попыток: $count';
  }

  @override
  String get testAttemptRetry => 'Пройти ещё раз';

  @override
  String get testAttemptUnassignedTitle => 'Тест больше не назначен';

  @override
  String get testAttemptUnassignedMessage =>
      'Администратор снял этот тест. Результаты по нему не сохраняются.';

  @override
  String get testAttemptDeletedTitle => 'Тест удалён';

  @override
  String get testAttemptBackToList => 'К списку тестов';

  @override
  String get errorTestAttemptsExhausted => 'Попытки для этого теста исчерпаны';

  @override
  String get errorTestAlreadyPassed => 'Тест уже сдан';

  @override
  String get errorTestAttemptAlreadySubmitted => 'Эта попытка уже сдана';

  @override
  String get errorTestAttemptInProgress =>
      'У вас уже есть незавершённая попытка';

  @override
  String get errorTestTemplateArchived => 'Тест больше не доступен';

  @override
  String get errorTestAssignmentNotFound => 'Назначение теста не найдено';

  @override
  String get errorTestTemplateDeleted => 'Тест удалён';

  @override
  String get errorSubscriptionInactive =>
      'Организация временно приостановлена. Обратитесь к руководителю';

  @override
  String get errorPlanLimitReached =>
      'В организации закончились свободные места. Обратитесь к руководителю';

  @override
  String get errorPlanFeatureUnavailable =>
      'Функция недоступна на текущем тарифе';

  @override
  String subscriptionBannerTrialEnding(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'Пробный период заканчивается через $_temp0';
  }

  @override
  String subscriptionBannerPastDue(String paidUntil, String accessUntil) {
    return 'Период оплачен до $paidUntil. Доступ сохранится до $accessUntil';
  }

  @override
  String get subscriptionBannerReadOnly =>
      'Организация в режиме только для чтения';

  @override
  String get subscriptionBannerAction => 'Продлите тариф в веб-кабинете';

  @override
  String get pwaInstallEntryPoint => 'Установить приложение';

  @override
  String get pwaInstallTitle => 'Установите Smenka на устройство';

  @override
  String get pwaInstallSubtitle =>
      'Займёт пару секунд — приложение появится рядом с остальными.';

  @override
  String get pwaInstallBenefitIcon => 'Значок на экране устройства';

  @override
  String get pwaInstallBenefitFullscreen => 'Полный экран без адресной строки';

  @override
  String get pwaInstallBenefitFast => 'Быстрый запуск в один тап';

  @override
  String get pwaInstallAction => 'Установить';

  @override
  String get pwaInstallLater => 'Позже';

  @override
  String get pwaInstallGotIt => 'Понятно';

  @override
  String get pwaInstallIosStepsTitle => 'Как установить в Safari';

  @override
  String get pwaInstallIosStepShare =>
      'Нажмите «Поделиться» в нижней панели браузера';

  @override
  String get pwaInstallIosStepAddToHome => 'Выберите «На экран „Домой“»';

  @override
  String get pwaInstallIosStepConfirm => 'Подтвердите — «Добавить»';

  @override
  String get pwaInstallManualStepsTitle => 'Как установить';

  @override
  String get pwaInstallManualHint =>
      'Откройте меню браузера и выберите «Установить приложение» или «Добавить на главный экран».';
}
