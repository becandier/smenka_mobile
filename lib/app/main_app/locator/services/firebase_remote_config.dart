import 'dart:async';

import 'package:smenka_mobile/app/config/_config.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';

/// Инициализатор Firebase Remote Config
class RemoteConfigInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'Firebase Remote Config';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final remoteConfig = AppConfigRemoteFirebase();
    // На web нет кэша RC, поэтому фетч не должен блокировать старт. Дефолты
    // задаются внутри init() ДО фетча — по таймауту приложение стартует на них,
    // а фоновый фетч (если успеет) обновит значения позже.
    //
    // .catchError — страховка: что бы ни случилось внутри init(), регистрация
    // сервиса ОБЯЗАНА произойти (иначе AppConfigInitializer не найдёт сервис в
    // локаторе и приложение упадёт на экран ошибки вместо старта на дефолтах).
    await remoteConfig
        .init()
        .timeout(const Duration(seconds: 8), onTimeout: () {})
        .catchError((Object _) {});
    locator.register<AppConfigRemoteFirebase>(remoteConfig);
  }
}
