import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/work_location_dto.dart';

part 'shift_dto.freezed.dart';
part 'shift_dto.g.dart';

@freezed
abstract class PauseDto with _$PauseDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PauseDto({
    required String id,
    required String shiftId,
    required DateTime startedAt,
    DateTime? finishedAt,
  }) = _PauseDto;

  factory PauseDto.fromJson(Map<String, dynamic> json) =>
      _$PauseDtoFromJson(json);
}

@freezed
abstract class ShiftDto with _$ShiftDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ShiftDto({
    required String id,
    required String userId,
    required DateTime startedAt,
    required String status,
    required List<PauseDto> pauses,
    required int workedSeconds,
    String? organizationId,
    DateTime? finishedAt,
    @Default(false) bool hasIncompleteRequiredChecklists,

    /// Рабочая точка смены (additive, nullable). Старый бэк не шлёт → `null`.
    String? workLocationId,
    WorkLocationDto? workLocation,

    /// Additive-поля автора смены (орг-ответ). В персональном — `null`.
    String? userName,
    String? userEmail,
    String? role,
    String? customRoleName,
  }) = _ShiftDto;

  factory ShiftDto.fromJson(Map<String, dynamic> json) =>
      _$ShiftDtoFromJson(json);
}
