import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_schedule.freezed.dart';

/// Один график работы из эффективного набора сотрудника
/// (`GET /organizations/{org_id}/my-schedules`).
///
/// [startTime]/[endTime] — локальное время организации, формат `HH:MM`
/// (строка, как отдаёт бэк; секунды не используются). [nextStartAt]/
/// [nextEndAt] — плановое окно, которое будет записано в смену, если начать
/// её прямо сейчас (UTC, расчитано сервером с учётом таймзоны организации).
@freezed
abstract class WorkSchedule with _$WorkSchedule {
  const factory WorkSchedule({
    required String id,
    required String name,
    required String startTime,
    required String endTime,
    required int durationMinutes,
    required bool crossesMidnight,
    required DateTime nextStartAt,
    required DateTime nextEndAt,
    required bool isCurrent,

    /// Минуты до планового начала. Отрицательное значение — график уже идёт
    /// (столько минут назад он начался), используется для «опоздал на N мин».
    required int startsInMinutes,
  }) = _WorkSchedule;
}
