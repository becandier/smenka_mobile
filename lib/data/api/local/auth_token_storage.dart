import 'package:shared_preferences/shared_preferences.dart';

/// Хранение токенов авторизации в SharedPreferences
class AuthTokenStorage {
  AuthTokenStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  /// Access token или null
  String? get accessToken => _prefs.getString(_accessTokenKey);

  /// Refresh token или null
  String? get refreshToken => _prefs.getString(_refreshTokenKey);

  /// Есть ли сохранённые токены
  bool get hasTokens => accessToken != null && refreshToken != null;

  /// Сохранить пару токенов
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _prefs.setString(_accessTokenKey, accessToken);
    await _prefs.setString(_refreshTokenKey, refreshToken);
  }

  /// Очистить токены
  Future<void> clearTokens() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
  }
}
