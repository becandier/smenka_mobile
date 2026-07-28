import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/pages/test_attempt/cubit/test_attempt_state.dart';

/// Прохождение одного назначения теста — старт/резюме/локальный выбор
/// ответов/submit/результат. Одна и та же точка входа
/// (`TestAttemptRoute(assignmentId: ...)`) для тапа по «Мои тесты» и по
/// уведомлению `test_assigned` (см. `notification_navigation.dart`).
///
/// Независим от других кубитов (см. конвенции проекта) — только
/// [TestRepository].
class TestAttemptCubit extends Cubit<TestAttemptState> {
  TestAttemptCubit({
    required String assignmentId,
    required TestRepository repository,
  }) : _assignmentId = assignmentId,
       _repository = repository,
       super(const TestAttemptState()) {
    _resolve();
  }

  final String _assignmentId;
  final TestRepository _repository;

  /// Резолвит, что показать при входе на экран: продолжить открытую
  /// попытку, показать блокирующее сообщение (уже сдан/попытки исчерпаны)
  /// или стартовать новую попытку.
  Future<void> _resolve() async {
    emit(const TestAttemptState(status: FeatureStatus.loading));

    final detailResult = await _repository.getAssignmentDetail(_assignmentId);
    await detailResult.fold(
      onSuccess: (assignment) async {
        emit(
          state.copyWith(assignment: assignment, status: FeatureStatus.success),
        );

        final openAttemptId = assignment.attempts
            ?.firstWhereOrNull((a) => a.isInProgress && a.id != null)
            ?.id;
        if (openAttemptId != null) {
          await _loadAttempt(openAttemptId);
          return;
        }

        final attemptsExhausted =
            assignment.attemptsUsed >= assignment.template.maxAttempts;
        if (assignment.passed || attemptsExhausted) {
          emit(
            state.copyWith(
              blocked: true,
              errorCode: assignment.passed
                  ? 'TEST_ALREADY_PASSED'
                  : 'TEST_ATTEMPTS_EXHAUSTED',
            ),
          );
          return;
        }

        await _startAttempt();
      },
      onFailure: (error) async {
        emit(
          state.copyWith(
            status: FeatureStatus.error,
            error: error.message,
            errorCode: error.code,
          ),
        );
      },
    );
  }

  Future<void> _loadAttempt(String attemptId) async {
    emit(state.copyWith(status: FeatureStatus.loading));
    final result = await _repository.getAttempt(attemptId);
    result.fold(
      onSuccess: (attemptDetail) {
        // Защитная ветка: попытка успела стать submitted между снимком
        // назначения и этим запросом (гонка/другое устройство). Не рендерим
        // fill-экран поверх уже сданного — показываем блок с известным
        // итогом из assignment (перезагрузится при следующем входе).
        if (attemptDetail.status == TestAttemptStatus.submitted) {
          emit(
            state.copyWith(
              status: FeatureStatus.success,
              blocked: true,
              errorCode: 'TEST_ATTEMPT_ALREADY_SUBMITTED',
            ),
          );
          return;
        }
        emit(
          state.copyWith(
            status: FeatureStatus.success,
            attempt: _applyShuffle(attemptDetail.toFill()),
            selectedOptionIds: const {},
          ),
        );
      },
      onFailure: (error) => emit(
        state.copyWith(
          status: FeatureStatus.error,
          error: error.message,
          errorCode: error.code,
        ),
      ),
    );
  }

