import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_assignment_dto.freezed.dart';
part 'test_assignment_dto.g.dart';

@freezed
abstract class TestOrganizationBriefDto with _$TestOrganizationBriefDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TestOrganizationBriefDto({
    required String id,
    required String name,
  }) = _TestOrganizationBriefDto;

  factory TestOrganizationBriefDto.fromJson(Map<String, dynamic> json) =>
      _$TestOrganizationBriefDtoFromJson(json);
}

@freezed
abstract class TestTemplateBriefDto with _$TestTemplateBriefDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TestTemplateBriefDto({
    required String id,
    required String title,
    String? description,
    @Default(0) int questionCount,
    @Default(1) int maxAttempts,
    @Default(70) int passThresholdPercent,

    /// Аддитивное поле — см. doc-комментарий `TestTemplateBrief` (домен).
    @Default(false) bool shuffleQuestions,
  }) = _TestTemplateBriefDto;

  factory TestTemplateBriefDto.fromJson(Map<String, dynamic> json) =>
      _$TestTemplateBriefDtoFromJson(json);
}

@freezed
abstract class TestAssignmentAttemptBriefDto
    with _$TestAssignmentAttemptBriefDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TestAssignmentAttemptBriefDto({
    required int attemptNumber,
    @Default(0) int percent,
    @Default(false) bool passed,

    /// Nullable — см. doc-комментарий `TestAssignmentAttemptBrief` (домен).
    String? id,
    String? status,
    DateTime? submittedAt,
  }) = _TestAssignmentAttemptBriefDto;

  factory TestAssignmentAttemptBriefDto.fromJson(Map<String, dynamic> json) =>
      _$TestAssignmentAttemptBriefDtoFromJson(json);
}

@freezed
abstract class TestAssignmentDto with _$TestAssignmentDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TestAssignmentDto({
    required String id,
    required TestOrganizationBriefDto organization,
    required TestTemplateBriefDto template,

    /// Сырое значение (`assigned`/`in_progress`/`passed`/`failed`) —
    /// парсится в маппере.
    required String status,
    @Default(0) int attemptsUsed,
    int? bestPercent,
    @Default(false) bool passed,
    DateTime? dueAt,
    List<TestAssignmentAttemptBriefDto>? attempts,
  }) = _TestAssignmentDto;

  factory TestAssignmentDto.fromJson(Map<String, dynamic> json) =>
      _$TestAssignmentDtoFromJson(json);
}

@freezed
abstract class PaginatedTestAssignmentsDto with _$PaginatedTestAssignmentsDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PaginatedTestAssignmentsDto({
    required List<TestAssignmentDto> items,
    required int total,
    required int limit,
    required int offset,
  }) = _PaginatedTestAssignmentsDto;

  factory PaginatedTestAssignmentsDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTestAssignmentsDtoFromJson(json);
}
