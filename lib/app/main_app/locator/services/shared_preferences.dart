import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';

/// Инициализатор SharedPreferences
class SharedPreferencesInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'SharedPreferences';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final prefs = await SharedPreferences.getInstance();
    locator.register<SharedPreferences>(prefs);
  }
}
