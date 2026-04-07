import 'package:shared_preferences/shared_preferences.dart';

/// Хранение инвайт-кода для обработки после авторизации
class PendingInviteStorage {
  PendingInviteStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _key = 'pending_invite_code';

  /// Сохранить инвайт-код для обработки после логина
  Future<void> save(String code) => _prefs.setString(_key, code);

  /// Получить и очистить отложенный код (null если нет)
  Future<String?> consume() async {
    final code = _prefs.getString(_key);
    if (code != null) {
      await _prefs.remove(_key);
    }
    return code;
  }
}
