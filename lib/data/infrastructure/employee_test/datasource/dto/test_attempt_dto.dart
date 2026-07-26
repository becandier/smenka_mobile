import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_attempt_dto.freezed.dart';
part 'test_attempt_dto.g.dart';

@freezed
abstract class TestAttemptOptionDto with _$TestAttemptOptionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TestAttemptOptionDto({
    required String id,
    required String text,
    @Default(0) int position,
    @Default(false) bool isSelected,

    /// Скрыт от сотрудника до сдачи / когда `reveal_answers=false`.
    bool? isCorrect,
  }) = _TestAttemptOptionDto;

  factory TestAttemptOptionDto.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptOptionDtoFromJson(json);
}

@freezed
abstract class TestAttemptQuestionDto with _$TestAttemptQuestionDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TestAttemptQuestionDto({
    required String id,
    required String text,

    /// Сырое значение с бэка (`single_choice`/`multiple_choice`) —
    /// парсится вручную в маппере (конвенция проекта, см.
    /// `ShiftFinishReason`/`KnowledgeNodeKind`), не через `@JsonValue`.
    required String type,
    @Default(1) int points,
    @Default(0) int position,
    @Default(<TestAttemptOptionDto>[]) List<TestAttemptOptionDto> options,
  }) = _TestAttemptQuestionDto;

  factory TestAttemptQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptQuestionDtoFromJson(json);
}

@freezed
abstract class TestAttemptDto with _$TestAttemptDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TestAttemptDto({
    required String id,
    required int attemptNumber,

    /// Сырое значение (`in_progress`/`submitted`) — парсится в маппере.
    required String status,
    required int maxScore,
    required DateTime startedAt,
    @Default(0) int score,
    @Default(0) int percent,
    @Default(false) bool passed,
    DateTime? submittedAt,
    @Default(<TestAttemptQuestionDto>[]) List<TestAttemptQuestionDto> questions,
  }) = _TestAttemptDto;

  factory TestAttemptDto.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptDtoFromJson(json);
}
