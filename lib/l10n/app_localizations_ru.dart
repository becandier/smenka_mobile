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
  String get authInvalidCredentials => 'Неверный email или пароль';

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
  String get shiftPersonal => 'Персональная';

  @override
  String get shiftSelectOrg => 'Выберите организацию';

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
  String get detailPauses => 'Паузы';

  @override
  String get detailPersonal => 'Персональная';

  @override
  String get detailInProgress => 'В процессе';

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
  String get shiftFinishIncompleteWarning =>
      'Есть незаполненные обязательные чек-листы';

  @override
  String get shiftIncompleteRequiredBadge => 'Чек-листы не выполнены';

  @override
  String deepLinkJoinSuccess(String orgName) {
    return 'Вы присоединились к $orgName по ссылке';
  }

  @override
  String get deepLinkJoinError => 'Не удалось присоединиться по ссылке';

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
  String get commonNoConnection => 'Нет соединения';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get shiftOfflineBanner => 'Нет соединения. Проверьте интернет';
}
