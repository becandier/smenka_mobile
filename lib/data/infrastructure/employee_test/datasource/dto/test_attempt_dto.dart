import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_attempt_dto.freezed.dart';
part 'test_attempt_dto.g.dart';

/// Вариант ответа — общая форма для fill/detail/result. В fill-форме
/// (`TestAttemptForFill`, старт попытки) бэк не присылает
/// `is_selected`/`is_correct` — дефолты (`false`/`null`) покрывают это без
/// краша.
@freezed
abstract class TestAttemptOptionDto with _$TestAttemptOptionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TestAttemptOptionDto({
    required String id,
    required String text,
    @Default(0) int position,
    @Default(false) bool isSelected,

    /// Скрыт от сотрудника до сдачи / когда `reveal_answers=false`, либо
    /// отсутствует в fill-форме — `null` в обоих случаях.
    bool? isCorrect,
  }) = _TestAttemptOptionDto;

  factory TestAttemptOptionDto.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptOptionDtoFromJson(json);
}

/// Вопрос — общая форма для fill/detail/result (см. doc-комментарий
/// [TestAttemptOptionDto]).
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

    /// Есть в fill/detail-форме; в result-форме (`POST .../submit`) бэк это
    /// поле не присылает — дефолт `0` (не рендерится).
    @Default(0) int position,

    /// Начисленные баллы за вопрос — только в result-форме
    /// (`reveal_answers=true`); в fill/detail-форме отсутствует.
    int? awarded,
    @Default(<TestAttemptOptionDto>[]) List<TestAttemptOptionDto> options,
  }) = _TestAttemptQuestionDto;

  factory TestAttemptQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptQuestionDtoFromJson(json);
}

/// `POST /my/test-assignments/{id}/attempts` → `TestAttemptForFill` — старт
/// новой попытки либо продолжение уже открытой. «Тощая» форма: бэк
/// намеренно НЕ отдаёт `attempt_number`/`status`/`score`/`max_score`/
/// `percent`/`passed` во время прохождения (счёт скрыт до сдачи), а
/// варианты ответов приходят без `is_correct`/`is_selected`. Раньше эта
/// форма ошибочно парсилась как detail-DTO с `required` количественными
/// полями — это и роняло старт теста (`type 'Null' is not a subtype of
/// type 'num'`).
@freezed
abstract class TestAttemptForFillDto with _$TestAttemptForFillDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TestAttemptForFillDto({
    required String id,
    required DateTime startedAt,
    @Default(<TestAttemptQuestionDto>[]) List<TestAttemptQuestionDto> questions,

    /// Аддитивное nullable поле (`TestAttemptForFill.organization_timezone`,
    /// backend `ce32b62`) — `/my/*` не scoped по `{org_id}`, зона нужна
    /// клиенту явно на каждой попытке.
    String? organizationTimezone,
  }) = _TestAttemptForFillDto;

  factory TestAttemptForFillDto.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptForFillDtoFromJson(json);
}

/// `GET /my/test-attempts/{id}` → `MyAttemptDetail` — резюме открытой
/// попытки (проверка статуса перед рендером fill-экрана) либо просмотр уже
/// сданной. В отличие от fill-формы несёт `attempt_number`/`status`/
/// `max_score`/`pass_threshold_percent`; `score`/`percent`/`passed` —
/// nullable (не проставлены, пока попытка не сдана).
@freezed
abstract class TestAttemptDetailDto with _$TestAttemptDetailDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TestAttemptDetailDto({
    required String id,
    required int attemptNumber,

    /// Сырое значение (`in_progress`/`submitted`) — парсится в маппере.
    required String status,
    required int maxScore,
    required int passThresholdPercent,
    required DateTime startedAt,
    int? score,
    int? percent,
    bool? passed,
    DateTime? submittedAt,
    @Default(<TestAttemptQuestionDto>[]) List<TestAttemptQuestionDto> questions,

    /// Аддитивное nullable поле (`MyAttemptDetail.organization_timezone`,
    /// backend `23dc2e3`) — `/my/*` не scoped по `{org_id}`, зона нужна
    /// клиенту явно на каждой попытке.
    String? organizationTimezone,
  }) = _TestAttemptDetailDto;

  factory TestAttemptDetailDto.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptDetailDtoFromJson(json);
}
