import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/work_schedule.dart';

part 'my_schedules.freezed.dart';

/// Ответ `GET /organizations/{org_id}/my-schedules` целиком: эффективный
/// набор графиков сотрудника + флаг обязательности выбора настройки
/// организации (дублируется в ответе, чтобы клиент не ходил за настройками
/// отдельным запросом).
@freezed
abstract class MySchedules with _$MySchedules {
  const factory MySchedules({
    required List<WorkSchedule> items,
    required int total,
    required bool requireSchedule,

    /// За сколько минут до планового начала графика разрешено начать смену
    /// раньше (настройка организации, `schedule_window_enforcement`).
    /// Дублируется в каждом ответе, чтобы клиент пересчитывал стартуемость
    /// локально, не запрашивая `/settings` отдельно. `0` — старый бэкенд, ещё
    /// не отдающий это поле (обратная совместимость), эквивалентно «строго
    /// не раньше начала».
    @Default(0) int earlyStartMinutes,
  }) = _MySchedules;
}
