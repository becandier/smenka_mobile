import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_stats_dto.freezed.dart';
part 'shift_stats_dto.g.dart';

@freezed
abstract class ShiftStatsDto with _$ShiftStatsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ShiftStatsDto({
    required int totalWorkedSeconds,
    required int shiftCount,
    required int averageShiftSeconds,

    /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
    String? period,

    /// Фактически применённое окно статистики (UTC).
    DateTime? rangeFrom,
    DateTime? rangeTo,
  }) = _ShiftStatsDto;

  factory ShiftStatsDto.fromJson(Map<String, dynamic> json) =>
      _$ShiftStatsDtoFromJson(json);
}
