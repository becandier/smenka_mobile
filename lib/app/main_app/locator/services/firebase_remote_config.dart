import 'package:templatecmd/app/config/_config.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';

/// Инициализатор Firebase Remote Config
class RemoteConfigInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'Firebase Remote Config';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final remoteConfig = AppConfigRemoteFirebase();
    await remoteConfig.init();
    locator.register<AppConfigRemoteFirebase>(remoteConfig);
  }
}
