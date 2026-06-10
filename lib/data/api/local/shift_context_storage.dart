import 'package:shared_preferences/shared_preferences.dart';

/// Хранение последнего выбранного контекста смены в SharedPreferences.
///
/// Маркер контекста: [personalMarker] для личной смены
/// либо UUID организации.
class ShiftContextStorage {
  ShiftContextStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _contextKey = 'last_shift_context';

  /// Маркер личной смены (без организации)
  static const personalMarker = 'personal';

  /// Сохранённый маркер контекста или null
  String? read() => _prefs.getString(_contextKey);

  /// Сохранить маркер контекста
  Future<void> save(String contextMarker) =>
      _prefs.setString(_contextKey, contextMarker);

  /// Очистить сохранённый контекст
  Future<void> clear() async {
    await _prefs.remove(_contextKey);
  }
}
