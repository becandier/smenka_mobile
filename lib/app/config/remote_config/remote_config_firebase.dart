import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smenka_mobile/app/config/remote_config/_remote_config.dart';

class AppConfigRemoteFirebase extends AppConfigRemote {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    var retryCount = 0;
    const maxRetries = 2;

    while (retryCount <= maxRetries) {
      try {
        await remoteConfig.ensureInitialized();
        await remoteConfig.setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 10),
            minimumFetchInterval:
                kDebugMode ? Duration.zero : const Duration(hours: 12),
          ),
        );
        await remoteConfig.fetchAndActivate();

        // Проверяем что данные действительно получены
        if (remoteConfig.getAll().isEmpty && retryCount < maxRetries) {
          // Если данных нет — пробуем очистить кэш и повторить
          await _clearRemoteConfigCache();
          retryCount++;
          continue;
        }

        return;
      } on FirebaseException catch (e, stackTrace) {
        if (!kDebugMode) {
          await FirebaseCrashlytics.instance.recordError(e, stackTrace);
        }

        // Если есть закэшированные значения — используем их
        if (remoteConfig.getAll().isNotEmpty) {
          return;
        }

        // Если это не последняя попытка — очищаем кэш и повторяем
        if (retryCount < maxRetries) {
          await _clearRemoteConfigCache();
          retryCount++;
          await Future<void>.delayed(Duration(seconds: retryCount));
          continue;
        }

        rethrow;
      }
    }
  }

  /// Очистка кэша Remote Config.
  /// Решает проблему при переносе приложения между iPhone.
  /// https://github.com/firebase/firebase-ios-sdk/issues/15021
  Future<void> _clearRemoteConfigCache() async {
    try {
      if (Platform.isIOS) {
        final appSupportDir = await getApplicationSupportDirectory();
        final remoteConfigDir = Directory(
          '${appSupportDir.path}/Google/RemoteConfig',
        );

        if (remoteConfigDir.existsSync()) {
          await remoteConfigDir.delete(recursive: true);
        }
      }
    } catch (e, stackTrace) {
      if (!kDebugMode) {
        await FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
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
