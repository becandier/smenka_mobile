import 'package:package_info_plus/package_info_plus.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';

/// Инициализатор информации о пакете приложения
class PackageInfoInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'Package Info';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final packageInfo = await PackageInfo.fromPlatform();
    locator.register<PackageInfo>(packageInfo);
  }
}
