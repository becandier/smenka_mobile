import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/data/api/local/local_storage_api.dart';
import 'package:smenka_mobile/pages/theme/cubit/theme_cubit.dart'
    show ThemeCubit;

/// Local storage API for persisting theme mode preference.
///
/// Stores theme mode as a string value ('light', 'dark', 'system')
/// using SharedPreferences. Default value is 'system'.
///
/// See also:
/// - [ThemeCubit] for theme state management
/// - `ThemeLocalStorageServiceInitializer` for DI setup
class ThemeLocalStorageApi extends LocalStorageApi<String> {
  ThemeLocalStorageApi({
    required super.key,
    required SharedPreferences localApi,
  }) : _localApi = localApi;

  /// Local storage instance
  final SharedPreferences _localApi;

  /// Removes theme preference from storage
  @override
  Future<void> delete() async => _localApi.remove(key);

  /// Saves theme mode to storage
  @override
  Future<void> write(String value) async => _localApi.setString(key, value);

  /// Gets current theme mode from storage (defaults to 'system')
  @override
  Future<String> get currentValue async => _localApi.getString(key) ?? 'system';
}
