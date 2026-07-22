import 'package:shared_preferences/shared_preferences.dart';

/// Хранение последнего выбранного графика при старте смены, по аналогии с
/// `ShiftContextStorage` (`shift_context_storage.dart`) — но ключ здесь
/// составной: пара «организация + рабочая точка», так как набор доступных
/// графиков зависит от точки.
///
/// Не регистрируется глобально (в отличие от `ShiftContextStorage`) —
/// нужна только `ShiftTrackerCubit`, создаётся на месте из уже доступного
/// в дереве `SharedPreferences`.
class WorkScheduleContextStorage {
  WorkScheduleContextStorage({required SharedPreferences prefs})
    : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _prefix = 'last_work_schedule_';
  static const _noLocationMarker = 'none';

  String _key(String orgId, String? workLocationId) =>
      '$_prefix$orgId:${workLocationId ?? _noLocationMarker}';

  /// Сохранённый график для пары организация+точка, или `null`.
  String? read(String orgId, String? workLocationId) =>
      _prefs.getString(_key(orgId, workLocationId));

  Future<void> save(String orgId, String? workLocationId, String scheduleId) =>
      _prefs.setString(_key(orgId, workLocationId), scheduleId);
}
