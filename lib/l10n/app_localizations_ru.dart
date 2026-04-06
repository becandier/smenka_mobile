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
}
