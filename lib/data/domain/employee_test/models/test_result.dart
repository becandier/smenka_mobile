import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/test_attempt.dart';

part 'test_result.freezed.dart';

/// Ответ `POST /my/test-attempts/{id}/submit`.
///
/// [questions] — вопросы с разметкой верных/выбранных ответов, только когда
/// [revealAnswers] равен `true` (иначе `null` — показываем только итог).
@freezed
abstract class TestResult with _$TestResult {
  const factory TestResult({
    required int score,
    required int maxScore,
    required int percent,
    required bool passed,
    required int passThresholdPercent,
    required int attemptsUsed,
    required int attemptsLeft,
    required bool revealAnswers,
    List<TestAttemptQuestion>? questions,
  }) = _TestResult;
}
