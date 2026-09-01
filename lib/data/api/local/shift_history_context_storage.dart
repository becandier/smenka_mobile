import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

/// Хранение последнего выбранного контекста таба «История смен»
/// (`pages/shift_history`, `shift_history_scope`).
///
/// Отдельно от `ShiftContextStorage` (контекст трекера смены на главном
/// экране, `shift_org_default`) — свой ключ, выбор истории независим от
/// контекста главного экрана и не синхронизируется с ним (см.
/// `shift_history_scope/mobile.md`, «Дефолт и запоминание»).
///
/// Не регистрируется глобально — нужна только `ShiftHistoryContextCubit`,
/// создаётся на месте из уже доступного в дереве `SharedPreferences` (по
/// образцу `WorkScheduleContextStorage`).
///
/// Маркер контекста: UUID организации, либо [ShiftScope.personal]/
/// [ShiftScope.all] через их `.value` для соответствующих пунктов.
class ShiftHistoryContextStorage {
  ShiftHistoryContextStorage({required SharedPreferences prefs})
    : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _contextKey = 'shift_history_context';

  /// Сохранённый маркер контекста или `null`
  String? read() => _prefs.getString(_contextKey);

  /// Сохранить маркер контекста
  Future<void> save(String contextMarker) =>
      _prefs.setString(_contextKey, contextMarker);
}
