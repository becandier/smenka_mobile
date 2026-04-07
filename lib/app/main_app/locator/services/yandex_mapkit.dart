import 'package:smenka_mobile/app/config/_config.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

/// Инициализатор Яндекс.Карт
class YandexMapKitInitializer implements ServiceInitializer {
  YandexMapKitInitializer({required this.appConfig});

  final AppConfig appConfig;

  @override
  String get serviceName => 'Yandex MapKit';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    await init.initMapkit(apiKey: appConfig.yandexMapsApiKey);
  }
}
