import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/infrastructure/employee_test/datasource/dto/test_attempt_dto.dart';

part 'test_result_dto.freezed.dart';
part 'test_result_dto.g.dart';

@freezed
abstract class TestResultDto with _$TestResultDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TestResultDto({
    required int score,
    required int maxScore,
    required int percent,
    required bool passed,
    required int passThresholdPercent,
    required int attemptsUsed,
    required int attemptsLeft,
    @Default(false) bool revealAnswers,
    List<TestAttemptQuestionDto>? questions,
  }) = _TestResultDto;

  factory TestResultDto.fromJson(Map<String, dynamic> json) =>
      _$TestResultDtoFromJson(json);
}
