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

  /// No description provided for @shiftAutoFinishedNotice.
  ///
  /// In ru, this message translates to:
  /// **'Смена завершена автоматически'**
  String get shiftAutoFinishedNotice;

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

  /// No description provided for @geoPermissionDenied.
  ///
  /// In ru, this message translates to:
  /// **'Для начала смены необходим доступ к геолокации'**
  String get geoPermissionDenied;

  /// No description provided for @geoPermissionDeniedForeverTitle.
  ///
  /// In ru, this message translates to:
  /// **'Геолокация недоступна'**
  String get geoPermissionDeniedForeverTitle;

  /// No description provided for @geoPermissionDeniedForeverMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы запретили доступ к геолокации. Откройте настройки приложения и разрешите доступ к местоположению.'**
  String get geoPermissionDeniedForeverMessage;

  /// No description provided for @geoOpenAppSettings.
  ///
  /// In ru, this message translates to:
  /// **'Открыть настройки'**
  String get geoOpenAppSettings;

  /// No description provided for @geoServiceDisabledTitle.
  ///
  /// In ru, this message translates to:
  /// **'Геолокация выключена'**
  String get geoServiceDisabledTitle;

  /// No description provided for @geoServiceDisabledMessage.
  ///
  /// In ru, this message translates to:
  /// **'Включите геолокацию на устройстве для начала смены.'**
  String get geoServiceDisabledMessage;

  /// No description provided for @geoOpenSettings.
  ///
  /// In ru, this message translates to:
  /// **'Включить'**
  String get geoOpenSettings;

  /// No description provided for @geoLowAccuracy.
  ///
  /// In ru, this message translates to:
  /// **'Низкая точность GPS — координаты могут быть неточными'**
  String get geoLowAccuracy;

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

  /// No description provided for @orgDetailLeft.
  ///
  /// In ru, this message translates to:
  /// **'Вы покинули организацию'**
  String get orgDetailLeft;

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

  /// No description provided for @orgShiftsEmptyForEmployee.
  ///
  /// In ru, this message translates to:
  /// **'У сотрудника нет смен за период'**
  String get orgShiftsEmptyForEmployee;

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

  /// No description provided for @shiftFilterByEmployee.
  ///
  /// In ru, this message translates to:
  /// **'Фильтр по сотруднику'**
  String get shiftFilterByEmployee;

  /// No description provided for @shiftFilterReset.
  ///
  /// In ru, this message translates to:
  /// **'Сбросить фильтр'**
  String get shiftFilterReset;

  /// No description provided for @shiftEmployeePickerTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выбор сотрудника'**
  String get shiftEmployeePickerTitle;

  /// No description provided for @shiftEmployeePickerEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Сотрудников нет'**
  String get shiftEmployeePickerEmpty;

  /// No description provided for @shiftAuthorFormerEmployee.
  ///
  /// In ru, this message translates to:
  /// **'Бывший сотрудник'**
  String get shiftAuthorFormerEmployee;

  /// No description provided for @shiftDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Смена сотрудника'**
  String get shiftDetailTitle;

  /// No description provided for @shiftDetailBackToList.
  ///
  /// In ru, this message translates to:
  /// **'Назад к списку'**
  String get shiftDetailBackToList;

  /// No description provided for @shiftChecklistsSection.
  ///
  /// In ru, this message translates to:
  /// **'Чек-листы'**
  String get shiftChecklistsSection;

  /// No description provided for @errorShiftNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Смена не найдена'**
  String get errorShiftNotFound;

  /// No description provided for @errorOrgNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Организация не найдена'**
  String get errorOrgNotFound;

  /// No description provided for @errorForbidden.
  ///
  /// In ru, this message translates to:
  /// **'Недостаточно прав'**
  String get errorForbidden;

  /// No description provided for @errorInvalidStatusFilter.
  ///
  /// In ru, this message translates to:
  /// **'Неверный статус-фильтр'**
  String get errorInvalidStatusFilter;

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

  /// No description provided for @membersCustomRoleNone.
  ///
  /// In ru, this message translates to:
  /// **'Без роли'**
  String get membersCustomRoleNone;

  /// No description provided for @membersAssignRole.
  ///
  /// In ru, this message translates to:
  /// **'Назначить роль'**
  String get membersAssignRole;

  /// No description provided for @membersAssignRoleTitle.
  ///
  /// In ru, this message translates to:
  /// **'Кастомная роль'**
  String get membersAssignRoleTitle;

  /// No description provided for @membersCustomRoleAssigned.
  ///
  /// In ru, this message translates to:
  /// **'Роль назначена'**
  String get membersCustomRoleAssigned;

  /// No description provided for @membersCustomRoleCleared.
  ///
  /// In ru, this message translates to:
  /// **'Роль снята'**
  String get membersCustomRoleCleared;

  /// No description provided for @memberDetailTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сотрудник'**
  String get memberDetailTitle;

  /// No description provided for @memberDetailSystemRole.
  ///
  /// In ru, this message translates to:
  /// **'Системная роль'**
  String get memberDetailSystemRole;

  /// No description provided for @memberDetailCustomRole.
  ///
  /// In ru, this message translates to:
  /// **'Кастомная роль'**
  String get memberDetailCustomRole;

  /// No description provided for @memberDetailEffectiveSection.
  ///
  /// In ru, this message translates to:
  /// **'Эффективные чек-листы'**
  String get memberDetailEffectiveSection;

  /// No description provided for @memberDetailEffectiveHint.
  ///
  /// In ru, this message translates to:
  /// **'Что получит сотрудник при старте смены'**
  String get memberDetailEffectiveHint;

  /// No description provided for @memberDetailEffectiveEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет активных чек-листов'**
  String get memberDetailEffectiveEmpty;

  /// No description provided for @memberDetailSourceRole.
  ///
  /// In ru, this message translates to:
  /// **'От роли'**
  String get memberDetailSourceRole;

  /// No description provided for @memberDetailSourcePersonal.
  ///
  /// In ru, this message translates to:
  /// **'Персонально'**
  String get memberDetailSourcePersonal;

  /// No description provided for @memberDetailOverridesSection.
  ///
  /// In ru, this message translates to:
  /// **'Персональные исключения'**
  String get memberDetailOverridesSection;

  /// No description provided for @memberDetailOverridesHint.
  ///
  /// In ru, this message translates to:
  /// **'Добавленные поверх роли (+) или исключённые из роли (−) шаблоны'**
  String get memberDetailOverridesHint;

  /// No description provided for @memberDetailOverridesEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Нет персональных переопределений'**
  String get memberDetailOverridesEmpty;

  /// No description provided for @memberDetailOverrideAction.
  ///
  /// In ru, this message translates to:
  /// **'Действия'**
  String get memberDetailOverrideAction;

  /// No description provided for @memberDetailOverrideAdd.
  ///
  /// In ru, this message translates to:
  /// **'+'**
  String get memberDetailOverrideAdd;

  /// No description provided for @memberDetailOverrideRemove.
  ///
  /// In ru, this message translates to:
  /// **'−'**
  String get memberDetailOverrideRemove;

  /// No description provided for @memberDetailOverrideSwitchAdd.
  ///
  /// In ru, this message translates to:
  /// **'Добавить поверх роли'**
  String get memberDetailOverrideSwitchAdd;

  /// No description provided for @memberDetailOverrideSwitchRemove.
  ///
  /// In ru, this message translates to:
  /// **'Исключить из роли'**
  String get memberDetailOverrideSwitchRemove;

  /// No description provided for @memberDetailOverrideClear.
  ///
  /// In ru, this message translates to:
  /// **'Снять переопределение'**
  String get memberDetailOverrideClear;

  /// No description provided for @checklistTemplatesShiftStart.
  ///
  /// In ru, this message translates to:
  /// **'При начале смены'**
  String get checklistTemplatesShiftStart;

  /// No description provided for @checklistTemplatesShiftEnd.
  ///
  /// In ru, this message translates to:
  /// **'При завершении смены'**
  String get checklistTemplatesShiftEnd;

  /// No description provided for @shiftChecklistsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Чек-листы смены'**
  String get shiftChecklistsTitle;

  /// No description provided for @shiftChecklistsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Чек-листов нет'**
  String get shiftChecklistsEmpty;

  /// No description provided for @shiftChecklistsStartGroup.
  ///
  /// In ru, this message translates to:
  /// **'При начале смены'**
  String get shiftChecklistsStartGroup;

  /// No description provided for @shiftChecklistsEndGroup.
  ///
  /// In ru, this message translates to:
  /// **'При завершении смены'**
  String get shiftChecklistsEndGroup;

  /// No description provided for @shiftChecklistProgress.
  ///
  /// In ru, this message translates to:
  /// **'{completed} из {total}'**
  String shiftChecklistProgress(int completed, int total);

  /// No description provided for @shiftChecklistStatusPending.
  ///
  /// In ru, this message translates to:
  /// **'В процессе'**
  String get shiftChecklistStatusPending;

  /// No description provided for @shiftChecklistStatusCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Выполнен'**
  String get shiftChecklistStatusCompleted;

  /// No description provided for @shiftChecklistStatusIncomplete.
  ///
  /// In ru, this message translates to:
  /// **'Не выполнен'**
  String get shiftChecklistStatusIncomplete;

  /// No description provided for @shiftChecklistRequiredBadge.
  ///
  /// In ru, this message translates to:
  /// **'Обязательный'**
  String get shiftChecklistRequiredBadge;

  /// No description provided for @checklistFillTitle.
  ///
  /// In ru, this message translates to:
  /// **'Заполнение чек-листа'**
  String get checklistFillTitle;

  /// No description provided for @checklistFillCommentHint.
  ///
  /// In ru, this message translates to:
  /// **'Комментарий (необязательно)'**
  String get checklistFillCommentHint;

  /// No description provided for @checklistFillReadOnly.
  ///
  /// In ru, this message translates to:
  /// **'Смена завершена, редактирование недоступно'**
  String get checklistFillReadOnly;

  /// No description provided for @checklistFillSaving.
  ///
  /// In ru, this message translates to:
  /// **'Сохранение...'**
  String get checklistFillSaving;

  /// No description provided for @checklistFillSaved.
  ///
  /// In ru, this message translates to:
  /// **'Сохранено'**
  String get checklistFillSaved;

  /// No description provided for @checklistFillSaveError.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось сохранить'**
  String get checklistFillSaveError;

  /// No description provided for @shiftFinishIncompleteWarning.
  ///
  /// In ru, this message translates to:
  /// **'Есть незаполненные обязательные чек-листы'**
  String get shiftFinishIncompleteWarning;

  /// No description provided for @shiftIncompleteRequiredBadge.
  ///
  /// In ru, this message translates to:
  /// **'Чек-листы не выполнены'**
  String get shiftIncompleteRequiredBadge;

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

  /// No description provided for @dateRangeFilterTitle.
  ///
  /// In ru, this message translates to:
  /// **'Диапазон дат'**
  String get dateRangeFilterTitle;

  /// No description provided for @dateRangeFrom.
  ///
  /// In ru, this message translates to:
  /// **'С'**
  String get dateRangeFrom;

  /// No description provided for @dateRangeTo.
  ///
  /// In ru, this message translates to:
  /// **'По'**
  String get dateRangeTo;

  /// No description provided for @dateRangeApply.
  ///
  /// In ru, this message translates to:
  /// **'Применить'**
  String get dateRangeApply;

  /// No description provided for @dateRangeReset.
  ///
  /// In ru, this message translates to:
  /// **'Сбросить'**
  String get dateRangeReset;

  /// No description provided for @dateRangeChipBoth.
  ///
  /// In ru, this message translates to:
  /// **'{from} – {to}'**
  String dateRangeChipBoth(String from, String to);

  /// No description provided for @dateRangeChipFromOnly.
  ///
  /// In ru, this message translates to:
  /// **'с {from}'**
  String dateRangeChipFromOnly(String from);

  /// No description provided for @dateRangeChipToOnly.
  ///
  /// In ru, this message translates to:
  /// **'по {to}'**
  String dateRangeChipToOnly(String to);

  /// No description provided for @statsModeCustom.
  ///
  /// In ru, this message translates to:
  /// **'Произвольный период'**
  String get statsModeCustom;

  /// No description provided for @statsAppliedRange.
  ///
  /// In ru, this message translates to:
  /// **'за {from} – {to}'**
  String statsAppliedRange(String from, String to);

  /// No description provided for @shiftsEmptyForRange.
  ///
  /// In ru, this message translates to:
  /// **'Нет смен за выбранный период'**
  String get shiftsEmptyForRange;

  /// No description provided for @errorInvalidDateRange.
  ///
  /// In ru, this message translates to:
  /// **'Дата начала позже даты окончания'**
  String get errorInvalidDateRange;

  /// No description provided for @errorMissingStatsRange.
  ///
  /// In ru, this message translates to:
  /// **'Не указан период статистики'**
  String get errorMissingStatsRange;

  /// No description provided for @errorAmbiguousStatsRange.
  ///
  /// In ru, this message translates to:
  /// **'Нельзя задать одновременно пресет и произвольный период'**
  String get errorAmbiguousStatsRange;

  /// No description provided for @errorInvalidPeriod.
  ///
  /// In ru, this message translates to:
  /// **'Некорректный период'**
  String get errorInvalidPeriod;

  /// No description provided for @payrollMyEarningsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мой заработок'**
  String get payrollMyEarningsTitle;

  /// No description provided for @payrollReportTitle.
  ///
  /// In ru, this message translates to:
  /// **'Зарплата'**
  String get payrollReportTitle;

  /// No description provided for @payrollRateSectionTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ставка'**
  String get payrollRateSectionTitle;

  /// No description provided for @payrollCurrentRateTitle.
  ///
  /// In ru, this message translates to:
  /// **'Текущая ставка'**
  String get payrollCurrentRateTitle;

  /// No description provided for @payrollAccrued.
  ///
  /// In ru, this message translates to:
  /// **'Начислено'**
  String get payrollAccrued;

  /// No description provided for @payrollToPay.
  ///
  /// In ru, this message translates to:
  /// **'К выплате'**
  String get payrollToPay;

  /// No description provided for @payrollWorked.
  ///
  /// In ru, this message translates to:
  /// **'Отработано'**
  String get payrollWorked;

  /// No description provided for @payrollShiftsCount.
  ///
  /// In ru, this message translates to:
  /// **'Смен'**
  String get payrollShiftsCount;

  /// No description provided for @payrollRateHourly.
  ///
  /// In ru, this message translates to:
  /// **'за час'**
  String get payrollRateHourly;

  /// No description provided for @payrollRatePerShift.
  ///
  /// In ru, this message translates to:
  /// **'за смену'**
  String get payrollRatePerShift;

  /// No description provided for @payrollRateEffectiveFrom.
  ///
  /// In ru, this message translates to:
  /// **'Действует с {date}'**
  String payrollRateEffectiveFrom(String date);

  /// No description provided for @payrollRateCurrent.
  ///
  /// In ru, this message translates to:
  /// **'Действующая'**
  String get payrollRateCurrent;

  /// No description provided for @payrollRateNotSet.
  ///
  /// In ru, this message translates to:
  /// **'Ставка не задана'**
  String get payrollRateNotSet;

  /// No description provided for @myEarningsNoRate.
  ///
  /// In ru, this message translates to:
  /// **'Ставка ещё не задана'**
  String get myEarningsNoRate;

  /// No description provided for @myEarningsMissingRateHint.
  ///
  /// In ru, this message translates to:
  /// **'Некоторые смены не оплачены — для них не была задана ставка. Обратитесь к администратору.'**
  String get myEarningsMissingRateHint;

  /// No description provided for @payrollMissingRateBadge.
  ///
  /// In ru, this message translates to:
  /// **'Есть смены без ставки'**
  String get payrollMissingRateBadge;

  /// No description provided for @payrollUnpaidHint.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} смена} few{{count} смены} many{{count} смен} other{{count} смены}} / {hours} не оплачены: нет ставки на дату смены'**
  String payrollUnpaidHint(num count, String hours);

  /// No description provided for @payrollEmptyNoShifts.
  ///
  /// In ru, this message translates to:
  /// **'Нет завершённых смен за период'**
  String get payrollEmptyNoShifts;

  /// No description provided for @payrollRatesEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Ставок пока нет'**
  String get payrollRatesEmpty;

  /// No description provided for @errorRateNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Запись о ставке не найдена'**
  String get errorRateNotFound;

  /// No description provided for @errorRateEffectiveFromTaken.
  ///
  /// In ru, this message translates to:
  /// **'На эту дату у сотрудника уже есть ставка. Выберите другую дату или исправьте существующую.'**
  String get errorRateEffectiveFromTaken;

  /// No description provided for @errorMemberNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Сотрудник не найден'**
  String get errorMemberNotFound;

  /// No description provided for @errorValidation.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте введённые данные'**
  String get errorValidation;

  /// No description provided for @errorAccountLocked.
  ///
  /// In ru, this message translates to:
  /// **'Слишком много попыток входа. Попробуйте позже'**
  String get errorAccountLocked;

  /// No description provided for @errorRateLimitExceeded.
  ///
  /// In ru, this message translates to:
  /// **'Слишком много запросов. Подождите немного'**
  String get errorRateLimitExceeded;

  /// No description provided for @errorTooManyCodeAttempts.
  ///
  /// In ru, this message translates to:
  /// **'Превышено число попыток. Запросите новый код'**
  String get errorTooManyCodeAttempts;

  /// No description provided for @errorFileTooLarge.
  ///
  /// In ru, this message translates to:
  /// **'Файл слишком большой'**
  String get errorFileTooLarge;

  /// No description provided for @errorUnsupportedFileType.
  ///
  /// In ru, this message translates to:
  /// **'Недопустимый формат файла'**
  String get errorUnsupportedFileType;

  /// No description provided for @errorStorageUnavailable.
  ///
  /// In ru, this message translates to:
  /// **'Хранилище недоступно, попробуйте позже'**
  String get errorStorageUnavailable;

  /// No description provided for @errorFileNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Файл не найден'**
  String get errorFileNotFound;

  /// No description provided for @errorFileInUse.
  ///
  /// In ru, this message translates to:
  /// **'Файл используется и не может быть удалён'**
  String get errorFileInUse;

  /// No description provided for @errorInvalidFileCategory.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестная категория файла'**
  String get errorInvalidFileCategory;

  /// No description provided for @commonNoConnection.
  ///
  /// In ru, this message translates to:
  /// **'Нет соединения'**
  String get commonNoConnection;

  /// No description provided for @commonRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get commonRetry;

  /// No description provided for @shiftOfflineBanner.
  ///
  /// In ru, this message translates to:
  /// **'Нет соединения. Проверьте интернет'**
  String get shiftOfflineBanner;
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
    'that was used.',
  );
}
