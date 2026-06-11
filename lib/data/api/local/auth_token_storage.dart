import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Безопасное хранение токенов авторизации.
///
/// Токены (`access`/`refresh`) хранятся в [FlutterSecureStorage]
/// (Keychain на iOS, EncryptedSharedPreferences/Keystore на Android).
/// Для синхронного доступа из `AuthInterceptor`/репозиториев значения
/// держатся в in-memory кэше, который наполняется в [init] при старте
/// приложения и обновляется write-through при [saveTokens]/[clearTokens].
///
/// Совместимость со старыми билдами: при первом запуске новой версии
/// токены из открытого [SharedPreferences] однократно переносятся в
/// secure storage (см. [init]) — пользователь не разлогинивается.
class AuthTokenStorage {
  AuthTokenStorage({
    required SharedPreferences prefs,
    FlutterSecureStorage? secureStorage,
  }) : _prefs = prefs,
       // v10: дефолтные AndroidOptions используют собственный безопасный шифр
       // (AES-GCM); устаревший encryptedSharedPreferences не задаём.
       // iOS — Keychain по умолчанию.
       _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  String? _accessToken;
  String? _refreshToken;
  bool _initialized = false;

  /// Access token из кэша или null
  String? get accessToken => _accessToken;

  /// Refresh token из кэша или null
  String? get refreshToken => _refreshToken;

  /// Есть ли сохранённые токены
  bool get hasTokens => _accessToken != null && _refreshToken != null;

  /// Наполняет in-memory кэш из secure storage и выполняет одноразовую
  /// миграцию токенов из [SharedPreferences].
  ///
  /// Должен быть вызван при инициализации приложения **до** первого
  /// использования токенов (создание Dio, проверка авторизации). Идемпотентен.
  ///
  /// Никогда не бросает исключение: сбой secure storage (редкий отказ
  /// Keychain/Keystore) не должен ронять запуск приложения. При невозможности
  /// перенести токены сессия сохраняется (используется legacy-кэш), а
  /// плейнтекст в `SharedPreferences` остаётся — миграция повторится позже.
  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    try {
      _accessToken = await _secureStorage.read(key: _accessTokenKey);
      _refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    } catch (_) {
      _accessToken = null;
      _refreshToken = null;
    }

    // Токены уже в secure storage — открытый плейнтекст больше не нужен.
    if (_accessToken != null || _refreshToken != null) {
      await _removeLegacyTokens();
      return;
    }

    // Миграция: secure storage пуст. Если в старом SharedPreferences есть
    // валидная пара токенов — переносим её, иначе чистим возможный мусор.
    final legacyAccess = _prefs.getString(_accessTokenKey);
    final legacyRefresh = _prefs.getString(_refreshTokenKey);
    if (legacyAccess == null || legacyRefresh == null) {
      await _removeLegacyTokens();
      return;
    }

    try {
      await _secureStorage.write(key: _accessTokenKey, value: legacyAccess);
      await _secureStorage.write(key: _refreshTokenKey, value: legacyRefresh);
      _accessToken = legacyAccess;
      _refreshToken = legacyRefresh;
      // Плейнтекст вычищаем ТОЛЬКО после успешного переноса.
      await _removeLegacyTokens();
    } catch (_) {
      // Перенос не удался — НЕ теряем сессию: держим legacy-токены в кэше
      // на этот запуск и оставляем их в SharedPreferences для повторной
      // миграции при следующем старте.
      _accessToken = legacyAccess;
      _refreshToken = legacyRefresh;
    }
  }

  /// Сохранить пару токенов (write-through: кэш + secure storage)
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  /// Очистить токены (кэш + secure storage)
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    // Защитно: на случай, если очистка случилась до миграции.
    await _removeLegacyTokens();
  }

  Future<void> _removeLegacyTokens() async {
    if (_prefs.containsKey(_accessTokenKey)) {
      await _prefs.remove(_accessTokenKey);
    }
    if (_prefs.containsKey(_refreshTokenKey)) {
      await _prefs.remove(_refreshTokenKey);
    }
  }
}
