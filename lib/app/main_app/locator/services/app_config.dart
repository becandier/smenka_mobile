import 'package:templatecmd/app/config/_config.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';
import 'package:templatecmd/pages/debug/data/repository/debug_repository_imp.dart';

/// Инициализатор конфигурации приложения
class AppConfigInitializer implements ServiceInitializer {
  AppConfigInitializer({
    required this.remoteConfig,
    required this.debugRepository,
  });

  final AppConfigRemoteFirebase remoteConfig;
  final IDebugRepositoryImp debugRepository;

  @override
  String get serviceName => 'App Config';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final flavor = await debugRepository.getFlavor();

    final appConfig = AppConfig(
      remoteConfig: remoteConfig,
      flavor: flavor,
    );

    locator.register<AppConfig>(appConfig);
  }
}
