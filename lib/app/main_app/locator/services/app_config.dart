import 'package:templatecmd/app/config/_config.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';
import 'package:templatecmd/features/debug/data/repository/debug_repository_imp.dart';

/// Инициализатор конфигурации приложения
class AppConfigInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'App Config';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final remoteConfig = locator.get<AppConfigRemoteFirebase>();
    final debugRepository = locator.get<IDebugRepositoryImp>();
    final flavor = await debugRepository.getFlavor();

    final appConfig = AppConfig(
      remoteConfig: remoteConfig,
      env: flavor,
    );

    locator.register<AppConfig>(appConfig);
  }
}
