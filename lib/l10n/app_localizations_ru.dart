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
  String get organizationsCreate => 'Создать организацию';

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
  String get orgDetailInviteCode => 'Инвайт-код';

  @override
  String get orgDetailInviteCopied => 'Код скопирован';

  @override
  String get orgDetailRotateInvite => 'Обновить код';

  @override
  String get orgDetailRotateConfirm =>
      'Старый код перестанет работать. Обновить?';

  @override
  String get orgDetailLeave => 'Покинуть организацию';

  @override
  String get orgDetailLeaveConfirm =>
      'Вы уверены, что хотите покинуть организацию?';

  @override
  String get orgDetailDelete => 'Удалить организацию';

  @override
  String get orgDetailDeleteConfirm =>
      'Организация будет удалена безвозвратно. Продолжить?';

  @override
  String get orgDetailDeleted => 'Организация удалена';

  @override
  String get orgDetailLeft => 'Вы покинули организацию';

  @override
  String get orgDetailSettings => 'Настройки';

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
  String get membersRemove => 'Удалить участника';

  @override
  String membersRemoveConfirm(String name) {
    return 'Удалить $name из организации?';
  }

  @override
  String get membersRemoved => 'Участник удалён';

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
  String get orgSettingsTitle => 'Настройки организации';

  @override
  String get orgSettingsGeoCheck => 'Геопроверка';

  @override
  String get orgSettingsGeoCheckDesc =>
      'Проверять местоположение при начале смены';

  @override
  String get orgSettingsAutoFinish => 'Автозавершение (часы)';

  @override
  String get orgSettingsAutoFinishDesc =>
      'Автоматически завершать смену через N часов';

  @override
  String get orgSettingsMaxPause => 'Макс. пауза (минуты)';

  @override
  String get orgSettingsMaxPauseDesc =>
      'Максимальная продолжительность одной паузы';

  @override
  String get orgSettingsMaxPauses => 'Макс. пауз за смену';

  @override
  String get orgSettingsMaxPausesDesc =>
      'Максимальное количество пауз за смену';

  @override
  String get orgSettingsSaved => 'Настройки сохранены';

  @override
  String get workLocationsTitle => 'Рабочие точки';

  @override
  String get workLocationsEmpty => 'Нет рабочих точек';

  @override
  String get workLocationsAdd => 'Добавить точку';

  @override
  String get workLocationsDelete => 'Удалить точку';

  @override
  String workLocationsDeleteConfirm(String name) {
    return 'Удалить рабочую точку \"$name\"?';
  }

  @override
  String get workLocationsDeleted => 'Точка удалена';

  @override
  String workLocationsRadius(int meters) {
    return 'Радиус: $meters м';
  }

  @override
  String get addLocationTitle => 'Новая точка';

  @override
  String get editLocationTitle => 'Редактирование точки';

  @override
  String get addLocationName => 'Название точки';

  @override
  String get addLocationNameHint => 'Например: Офис на Тверской';

  @override
  String get addLocationNameRequired => 'Укажите название';

  @override
  String addLocationRadius(int meters) {
    return 'Радиус ($meters м)';
  }

  @override
  String get addLocationSaved => 'Точка сохранена';

  @override
  String get addLocationMoveMap => 'Переместите карту для выбора точки';

  @override
  String get orgShiftsTitle => 'Смены сотрудников';

  @override
  String get orgShiftsEmpty => 'Нет смен';

  @override
  String get orgShiftsFilterEmployee => 'Сотрудник';

  @override
  String get orgShiftsAllEmployees => 'Все сотрудники';

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
  String get superAdminTitle => 'Админ-панель';

  @override
  String get superAdminAllOrgs => 'Все организации';

  @override
  String get superAdminEmpty => 'Нет организаций';

  @override
  String get orgDetailLocations => 'Рабочие точки';

  @override
  String deepLinkJoinSuccess(String orgName) {
    return 'Вы присоединились к $orgName по ссылке';
  }

  @override
  String get deepLinkJoinError => 'Не удалось присоединиться по ссылке';
}
