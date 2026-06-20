import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Очистка кэша Remote Config.
/// Решает проблему при переносе приложения между iPhone.
/// https://github.com/firebase/firebase-ios-sdk/issues/15021
Future<void> clearRemoteConfigCache() async {
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
    if (!kIsWeb && !kDebugMode) {
      await FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }
}
