import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/test_attempt.dart';

part 'test_assignment.freezed.dart';

/// Статус назначения (денормализован на бэке).
enum TestAssignmentStatus { assigned, inProgress, passed, failed, unknown }

/// Мета шаблона теста, вложенная в назначение (без вопросов — см.
/// `TestAttemptFill`/`TestAttemptDetail` для снимка вопросов конкретной
/// попытки).
///
/// [shuffleQuestions] — подсказка клиенту перемешать порядок вопросов;
/// `backend.md` явно не перечисляет это поле в кратком списке полей
/// `TestAssignmentOut.template`, но `mobile.md` требует перемешивание —
/// поле сделано аддитивным (`@Default(false)`), чтобы не упасть, если бэк
/// его всё же не пришлёт (см. открытый вопрос в STATUS.md).
@freezed
abstract class TestTemplateBrief with _$TestTemplateBrief {
  const factory TestTemplateBrief({
    required String id,
    required String title,
    required int questionCount,
    required int maxAttempts,
    required int passThresholdPercent,
    String? description,
    @Default(false) bool shuffleQuestions,
  }) = _TestTemplateBrief;
}

/// Краткая запись о попытке в истории назначения (`GET
/// /my/test-assignments/{id}`).
///
/// [id]/[status] сделаны nullable — `backend.md` описывает состав ответа
/// прозой как «кратко: number, percent, passed, submitted_at» без явного
/// упоминания `id`/`status`; `TestAttemptCubit` устроен так, чтобы работать
/// корректно в обоих случаях (см. открытый вопрос в STATUS.md):
/// - если [id] есть — использует его, чтобы дотянуть полную попытку и
///   продолжить незавершённую (`GET /my/test-attempts/{id}`);
/// - если [id] нет — не пытается резолвить попытку по списку, полагается
///   на защитные коды ответа `POST .../attempts`
///   (`TEST_ATTEMPT_IN_PROGRESS`/`TEST_ALREADY_PASSED`/
///   `TEST_ATTEMPTS_EXHAUSTED`).
/// - если [status] нет — статус «в процессе»/«сдана» выводится из
///   [submittedAt] (`null` → в процессе).
@freezed
abstract class TestAssignmentAttemptBrief with _$TestAssignmentAttemptBrief {
  const factory TestAssignmentAttemptBrief({
    required int attemptNumber,
    required int percent,
    required bool passed,
    String? id,
    TestAttemptStatus? status,
    DateTime? submittedAt,
  }) = _TestAssignmentAttemptBrief;
  const TestAssignmentAttemptBrief._();

  bool get isInProgress =>
      status == TestAttemptStatus.inProgress ||
      (status == null && submittedAt == null);
}

/// Назначение теста сотруднику — карточка в «Мои тесты» + детали.
///
/// [attempts] — `null`, когда назначение пришло из списка (`GET
/// /my/test-assignments`, без истории попыток); заполняется при загрузке
/// деталей (`GET /my/test-assignments/{id}`).
@freezed
abstract class TestAssignment with _$TestAssignment {
  const factory TestAssignment({
    required String id,
    required String organizationId,
    required String organizationName,
    required TestTemplateBrief template,
    required TestAssignmentStatus status,
    required int attemptsUsed,
    required bool passed,
    int? bestPercent,
    DateTime? dueAt,
    List<TestAssignmentAttemptBrief>? attempts,
  }) = _TestAssignment;
}
