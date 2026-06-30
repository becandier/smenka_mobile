import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:smenka_mobile/app/config/remote_config/_remote_config.dart';
import 'package:smenka_mobile/app/config/remote_config/remote_config_cache_cleaner.dart';

/// Захардкоженные дефолты Remote Config.
///
/// Критично для web: при первом запуске нет локального кэша RC, поэтому пока
/// (или если) [FirebaseRemoteConfig.fetchAndActivate] не отработал, приложение
/// должно стартовать на этих значениях, а не с пустым `endPoint`. На нативе тот
/// же эффект давал кэш прошлых запусков; на web его нет.
///
/// `fetchAndActivate` лишь обновляет эти значения свежими из консоли Firebase.
const remoteConfigDefaults = <String, Object>{
  // dio.dart добавляет суффикс `/api/v1`, поэтому здесь только хост → итоговый
  // baseUrl = https://api.smenka.space/api/v1.
  'ENDPOINT_PROD': 'https://api.smenka.space',
  // Реальный dev-URL живёт в Firebase RC и перетирает дефолт на dev-флейворе.
  // web собирается prod-флейвором, поэтому дефолт держим на прод-хосте, чтобы
  // значение никогда не было пустым.
  'ENDPOINT_DEV': 'https://api.smenka.space',
  'PRIVACY_POLICY': 'https://smenka.space/privacy',
  // 0.0.0 — не форсим обновление, пока реальный минимум не придёт из RC.
  'MIN_VERSION': '0.0.0',
  'TECH_WORK': false,
};

class AppConfigRemoteFirebase extends AppConfigRemote {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    // Дефолты — ПЕРВЫМ делом. На web setDefaults локальна (плагин лишь
    // присваивает defaultConfig), поэтому значения гарантированно применятся
    // даже если ensureInitialized/fetch ниже зависнут или упадут → getString()/
    // getBool() сразу вернут рабочие значения и endPoint не будет пустым.
    try {
      await setDefaults(remoteConfigDefaults);
    } catch (e, stackTrace) {
      _recordIfNative(e, stackTrace);
    }

    try {
      await remoteConfig.ensureInitialized();
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 8),
          minimumFetchInterval: kDebugMode
              ? Duration.zero
              : const Duration(hours: 12),
        ),
      );
    } catch (e, stackTrace) {
      // ВАЖНО (web): firebase_remote_config_web НЕ оборачивает исключения в
      // FirebaseException — реджект приходит сырым JS-объектом. Поэтому ловим
      // широко, иначе ошибка вылетит из init(), регистрация сервиса пропустится
      // и приложение упадёт на экран ошибки вместо старта на дефолтах.
      _recordIfNative(e, stackTrace);
    }

    await _fetchAndActivateWithRetry();
  }

  /// Best-effort обновление значений из консоли Firebase. Никогда не бросает:
  /// дефолты уже активны, поэтому неуспех fetch не должен ронять запуск.
  Future<void> _fetchAndActivateWithRetry() async {
    var retryCount = 0;
    const maxRetries = 2;

    while (retryCount <= maxRetries) {
      try {
        await remoteConfig.fetchAndActivate();
        return;
      } catch (e, stackTrace) {
        // Широкий catch намеренно: на web rejection fetchAndActivate — сырой
        // JS-объект, а не FirebaseException (см. комментарий в init()).
        _recordIfNative(e, stackTrace);

        // Не последняя попытка — чистим кэш и повторяем с нарастающей паузой.
        if (retryCount < maxRetries) {
          await clearRemoteConfigCache();
          retryCount++;
          await Future<void>.delayed(Duration(seconds: retryCount));
          continue;
        }

        // Дефолты остаются активными — выходим без исключения.
        return;
      }
    }
  }

  /// Логирует ошибку в Crashlytics только на нативе в релизе (на web
  /// Crashlytics не поддерживается, в debug — лишний шум). Sync-обёртка, чтобы
  /// единообразно вызываться из catch-блоков без дублирования условия.
  void _recordIfNative(Object error, StackTrace stackTrace) {
    if (!kIsWeb && !kDebugMode) {
      unawaited(FirebaseCrashlytics.instance.recordError(error, stackTrace));
    }
  }

  @override
  Future<void> setDefaults(Map<String, dynamic> defaultParameters) {
    return remoteConfig.setDefaults(defaultParameters);
  }

  @override
  String getString(String key) {
    return remoteConfig.getString(key);
  }

  @override
  bool getBool(String key) {
    return remoteConfig.getBool(key);
  }

  @override
  int getInt(String key) {
    return remoteConfig.getInt(key);
  }
}
