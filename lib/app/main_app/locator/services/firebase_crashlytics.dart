import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';

/// Инициализатор Firebase Crashlytics
class CrashlyticsInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'Firebase Crashlytics';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final crashlytics = FirebaseCrashlytics.instance;
    locator.register<FirebaseCrashlytics>(crashlytics);
  }
}
