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
  const WorkSchedule._();

  /// Самый ранний момент, когда график можно начать, — [nextStartAt] за
  /// вычетом допуска [earlyStartMinutes]. Общая точка для [isStartableAt] и
  /// презентационного слоя (подпись «Смену можно начать с {time}», см.
  /// `work_schedule_selector.dart`), чтобы формула не дублировалась.
  DateTime earliestStartAt(int earlyStartMinutes) =>
      nextStartAt.subtract(Duration(minutes: earlyStartMinutes));

  /// Правило S1 бэка (`schedule_window_enforcement/backend.md`): график
  /// стартуем прямо сейчас, если [now] не раньше [earliestStartAt] и ещё не
  /// позже [nextEndAt] — обе границы включительно, как у бэка (`now >=
  /// next_start_at - early_start_minutes`, `now <= next_end_at`): R2
  /// отбрасывает окна, закончившиеся ДО `now`, то есть окно с `next_end_at
  /// == now` бэк ещё считает действующим.
  ///
  /// Сервер присылает готовый флаг `can_start_now` в ответе, но он верен
  /// только на момент ответа — на idle-экране признак пересчитывается
  /// локально каждую секунду (см. `schedule_window_enforcement/mobile.md`),
  /// поэтому клиент намеренно не хранит и не использует `can_start_now`
  /// напрямую, а вычисляет его сам от уже имеющихся [nextStartAt]/
  /// [nextEndAt].
  bool isStartableAt(DateTime now, {required int earlyStartMinutes}) =>
      !now.isBefore(earliestStartAt(earlyStartMinutes)) &&
      !now.isAfter(nextEndAt);
}
