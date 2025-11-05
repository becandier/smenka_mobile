import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:templatecmd/app/config/remote_config/_remote_config.dart';

class AppConfigRemoteFirebase extends AppConfigRemote {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    try {
      await remoteConfig.ensureInitialized();
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 5),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e, stackTrace) {
      if (!kDebugMode) {
        await FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      if (remoteConfig.getAll().isEmpty) {
        rethrow;
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
