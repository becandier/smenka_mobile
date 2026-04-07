import 'package:smenka_mobile/app/config/_config.dart';

class AppConfig {
  AppConfig({
    required AppConfigRemote remoteConfig,
    required this.flavor,
  }) : _remoteConfig = remoteConfig {
    _init();
  }

  /// Апи для получения доступа к удалленному конфигу
  final AppConfigRemote _remoteConfig;
  final Flavors flavor;

  void _init() {
    final isProd = flavor == Flavors.prod;
    endPoint =
        isProd ? _getString('ENDPOINT_PROD') : _getString('ENDPOINT_DEV');
    privacyPolicy = _getString('PRIVACY_POLICY');
    minVersion = _getString('MIN_VERSION');
    techWork = _getBool('TECH_WORK');
    debugModePassword = _getString('DEBUG_MODE_PASSWORD');
    yandexMapsApiKey = _getString('YANDEX_MAP_KEY');
  }

  late final String endPoint;
  late final String privacyPolicy;
  late final String minVersion;
  late final bool techWork;
  late final String debugModePassword;
  late final String yandexMapsApiKey;

  String _getString(String key) {
    final value = _remoteConfig.getString(key);
    return value;
  }

  bool _getBool(String key) => _remoteConfig.getBool(key);
  // int _getInt(String key) => _remoteConfig.getInt(key);
}
