import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_schedule_dto.freezed.dart';
part 'work_schedule_dto.g.dart';

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
  }) = _MySchedulesDto;

  factory MySchedulesDto.fromJson(Map<String, dynamic> json) =>
      _$MySchedulesDtoFromJson(json);
}
