import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_stats_dto.freezed.dart';
part 'org_stats_dto.g.dart';

@freezed
abstract class EmployeeStatsDto with _$EmployeeStatsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EmployeeStatsDto({
    required String userId,
    required String userName,
    required String userEmail,
    required int shiftCount,
    required int totalWorkedSeconds,
    required int averageShiftSeconds,
  }) = _EmployeeStatsDto;

  factory EmployeeStatsDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeStatsDtoFromJson(json);
}

@freezed
abstract class OrgStatsDto with _$OrgStatsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrgStatsDto({
    required int totalWorkedSeconds,
    required int shiftCount,
    required int averageShiftSeconds,
    required List<EmployeeStatsDto> perEmployee,

    /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
    String? period,

    /// Фактически применённое окно статистики (UTC).
    DateTime? rangeFrom,
    DateTime? rangeTo,
  }) = _OrgStatsDto;

  factory OrgStatsDto.fromJson(Map<String, dynamic> json) =>
      _$OrgStatsDtoFromJson(json);
}
