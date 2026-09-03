import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_attempt.freezed.dart';

/// Тип вопроса. `unknown` — форвард-совместимый фолбэк на незнакомое
/// значение (см. конвенцию ручного парсинга enum в проекте, напр.
/// `ShiftFinishReason`/`KnowledgeNodeKind`); в v1 бэк отдаёт только
/// `single`/`multiple`.
enum TestQuestionType { single, multiple, unknown }

/// Статус попытки прохождения (форма detail — `GET
/// /my/test-attempts/{id}`; в fill-форме старта попытки статуса нет вовсе).
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

    /// Начисленные баллы за вопрос — только в результате `submit`
    /// (`reveal_answers=true`), иначе `null`.
    int? awarded,
  }) = _TestAttemptQuestion;
}

/// Попытка в процессе заполнения — снимок вопросов, минимально нужный
/// fill-экрану (`_FillingView`): только то, что реально гарантирует
/// «тощая» форма бэка `TestAttemptForFill` при старте попытки (без
/// `attempt_number`/`status`/`score`/`max_score` — счёт скрыт до сдачи).
/// Получается либо напрямую из старта (`TestRepository.startAttempt`),
/// либо сужением уже загруженной детальной попытки при резюме
/// ([TestAttemptDetail.toFill]).
@freezed
abstract class TestAttemptFill with _$TestAttemptFill {
  const factory TestAttemptFill({
    required String id,
    required DateTime startedAt,
    required List<TestAttemptQuestion> questions,

    /// Аддитивный nullable backend-контракт (`TestAttemptForFill`, `ce32b62`)
    /// — `/my/*` не scoped по `{org_id}`, зона указывается на попытке явно.
    String? organizationTimezone,
  }) = _TestAttemptFill;
}

/// Попытка — полная деталь (`GET /my/test-attempts/{id}`, форма бэка
/// `MyAttemptDetail`): для резюме открытой попытки (проверка [status] перед
/// рендером fill-экрана — попытка могла стать submitted на другом
/// устройстве) либо просмотра сданной. [score]/[percent]/[passed] — `null`,
/// пока попытка не сдана.
@freezed
abstract class TestAttemptDetail with _$TestAttemptDetail {
  const factory TestAttemptDetail({
    required String id,
    required int attemptNumber,
    required TestAttemptStatus status,
    required int maxScore,
    required int passThresholdPercent,
    required DateTime startedAt,
    required List<TestAttemptQuestion> questions,
    int? score,
    int? percent,
    bool? passed,
    DateTime? submittedAt,

    /// Аддитивный nullable backend-контракт (`MyAttemptDetail`, `23dc2e3`)
    /// — `/my/*` не scoped по `{org_id}`, зона указывается на попытке явно.
    String? organizationTimezone,
  }) = _TestAttemptDetail;
  const TestAttemptDetail._();

  /// Узкая проекция на форму заполнения — то, что нужно fill-экрану при
  /// резюме открытой попытки, без количественных полей результата.
  TestAttemptFill toFill() => TestAttemptFill(
    id: id,
    startedAt: startedAt,
    questions: questions,
    organizationTimezone: organizationTimezone,
  );
}

/// Ответ на один вопрос при отправке (`POST /my/test-attempts/{id}/submit`).
@freezed
abstract class TestSubmitAnswer with _$TestSubmitAnswer {
  const factory TestSubmitAnswer({
    required String attemptQuestionId,
    required List<String> selectedOptionIds,
  }) = _TestSubmitAnswer;
}
