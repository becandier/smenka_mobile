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
abstract class ShiftOvertimeRequestDto with _$ShiftOvertimeRequestDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ShiftOvertimeRequestDto({
    required String id,
    required int minutes,
    required String status,
    required String comment,
    required DateTime createdAt,
    String? reviewComment,
    DateTime? reviewedAt,
  }) = _ShiftOvertimeRequestDto;

  factory ShiftOvertimeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ShiftOvertimeRequestDtoFromJson(json);
}

@freezed
abstract class ShiftDto with _$ShiftDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
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

    /// Additive-поля графика работы (`work_schedules`, nullable). Старый
    /// бэк/персональная смена не шлёт → `null`.
    String? workScheduleId,
    String? scheduleName,
    DateTime? scheduledStartAt,
    DateTime? scheduledEndAt,
    int? lateSeconds,
    String? finishReason,
    ShiftOvertimeRequestDto? overtime,

    /// Additive-поля ручного ввода/правки (`manual_time_entry`, nullable).
    /// Старый бэк не шлёт → безопасные дефолты.
    @Default(false) bool isManual,
    @Default(false) bool isEdited,
    String? manualNote,
    DateTime? editedAt,
    String? createdByName,
    String? editedByName,
    @Default(false) bool isDeleted,

    /// Additive-поля старта без геопроверки (`shift_geo_photo_fallback`).
    /// Старый бэк не шлёт → `false`/`null`. `geo_fallback` на бэке —
    /// derived-признак `geo_fallback_reason IS NOT NULL`.
    @Default(false) bool geoFallback,
    String? geoFallbackReason,
    String? geoFallbackPhotoFileId,
  }) = _ShiftDto;

  factory ShiftDto.fromJson(Map<String, dynamic> json) =>
      _$ShiftDtoFromJson(json);
}
