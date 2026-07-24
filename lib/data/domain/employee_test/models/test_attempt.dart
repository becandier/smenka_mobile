import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_attempt.freezed.dart';

/// Тип вопроса. `unknown` — форвард-совместимый фолбэк на незнакомое
/// значение (см. конвенцию ручного парсинга enum в проекте, напр.
/// `ShiftFinishReason`/`KnowledgeNodeKind`); в v1 бэк отдаёт только
/// `single`/`multiple`.
enum TestQuestionType { single, multiple, unknown }

/// Статус попытки прохождения.
enum TestAttemptStatus { inProgress, submitted, unknown }

/// Вариант ответа — снимок попытки.
///
/// [isSelected] — выбрал ли сотрудник (`false` до первого локального выбора
/// в UI прохождения; на сервере проставляется только после submit).
/// [isCorrect] — `null` до сдачи (скрыт от сотрудника, см. `backend.md`) либо
/// когда `reveal_answers=false`; иначе — верный ли вариант.
@freezed
abstract class TestAttemptOption with _$TestAttemptOption {
  const factory TestAttemptOption({
    required String id,
    required String text,
    required int position,
    @Default(false) bool isSelected,
    bool? isCorrect,
  }) = _TestAttemptOption;
}

/// Вопрос — снимок попытки, с вариантами.
@freezed
abstract class TestAttemptQuestion with _$TestAttemptQuestion {
  const factory TestAttemptQuestion({
    required String id,
    required String text,
    required TestQuestionType type,
    required int points,
    required int position,
    required List<TestAttemptOption> options,
  }) = _TestAttemptQuestion;
}

/// Попытка прохождения теста — снимок вопросов на момент старта.
///
/// Используется и для «прохождения» (status=[TestAttemptStatus.inProgress],
/// варианты без `isCorrect`, `isSelected` всегда `false` — локальный выбор
/// живёт отдельно в `TestAttemptState.selectedOptionIds`, не мутирует эту
/// модель), и для «просмотра сданной попытки» (status=submitted, варианты
/// несут `isSelected`/`isCorrect`, если `reveal_answers=true`).
@freezed
abstract class TestAttempt with _$TestAttempt {
  const factory TestAttempt({
    required String id,
    required int attemptNumber,
    required TestAttemptStatus status,
    required int score,
    required int maxScore,
    required int percent,
    required bool passed,
    required DateTime startedAt,
    required List<TestAttemptQuestion> questions,
    DateTime? submittedAt,
  }) = _TestAttempt;
}

/// Ответ на один вопрос при отправке (`POST /my/test-attempts/{id}/submit`).
@freezed
abstract class TestSubmitAnswer with _$TestSubmitAnswer {
  const factory TestSubmitAnswer({
    required String attemptQuestionId,
    required List<String> selectedOptionIds,
  }) = _TestSubmitAnswer;
}
