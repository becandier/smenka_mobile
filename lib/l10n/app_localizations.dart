import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @success.
  ///
  /// In ru, this message translates to:
  /// **'Успешно'**
  String get success;

  /// No description provided for @error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get error;

  /// No description provided for @loading.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка'**
  String get loading;

  /// No description provided for @techWorks.
  ///
  /// In ru, this message translates to:
  /// **'Технические работы'**
  String get techWorks;

  /// No description provided for @techWorksDescription.
  ///
  /// In ru, this message translates to:
  /// **'В данный момент в приложении производятся технические работы. Приложение будет доступно после их окончания.'**
  String get techWorksDescription;

  /// No description provided for @refresh.
  ///
  /// In ru, this message translates to:
  /// **'Обновить'**
  String get refresh;

  /// No description provided for @attention.
  ///
  /// In ru, this message translates to:
  /// **'Внимание'**
  String get attention;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @deviceNotConnected.
  ///
  /// In ru, this message translates to:
  /// **'Устройство не подключено к сети. Проверьте соединение.'**
  String get deviceNotConnected;

  /// No description provided for @vpnEnabled.
  ///
  /// In ru, this message translates to:
  /// **'VPN включён. Это может повлиять на работу приложения.'**
  String get vpnEnabled;

  /// No description provided for @home.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @enterInDebugMode.
  ///
  /// In ru, this message translates to:
  /// **'Вход в режим разработчика'**
  String get enterInDebugMode;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @passwordIncorrect.
  ///
  /// In ru, this message translates to:
  /// **'Неверный пароль'**
  String get passwordIncorrect;

  /// No description provided for @debugMode.
  ///
  /// In ru, this message translates to:
  /// **'Режим разработчика'**
  String get debugMode;

  /// No description provided for @flavor.
  ///
  /// In ru, this message translates to:
  /// **'Среда'**
  String get flavor;

  /// No description provided for @logs.
  ///
  /// In ru, this message translates to:
  /// **'Логи'**
  String get logs;

  /// No description provided for @azkars.
  ///
  /// In ru, this message translates to:
  /// **'Азкары'**
  String get azkars;

  /// No description provided for @errorOccurred.
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка'**
  String get errorOccurred;

  /// No description provided for @errorDescription.
  ///
  /// In ru, this message translates to:
  /// **'К сожалению, что-то пошло не так. Мы уже работаем над исправлением этой проблемы.'**
  String get errorDescription;

  /// No description provided for @tryAgain.
  ///
  /// In ru, this message translates to:
  /// **'Попробовать снова'**
  String get tryAgain;

  /// No description provided for @errorDetails.
  ///
  /// In ru, this message translates to:
  /// **'Детали ошибки'**
  String get errorDetails;

  /// No description provided for @errorVpnDescription.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось загрузить необходимые данные для работы приложения. Пожалуйста, выключите VPN и повторите попытку.'**
  String get errorVpnDescription;

  /// No description provided for @light.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In ru, this message translates to:
  /// **'Тёмная'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In ru, this message translates to:
  /// **'Системная'**
  String get system;

  /// No description provided for @noData.
  ///
  /// In ru, this message translates to:
  /// **'Нет данных'**
  String get noData;

  /// No description provided for @retry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;

  /// No description provided for @authLogin.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get authLogin;

  /// No description provided for @authRegister.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get authRegister;

  /// No description provided for @authEmail.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// No description provided for @authEmailHint.
  ///
  /// In ru, this message translates to:
  /// **'example@mail.com'**
  String get authEmailHint;

  /// No description provided for @authPassword.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get authPassword;

  /// No description provided for @authName.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get authName;

  /// No description provided for @authNameHint.
  ///
  /// In ru, this message translates to:
  /// **'Иван Иванов'**
  String get authNameHint;

  /// No description provided for @authNoAccount.
  ///
  /// In ru, this message translates to:
  /// **'Нет аккаунта? Зарегистрироваться'**
  String get authNoAccount;

  /// No description provided for @authHasAccount.
  ///
  /// In ru, this message translates to:
  /// **'Уже есть аккаунт? Войти'**
  String get authHasAccount;

  /// No description provided for @authVerifyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждение email'**
  String get authVerifyTitle;

  /// No description provided for @authVerifySubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен на {email}'**
  String authVerifySubtitle(String email);

  /// No description provided for @authResendCode.
  ///
  /// In ru, this message translates to:
  /// **'Отправить повторно'**
  String get authResendCode;

  /// No description provided for @authResendCodeTimer.
  ///
  /// In ru, this message translates to:
  /// **'Отправить повторно ({seconds}с)'**
  String authResendCodeTimer(int seconds);

  /// No description provided for @authPasswordMinLength.
  ///
  /// In ru, this message translates to:
  /// **'Минимум 8 символов'**
  String get authPasswordMinLength;

  /// No description provided for @authPasswordNeedLetter.
  ///
  /// In ru, this message translates to:
  /// **'Хотя бы одна буква'**
  String get authPasswordNeedLetter;

  /// No description provided for @authPasswordNeedDigit.
  ///
  /// In ru, this message translates to:
  /// **'Хотя бы одна цифра'**
  String get authPasswordNeedDigit;

  /// No description provided for @authCodeSent.
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен на почту'**
  String get authCodeSent;

  /// No description provided for @authCodeResent.
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен повторно'**
  String get authCodeResent;

  /// No description provided for @authEmailTaken.
  ///
  /// In ru, this message translates to:
  /// **'Пользователь с таким email уже существует'**
  String get authEmailTaken;

  /// No description provided for @authInvalidCredentials.
  ///
  /// In ru, this message translates to:
  /// **'Неверный email или пароль'**
  String get authInvalidCredentials;

  /// No description provided for @authInvalidCode.
  ///
  /// In ru, this message translates to:
  /// **'Неверный или просроченный код'**
  String get authInvalidCode;

  /// No description provided for @authEmailNotVerified.
  ///
  /// In ru, this message translates to:
  /// **'Email не подтверждён, введите код'**
  String get authEmailNotVerified;

  /// No description provided for @shiftTracker.
  ///
  /// In ru, this message translates to:
  /// **'Смена'**
  String get shiftTracker;

  /// No description provided for @shiftHistory.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get shiftHistory;

  /// No description provided for @shiftProfile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get shiftProfile;

  /// No description provided for @shiftStart.
  ///
  /// In ru, this message translates to:
  /// **'Начать смену'**
  String get shiftStart;

  /// No description provided for @shiftPause.
  ///
  /// In ru, this message translates to:
  /// **'Пауза'**
  String get shiftPause;

  /// No description provided for @shiftResume.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get shiftResume;

  /// No description provided for @shiftFinish.
  ///
  /// In ru, this message translates to:
  /// **'Завершить'**
  String get shiftFinish;

  /// No description provided for @shiftPersonal.
  ///
  /// In ru, this message translates to:
  /// **'Персональная'**
  String get shiftPersonal;

  /// No description provided for @shiftSelectOrg.
  ///
  /// In ru, this message translates to:
  /// **'Выберите организацию'**
  String get shiftSelectOrg;

  /// No description provided for @shiftActive.
  ///
  /// In ru, this message translates to:
  /// **'Смена активна'**
  String get shiftActive;

  /// No description provided for @shiftPaused.
  ///
  /// In ru, this message translates to:
  /// **'Смена на паузе'**
  String get shiftPaused;

  /// No description provided for @shiftElapsed.
  ///
  /// In ru, this message translates to:
  /// **'Время работы'**
  String get shiftElapsed;

  /// No description provided for @shiftPauses.
  ///
  /// In ru, this message translates to:
  /// **'Паузы'**
  String get shiftPauses;

  /// No description provided for @shiftPauseNumber.
  ///
  /// In ru, this message translates to:
  /// **'Пауза {number}'**
  String shiftPauseNumber(int number);

  /// No description provided for @shiftNoPauses.
  ///
  /// In ru, this message translates to:
  /// **'Пауз нет'**
  String get shiftNoPauses;

  /// No description provided for @shiftStarted.
  ///
  /// In ru, this message translates to:
  /// **'Смена начата'**
  String get shiftStarted;

  /// No description provided for @shiftFinished.
  ///
  /// In ru, this message translates to:
  /// **'Смена завершена'**
  String get shiftFinished;

  /// No description provided for @shiftPauseStarted.
  ///
  /// In ru, this message translates to:
  /// **'Пауза начата'**
  String get shiftPauseStarted;

  /// No description provided for @shiftResumed.
  ///
  /// In ru, this message translates to:
  /// **'Смена продолжена'**
  String get shiftResumed;

  /// No description provided for @shiftLocationRequired.
  ///
  /// In ru, this message translates to:
  /// **'Для этой организации требуется геопроверка'**
  String get shiftLocationRequired;

  /// No description provided for @shiftLocationDenied.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к геолокации запрещён'**
  String get shiftLocationDenied;

  /// No description provided for @shiftLocationOutOfRange.
  ///
  /// In ru, this message translates to:
  /// **'Вы находитесь за пределами рабочей зоны'**
  String get shiftLocationOutOfRange;

  /// No description provided for @shiftConfirmFinish.
  ///
  /// In ru, this message translates to:
  /// **'Завершить смену?'**
  String get shiftConfirmFinish;

  /// No description provided for @shiftConfirmFinishBody.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите завершить текущую смену?'**
  String get shiftConfirmFinishBody;

  /// No description provided for @confirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirm;

  /// No description provided for @historyTitle.
  ///
  /// In ru, this message translates to:
  /// **'История смен'**
  String get historyTitle;

  /// No description provided for @historyEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет смен'**
  String get historyEmpty;

  /// No description provided for @historyFilterAll.
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get historyFilterAll;

  /// No description provided for @historyFilterActive.
  ///
  /// In ru, this message translates to:
  /// **'Активные'**
  String get historyFilterActive;

  /// No description provided for @historyFilterPaused.
  ///
  /// In ru, this message translates to:
  /// **'На паузе'**
  String get historyFilterPaused;

  /// No description provided for @historyFilterFinished.
  ///
  /// In ru, this message translates to:
  /// **'Завершённые'**
  String get historyFilterFinished;

  /// No description provided for @historyDateFrom.
  ///
  /// In ru, this message translates to:
  /// **'Дата от'**
  String get historyDateFrom;

  /// No description provided for @historyDateTo.
  ///
  /// In ru, this message translates to:
  /// **'Дата до'**
  String get historyDateTo;

  /// No description provided for @historyResetFilters.
  ///
  /// In ru, this message translates to:
  /// **'Сбросить'**
  String get historyResetFilters;

  /// No description provided for @statsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Статистика'**
  String get statsTitle;

  /// No description provided for @statsPeriodDay.
  ///
  /// In ru, this message translates to:
  /// **'День'**
  String get statsPeriodDay;

  /// No description provided for @statsPeriodWeek.
  ///
  /// In ru, this message translates to:
  /// **'Неделя'**
  String get statsPeriodWeek;

  /// No description provided for @statsPeriodMonth.
  ///
  /// In ru, this message translates to:
  /// **'Месяц'**
  String get statsPeriodMonth;

  /// No description provided for @statsTotalWorked.
  ///
  /// In ru, this message translates to:
  /// **'Отработано'**
  String get statsTotalWorked;

  /// No description provided for @statsShiftCount.
  ///
  /// In ru, this message translates to:
  /// **'Смен'**
  String get statsShiftCount;

  /// No description provided for @statsAverage.
  ///
  /// In ru, this message translates to:
  /// **'Среднее'**
  String get statsAverage;

  /// No description provided for @statsHours.
  ///
  /// In ru, this message translates to:
  /// **'{hours} ч {minutes} мин'**
  String statsHours(int hours, int minutes);

  /// No description provided for @detailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Детали смены'**
  String get detailTitle;

  /// No description provided for @detailStarted.
  ///
  /// In ru, this message translates to:
  /// **'Начало'**
  String get detailStarted;

  /// No description provided for @detailFinished.
  ///
  /// In ru, this message translates to:
  /// **'Конец'**
  String get detailFinished;

  /// No description provided for @detailDuration.
  ///
  /// In ru, this message translates to:
  /// **'Длительность'**
  String get detailDuration;

  /// No description provided for @detailStatus.
  ///
  /// In ru, this message translates to:
  /// **'Статус'**
  String get detailStatus;

  /// No description provided for @detailOrganization.
  ///
  /// In ru, this message translates to:
  /// **'Организация'**
  String get detailOrganization;

  /// No description provided for @detailPauses.
  ///
  /// In ru, this message translates to:
  /// **'Паузы'**
  String get detailPauses;

  /// No description provided for @detailPersonal.
  ///
  /// In ru, this message translates to:
  /// **'Персональная'**
  String get detailPersonal;

  /// No description provided for @detailInProgress.
  ///
  /// In ru, this message translates to:
  /// **'В процессе'**
  String get detailInProgress;

  /// No description provided for @statusActive.
  ///
  /// In ru, this message translates to:
  /// **'Активна'**
  String get statusActive;

  /// No description provided for @statusPaused.
  ///
  /// In ru, this message translates to:
  /// **'На паузе'**
  String get statusPaused;

  /// No description provided for @statusFinished.
  ///
  /// In ru, this message translates to:
  /// **'Завершена'**
  String get statusFinished;

  /// No description provided for @profileTitle.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profileTitle;

  /// No description provided for @personalInfo.
  ///
  /// In ru, this message translates to:
  /// **'Личные данные'**
  String get personalInfo;

  /// No description provided for @editProfile.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать'**
  String get editProfile;

  /// No description provided for @myOrganizations.
  ///
  /// In ru, this message translates to:
  /// **'Мои организации'**
  String get myOrganizations;

  /// No description provided for @noOrganizations.
  ///
  /// In ru, this message translates to:
  /// **'Вы не состоите в организациях'**
  String get noOrganizations;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выход'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите выйти?'**
  String get logoutConfirmMessage;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @phone.
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get phone;

  /// No description provided for @phoneHint.
  ///
  /// In ru, this message translates to:
  /// **'+7 999 123 45 67'**
  String get phoneHint;

  /// No description provided for @phoneNotSpecified.
  ///
  /// In ru, this message translates to:
  /// **'Не указан'**
  String get phoneNotSpecified;

  /// No description provided for @memberSince.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрирован с {date}'**
  String memberSince(String date);

  /// No description provided for @profileUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Профиль обновлён'**
  String get profileUpdated;

  /// No description provided for @theme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get theme;

  /// No description provided for @roleOwner.
  ///
  /// In ru, this message translates to:
  /// **'Владелец'**
  String get roleOwner;

  /// No description provided for @roleMember.
  ///
  /// In ru, this message translates to:
  /// **'Участник'**
  String get roleMember;

  /// No description provided for @nameRequired.
  ///
  /// In ru, this message translates to:
  /// **'Имя не может быть пустым'**
  String get nameRequired;

  /// No description provided for @organizationsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Организации'**
  String get organizationsTitle;

  /// No description provided for @organizationsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Вы не состоите ни в одной организации'**
  String get organizationsEmpty;

  /// No description provided for @organizationsCreate.
  ///
  /// In ru, this message translates to:
  /// **'Создать организацию'**
  String get organizationsCreate;

  /// No description provided for @organizationsJoin.
  ///
  /// In ru, this message translates to:
  /// **'Присоединиться'**
  String get organizationsJoin;

  /// No description provided for @organizationsJoinByCode.
  ///
  /// In ru, this message translates to:
  /// **'Присоединиться по коду'**
  String get organizationsJoinByCode;

  /// No description provided for @createOrgTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новая организация'**
  String get createOrgTitle;

  /// No description provided for @createOrgNameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Название организации'**
  String get createOrgNameLabel;

  /// No description provided for @createOrgNameHint.
  ///
  /// In ru, this message translates to:
  /// **'Введите название'**
  String get createOrgNameHint;

  /// No description provided for @createOrgNameRequired.
  ///
  /// In ru, this message translates to:
  /// **'Название не может быть пустым'**
  String get createOrgNameRequired;

  /// No description provided for @createOrgSuccess.
  ///
  /// In ru, this message translates to:
  /// **'Организация создана'**
  String get createOrgSuccess;

  /// No description provided for @joinOrgTitle.
  ///
  /// In ru, this message translates to:
  /// **'Присоединиться к организации'**
  String get joinOrgTitle;

  /// No description provided for @joinOrgCodeLabel.
  ///
  /// In ru, this message translates to:
  /// **'Инвайт-код'**
  String get joinOrgCodeLabel;

  /// No description provided for @joinOrgCodeHint.
  ///
  /// In ru, this message translates to:
  /// **'Введите 8-значный код'**
  String get joinOrgCodeHint;

  /// No description provided for @joinOrgCodeRequired.
  ///
  /// In ru, this message translates to:
  /// **'Код не может быть пустым'**
  String get joinOrgCodeRequired;

  /// No description provided for @joinOrgSuccess.
  ///
  /// In ru, this message translates to:
  /// **'Вы присоединились к {orgName}'**
  String joinOrgSuccess(String orgName);

  /// No description provided for @orgDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Организация'**
  String get orgDetailTitle;

  /// No description provided for @orgDetailMembers.
  ///
  /// In ru, this message translates to:
  /// **'Участники'**
  String get orgDetailMembers;

  /// No description provided for @orgDetailMembersCount.
  ///
  /// In ru, this message translates to:
  /// **'{count} участников'**
  String orgDetailMembersCount(int count);

  /// No description provided for @orgDetailInviteCode.
  ///
  /// In ru, this message translates to:
  /// **'Инвайт-код'**
  String get orgDetailInviteCode;

  /// No description provided for @orgDetailInviteCopied.
  ///
  /// In ru, this message translates to:
  /// **'Код скопирован'**
  String get orgDetailInviteCopied;

  /// No description provided for @orgDetailRotateInvite.
  ///
  /// In ru, this message translates to:
  /// **'Обновить код'**
  String get orgDetailRotateInvite;

  /// No description provided for @orgDetailRotateConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Старый код перестанет работать. Обновить?'**
  String get orgDetailRotateConfirm;

  /// No description provided for @orgDetailLeave.
  ///
  /// In ru, this message translates to:
  /// **'Покинуть организацию'**
  String get orgDetailLeave;

  /// No description provided for @orgDetailLeaveConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите покинуть организацию?'**
  String get orgDetailLeaveConfirm;

  /// No description provided for @orgDetailDelete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить организацию'**
  String get orgDetailDelete;

  /// No description provided for @orgDetailDeleteConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Организация будет удалена безвозвратно. Продолжить?'**
  String get orgDetailDeleteConfirm;

  /// No description provided for @orgDetailDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Организация удалена'**
  String get orgDetailDeleted;

  /// No description provided for @orgDetailLeft.
  ///
  /// In ru, this message translates to:
  /// **'Вы покинули организацию'**
  String get orgDetailLeft;

  /// No description provided for @orgDetailSettings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get orgDetailSettings;

  /// No description provided for @orgDetailShifts.
  ///
  /// In ru, this message translates to:
  /// **'Смены сотрудников'**
  String get orgDetailShifts;

  /// No description provided for @orgDetailStats.
  ///
  /// In ru, this message translates to:
  /// **'Статистика'**
  String get orgDetailStats;

  /// No description provided for @roleOwnerFull.
  ///
  /// In ru, this message translates to:
  /// **'Владелец'**
  String get roleOwnerFull;

  /// No description provided for @roleAdmin.
  ///
  /// In ru, this message translates to:
  /// **'Администратор'**
  String get roleAdmin;

  /// No description provided for @roleEmployee.
  ///
  /// In ru, this message translates to:
  /// **'Сотрудник'**
  String get roleEmployee;

  /// No description provided for @memberSinceDate.
  ///
  /// In ru, this message translates to:
  /// **'С {date}'**
  String memberSinceDate(String date);

  /// No description provided for @membersTitle.
  ///
  /// In ru, this message translates to:
  /// **'Участники'**
  String get membersTitle;

  /// No description provided for @membersEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет участников'**
  String get membersEmpty;

  /// No description provided for @membersRemove.
  ///
  /// In ru, this message translates to:
  /// **'Удалить участника'**
  String get membersRemove;

  /// No description provided for @membersRemoveConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Удалить {name} из организации?'**
  String membersRemoveConfirm(String name);

  /// No description provided for @membersRemoved.
  ///
  /// In ru, this message translates to:
  /// **'Участник удалён'**
  String get membersRemoved;

  /// No description provided for @membersMakeAdmin.
  ///
  /// In ru, this message translates to:
  /// **'Назначить администратором'**
  String get membersMakeAdmin;

  /// No description provided for @membersMakeEmployee.
  ///
  /// In ru, this message translates to:
  /// **'Снять администратора'**
  String get membersMakeEmployee;

  /// No description provided for @membersRoleChanged.
  ///
  /// In ru, this message translates to:
  /// **'Роль изменена'**
  String get membersRoleChanged;

  /// No description provided for @membersCantEditSelf.
  ///
  /// In ru, this message translates to:
  /// **'Нельзя изменить свою роль'**
  String get membersCantEditSelf;

  /// No description provided for @membersJoinedAt.
  ///
  /// In ru, this message translates to:
  /// **'С {date}'**
  String membersJoinedAt(String date);

  /// No description provided for @orgSettingsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Настройки организации'**
  String get orgSettingsTitle;

  /// No description provided for @orgSettingsGeoCheck.
  ///
  /// In ru, this message translates to:
  /// **'Геопроверка'**
  String get orgSettingsGeoCheck;

  /// No description provided for @orgSettingsGeoCheckDesc.
  ///
  /// In ru, this message translates to:
  /// **'Проверять местоположение при начале смены'**
  String get orgSettingsGeoCheckDesc;

  /// No description provided for @orgSettingsAutoFinish.
  ///
  /// In ru, this message translates to:
  /// **'Автозавершение (часы)'**
  String get orgSettingsAutoFinish;

  /// No description provided for @orgSettingsAutoFinishDesc.
  ///
  /// In ru, this message translates to:
  /// **'Автоматически завершать смену через N часов'**
  String get orgSettingsAutoFinishDesc;

  /// No description provided for @orgSettingsMaxPause.
  ///
  /// In ru, this message translates to:
  /// **'Макс. пауза (минуты)'**
  String get orgSettingsMaxPause;

  /// No description provided for @orgSettingsMaxPauseDesc.
  ///
  /// In ru, this message translates to:
  /// **'Максимальная продолжительность одной паузы'**
  String get orgSettingsMaxPauseDesc;

  /// No description provided for @orgSettingsMaxPauses.
  ///
  /// In ru, this message translates to:
  /// **'Макс. пауз за смену'**
  String get orgSettingsMaxPauses;

  /// No description provided for @orgSettingsMaxPausesDesc.
  ///
  /// In ru, this message translates to:
  /// **'Максимальное количество пауз за смену'**
  String get orgSettingsMaxPausesDesc;

  /// No description provided for @orgSettingsSaved.
  ///
  /// In ru, this message translates to:
  /// **'Настройки сохранены'**
  String get orgSettingsSaved;

  /// No description provided for @workLocationsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Рабочие точки'**
  String get workLocationsTitle;

  /// No description provided for @workLocationsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет рабочих точек'**
  String get workLocationsEmpty;

  /// No description provided for @workLocationsAdd.
  ///
  /// In ru, this message translates to:
  /// **'Добавить точку'**
  String get workLocationsAdd;

  /// No description provided for @workLocationsDelete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить точку'**
  String get workLocationsDelete;

  /// No description provided for @workLocationsDeleteConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Удалить рабочую точку \"{name}\"?'**
  String workLocationsDeleteConfirm(String name);

  /// No description provided for @workLocationsDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Точка удалена'**
  String get workLocationsDeleted;

  /// No description provided for @workLocationsRadius.
  ///
  /// In ru, this message translates to:
  /// **'Радиус: {meters} м'**
  String workLocationsRadius(int meters);

  /// No description provided for @addLocationTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новая точка'**
  String get addLocationTitle;

  /// No description provided for @editLocationTitle.
  ///
  /// In ru, this message translates to:
  /// **'Редактирование точки'**
  String get editLocationTitle;

  /// No description provided for @addLocationName.
  ///
  /// In ru, this message translates to:
  /// **'Название точки'**
  String get addLocationName;

  /// No description provided for @addLocationNameHint.
  ///
  /// In ru, this message translates to:
  /// **'Например: Офис на Тверской'**
  String get addLocationNameHint;

  /// No description provided for @addLocationNameRequired.
  ///
  /// In ru, this message translates to:
  /// **'Укажите название'**
  String get addLocationNameRequired;

  /// No description provided for @addLocationRadius.
  ///
  /// In ru, this message translates to:
  /// **'Радиус ({meters} м)'**
  String addLocationRadius(int meters);

  /// No description provided for @addLocationSaved.
  ///
  /// In ru, this message translates to:
  /// **'Точка сохранена'**
  String get addLocationSaved;

  /// No description provided for @addLocationMoveMap.
  ///
  /// In ru, this message translates to:
  /// **'Переместите карту для выбора точки'**
  String get addLocationMoveMap;

  /// No description provided for @orgShiftsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Смены сотрудников'**
  String get orgShiftsTitle;

  /// No description provided for @orgShiftsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет смен'**
  String get orgShiftsEmpty;

  /// No description provided for @orgShiftsFilterEmployee.
  ///
  /// In ru, this message translates to:
  /// **'Сотрудник'**
  String get orgShiftsFilterEmployee;

  /// No description provided for @orgShiftsAllEmployees.
  ///
  /// In ru, this message translates to:
  /// **'Все сотрудники'**
  String get orgShiftsAllEmployees;

  /// No description provided for @orgStatsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Статистика организации'**
  String get orgStatsTitle;

  /// No description provided for @orgStatsTotalHours.
  ///
  /// In ru, this message translates to:
  /// **'Всего часов'**
  String get orgStatsTotalHours;

  /// No description provided for @orgStatsShiftCount.
  ///
  /// In ru, this message translates to:
  /// **'Кол-во смен'**
  String get orgStatsShiftCount;

  /// No description provided for @orgStatsAvgShift.
  ///
  /// In ru, this message translates to:
  /// **'Средняя смена'**
  String get orgStatsAvgShift;

  /// No description provided for @orgStatsChartTitle.
  ///
  /// In ru, this message translates to:
  /// **'Часы по сотрудникам'**
  String get orgStatsChartTitle;

  /// No description provided for @orgStatsTableName.
  ///
  /// In ru, this message translates to:
  /// **'Сотрудник'**
  String get orgStatsTableName;

  /// No description provided for @orgStatsTableShifts.
  ///
  /// In ru, this message translates to:
  /// **'Смены'**
  String get orgStatsTableShifts;

  /// No description provided for @orgStatsTableHours.
  ///
  /// In ru, this message translates to:
  /// **'Часы'**
  String get orgStatsTableHours;

  /// No description provided for @orgStatsTableAvg.
  ///
  /// In ru, this message translates to:
  /// **'Средн.'**
  String get orgStatsTableAvg;

  /// No description provided for @superAdminTitle.
  ///
  /// In ru, this message translates to:
  /// **'Админ-панель'**
  String get superAdminTitle;

  /// No description provided for @superAdminAllOrgs.
  ///
  /// In ru, this message translates to:
  /// **'Все организации'**
  String get superAdminAllOrgs;

  /// No description provided for @superAdminEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет организаций'**
  String get superAdminEmpty;

  /// No description provided for @orgDetailLocations.
  ///
  /// In ru, this message translates to:
  /// **'Рабочие точки'**
  String get orgDetailLocations;

  /// No description provided for @deepLinkJoinSuccess.
  ///
  /// In ru, this message translates to:
  /// **'Вы присоединились к {orgName} по ссылке'**
  String deepLinkJoinSuccess(String orgName);

  /// No description provided for @deepLinkJoinError.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось присоединиться по ссылке'**
  String get deepLinkJoinError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