  Future<void> _startAttempt({bool allowRaceRetry = true}) async {
    emit(state.copyWith(status: FeatureStatus.loading));
    final result = await _repository.startAttempt(_assignmentId);
    await result.fold(
      onSuccess: (attempt) async {
        emit(
          state.copyWith(
            status: FeatureStatus.success,
            attempt: _applyShuffle(attempt),
            selectedOptionIds: const {},
          ),
        );
      },
      onFailure: (error) async {
        switch (error.code) {
          case 'TEST_ATTEMPT_IN_PROGRESS' when allowRaceRetry:
            // Расхождение со снимком assignment.attempts (гонка/другое
            // устройство) — переспрашиваем детали один раз, без риска
            // бесконечной рекурсии (allowRaceRetry передаётся только false
            // дальше).
            await _resolveOpenAttemptAfterRace();
          case 'TEST_ALREADY_PASSED':
          case 'TEST_ATTEMPTS_EXHAUSTED':
          case 'TEST_TEMPLATE_ARCHIVED':
          case 'TEST_ATTEMPT_IN_PROGRESS':
            emit(
              state.copyWith(
                status: FeatureStatus.success,
                blocked: true,
                errorCode: error.code,
              ),
            );
          default:
            emit(
              state.copyWith(
                status: FeatureStatus.error,
                error: error.message,
                errorCode: error.code,
              ),
            );
        }
      },
    );
  }

  Future<void> _resolveOpenAttemptAfterRace() async {
    final detailResult = await _repository.getAssignmentDetail(_assignmentId);
    final assignment = detailResult.dataOrNull;
    if (assignment != null) {
      emit(state.copyWith(assignment: assignment));
    }
    final openAttemptId = assignment?.attempts
        ?.firstWhereOrNull((a) => a.isInProgress && a.id != null)
        ?.id;
    if (openAttemptId != null) {
      await _loadAttempt(openAttemptId);
    } else {
      // Бэк не отдал id открытой попытки — показать точный результат
      // не можем технически (см. doc-комментарий `TestAssignmentAttemptBrief`
      // в домене), сообщаем как есть.
      emit(
        state.copyWith(
          status: FeatureStatus.error,
          errorCode: 'TEST_ATTEMPT_IN_PROGRESS',
        ),
      );
    }
  }

  TestAttemptFill _applyShuffle(TestAttemptFill attempt) {
    final shuffle = state.assignment?.template.shuffleQuestions ?? false;
    if (!shuffle) return attempt;
    final questions = [...attempt.questions]..shuffle();
    return attempt.copyWith(questions: questions);
  }

  void selectSingle(String attemptQuestionId, String optionId) {
    final updated = Map<String, Set<String>>.of(state.selectedOptionIds)
      ..[attemptQuestionId] = {optionId};
    emit(state.copyWith(selectedOptionIds: updated));
  }

  void toggleMultiple(String attemptQuestionId, String optionId) {
    final updated = Map<String, Set<String>>.of(state.selectedOptionIds);
    final current = Set<String>.of(updated[attemptQuestionId] ?? const {});
    if (!current.remove(optionId)) {
      current.add(optionId);
    }
    updated[attemptQuestionId] = current;
    emit(state.copyWith(selectedOptionIds: updated));
  }

  Future<void> submit() async {
    final attempt = state.attempt;
    if (attempt == null || state.submitting) return;

    emit(
      state.copyWith(
        submitting: true,
        submitErrorCode: null,
        submitError: null,
      ),
    );

    final answers = [
      for (final question in attempt.questions)
        TestSubmitAnswer(
          attemptQuestionId: question.id,
          selectedOptionIds: (state.selectedOptionIds[question.id] ?? const {})
              .toList(),
        ),
    ];

    final result = await _repository.submitAttempt(
      attempt.id,
      answers: answers,
    );
    result.fold(
      onSuccess: (testResult) => emit(
        state.copyWith(submitting: false, result: testResult, attempt: null),
      ),
      onFailure: (error) => emit(
        state.copyWith(
          submitting: false,
          submitErrorCode: error.code,
          submitError: error.message,
        ),
      ),
    );
  }

  /// «Пройти ещё раз» — новая попытка после результата (сервер — источник
  /// истины по лимиту/уже сдан, клиент лишь инициирует).
  Future<void> retry() async {
    emit(
      state.copyWith(
        result: null,
        blocked: false,
        error: null,
        errorCode: null,
        selectedOptionIds: const {},
      ),
    );
    await _startAttempt();
  }

  Future<void> retryLoad() => _resolve();
}
