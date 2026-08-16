import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_schedule_dto.freezed.dart';
part 'work_schedule_dto.g.dart';

// `can_start_now` из ответа сознательно не парсится: он верен только на
// момент ответа сервера, а мобилка пересчитывает стартуемость графика
// локально каждую секунду от next_start_at/next_end_at/early_start_minutes
// (см. schedule_window_enforcement/mobile.md, WorkSchedule.isStartableAt) —
// хранить его в DTO было бы мёртвым полем.
@freezed
abstract class WorkScheduleDto with _$WorkScheduleDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkScheduleDto({
    required String id,
    required String name,
    required String startTime,
    required String endTime,
    required int durationMinutes,
    required bool crossesMidnight,
    required DateTime nextStartAt,
    required DateTime nextEndAt,
    required bool isCurrent,
    required int startsInMinutes,
  }) = _WorkScheduleDto;

  factory WorkScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$WorkScheduleDtoFromJson(json);
}

@freezed
abstract class MySchedulesDto with _$MySchedulesDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MySchedulesDto({
    required List<WorkScheduleDto> items,
    required int total,
    required bool requireSchedule,

    /// Отсутствует в ответе старого бэкенда, ещё не знающего
    /// `schedule_window_enforcement`, — дефолт `0` не роняет парсинг
    /// (обратная совместимость).
    @Default(0) int earlyStartMinutes,
  }) = _MySchedulesDto;

  factory MySchedulesDto.fromJson(Map<String, dynamic> json) =>
      _$MySchedulesDtoFromJson(json);
}
