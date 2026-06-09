import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? organizationId,
    required DateTime startedAt,
    DateTime? finishedAt,
    required String status,
    required List<PauseDto> pauses,
    required int workedSeconds,
    @Default(false) bool hasIncompleteRequiredChecklists,

    /// Additive-поля автора смены (орг-ответ). В персональном — `null`.
    String? userName,
    String? userEmail,
    String? role,
    String? customRoleName,
  }) = _ShiftDto;

  factory ShiftDto.fromJson(Map<String, dynamic> json) =>
      _$ShiftDtoFromJson(json);
}
