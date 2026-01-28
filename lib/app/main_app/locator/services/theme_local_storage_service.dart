import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:templatecmd/app/main_app/cubit/_cubit.dart' show MainAppCubit;
import 'package:templatecmd/app/main_app/cubit/main_app_cubit.dart'
    show MainAppCubit;
import 'package:templatecmd/app/main_app/locator/service_locator.dart';
import 'package:templatecmd/core/constants/prefs_keys.dart';
import 'package:templatecmd/data/api/local/theme_local_storage_api.dart';
import 'package:templatecmd/pages/theme/cubit/theme_cubit.dart' show ThemeCubit;

/// Service initializer for theme persistence.
///
/// Loads saved theme mode from local storage during app startup
/// and registers it in the service locator for dependency injection.
///
/// This initializer should be added to the app's service initializers list
/// in [MainAppCubit] to ensure theme preference is restored on app launch.
///
/// See also:
/// - [ThemeLocalStorageApi] for storage implementation
/// - [ThemeCubit] for runtime theme management
class ThemeModeServiceInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'ThemeLocalStorage';

  /// Initializes theme storage and loads saved preference.
  ///
  /// Creates [ThemeLocalStorageApi], reads stored value,
  /// converts to [ThemeMode] and registers in locator.
  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final themeLocalStorage = ThemeLocalStorageApi(
      key: PrefsKeys.theme,
      localApi: locator.get<SharedPreferences>(),
    );

    final value = await themeLocalStorage.currentValue;

    final themeMode = ThemeMode.values.byName(value);

    locator.register<ThemeMode>(themeMode);
  }
}
