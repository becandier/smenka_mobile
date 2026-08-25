import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/pages/test_attempt/cubit/test_attempt_cubit.dart';
import 'package:smenka_mobile/pages/test_attempt/cubit/test_attempt_state.dart';

class _MockTestRepository extends Mock implements TestRepository {}

const _template = TestTemplateBrief(
  id: 't1',
  title: 'Техника безопасности',
  questionCount: 2,
  maxAttempts: 2,
  passThresholdPercent: 70,
);

TestAssignment _assignment({
  TestAssignmentStatus status = TestAssignmentStatus.assigned,
  int attemptsUsed = 0,
  bool passed = false,
  int? bestPercent,
  List<TestAssignmentAttemptBrief>? attempts,
  TestTemplateBrief template = _template,
}) => TestAssignment(
  id: 'a1',
  organizationId: 'org1',
  organizationName: 'Org',
  template: template,
  status: status,
  attemptsUsed: attemptsUsed,
  passed: passed,
  bestPercent: bestPercent,
  attempts: attempts,
);

TestAttemptOption _option(String id, {bool correct = false}) =>
    TestAttemptOption(
      id: id,
      text: 'Вариант $id',
      position: 0,
      isCorrect: correct,
    );

TestAttemptQuestion _question(
  String id, {
  TestQuestionType type = TestQuestionType.single,
}) => TestAttemptQuestion(
  id: id,
  text: 'Вопрос $id',
  type: type,
  points: 1,
  position: 0,
  options: [_option('${id}o1', correct: true), _option('${id}o2')],
);

/// Fill-форма (старт/продолжение попытки) — то, что реально отдаёт
/// `TestRepository.startAttempt`.
TestAttemptFill _attemptFill({
  String id = 'attempt1',
  List<TestAttemptQuestion>? questions,
}) => TestAttemptFill(
  id: id,
  startedAt: DateTime.utc(2026, 7, 20),
  questions: questions ?? [_question('q1'), _question('q2')],
);

/// Detail-форма (`GET /my/test-attempts/{id}`) — то, что отдаёт
/// `TestRepository.getAttempt` при резюме открытой попытки.
TestAttemptDetail _attemptDetail({
  String id = 'attempt1',
  List<TestAttemptQuestion>? questions,
  TestAttemptStatus status = TestAttemptStatus.inProgress,
}) => TestAttemptDetail(
  id: id,
  attemptNumber: 1,
  status: status,
  maxScore: 2,
  passThresholdPercent: 70,
  startedAt: DateTime.utc(2026, 7, 20),
  questions: questions ?? [_question('q1'), _question('q2')],
);

void main() {
  late _MockTestRepository repo;

  setUp(() {
    repo = _MockTestRepository();
  });

  TestAttemptCubit build() =>
      TestAttemptCubit(assignmentId: 'a1', repository: repo);

  group('Резолв при входе на экран', () {
    test(
      'свежее назначение (assigned, без попыток) → стартует попытку',
      () async {
        when(() => repo.getAssignmentDetail('a1')).thenAnswer(
          (_) async => Task.success(_assignment(attempts: const [])),
        );
        when(
          () => repo.startAttempt('a1'),
        ).thenAnswer((_) async => Task.success(_attemptFill()));

        final cubit = build();
        await pumpEventQueue();

        expect(cubit.state.isFilling, isTrue);
        expect(cubit.state.attempt?.id, 'attempt1');
        verify(() => repo.startAttempt('a1')).called(1);
      },
    );

    test(
      'есть открытая in_progress попытка с id → резюмируется без старта',
      () async {
        when(() => repo.getAssignmentDetail('a1')).thenAnswer(
          (_) async => Task.success(
            _assignment(
              status: TestAssignmentStatus.inProgress,
              attempts: const [
                TestAssignmentAttemptBrief(
                  id: 'open1',
                  attemptNumber: 1,
                  percent: 0,
                  passed: false,
                  status: TestAttemptStatus.inProgress,
                ),
              ],
            ),
          ),
        );
        when(
          () => repo.getAttempt('open1'),
        ).thenAnswer((_) async => Task.success(_attemptDetail(id: 'open1')));

        final cubit = build();
        await pumpEventQueue();

        expect(cubit.state.isFilling, isTrue);
        expect(cubit.state.attempt?.id, 'open1');
        verifyNever(() => repo.startAttempt(any()));
      },
    );

    test(
      'уже сдан → блок TEST_ALREADY_PASSED, без похода за попыткой',
      () async {
        when(() => repo.getAssignmentDetail('a1')).thenAnswer(
          (_) async => Task.success(
            _assignment(
              status: TestAssignmentStatus.passed,
              passed: true,
              attemptsUsed: 1,
              bestPercent: 90,
            ),
          ),
        );

        final cubit = build();
        await pumpEventQueue();

        expect(cubit.state.blocked, isTrue);
        expect(cubit.state.errorCode, 'TEST_ALREADY_PASSED');
        expect(cubit.state.assignment?.bestPercent, 90);
        verifyNever(() => repo.startAttempt(any()));
        verifyNever(() => repo.getAttempt(any()));
      },
    );

    test(
      'попытки исчерпаны, не сдан → блок с TEST_ATTEMPTS_EXHAUSTED',
      () async {
        when(() => repo.getAssignmentDetail('a1')).thenAnswer(
          (_) async => Task.success(
            _assignment(status: TestAssignmentStatus.failed, attemptsUsed: 2),
          ),
        );

        final cubit = build();
        await pumpEventQueue();

        expect(cubit.state.blocked, isTrue);
        expect(cubit.state.errorCode, 'TEST_ATTEMPTS_EXHAUSTED');
        verifyNever(() => repo.startAttempt(any()));
      },
    );

    test(
      'TEST_ATTEMPT_IN_PROGRESS при старте → переспрашивает и резюмирует',
      () async {
        var call = 0;
        when(() => repo.getAssignmentDetail('a1')).thenAnswer((_) async {
          call++;
          if (call == 1) {
            return Task.success(_assignment(attempts: const []));
          }
          return Task.success(
            _assignment(
              status: TestAssignmentStatus.inProgress,
              attempts: const [
                TestAssignmentAttemptBrief(
                  id: 'race1',
                  attemptNumber: 1,
                  percent: 0,
                  passed: false,
                  status: TestAttemptStatus.inProgress,
                ),
              ],
            ),
          );
        });
        when(() => repo.startAttempt('a1')).thenAnswer(
          (_) async => const Task<TestAttemptFill>.failure(
            ApiException.server(
              message: 'Уже есть попытка',
              code: 'TEST_ATTEMPT_IN_PROGRESS',
            ),
          ),
        );
        when(
          () => repo.getAttempt('race1'),
        ).thenAnswer((_) async => Task.success(_attemptDetail(id: 'race1')));

        final cubit = build();
        await pumpEventQueue();

        expect(cubit.state.isFilling, isTrue);
        expect(cubit.state.attempt?.id, 'race1');
        expect(call, 2);
      },
    );

    test(
      'резюме, но сервер вернул submitted (гонка) → блок вместо fill',
      () async {
        when(() => repo.getAssignmentDetail('a1')).thenAnswer(
          (_) async => Task.success(
            _assignment(
              status: TestAssignmentStatus.inProgress,
              attempts: const [
                TestAssignmentAttemptBrief(
                  id: 'open1',
                  attemptNumber: 1,
                  percent: 80,
                  passed: true,
                  status: TestAttemptStatus.inProgress,
                ),
              ],
            ),
          ),
        );
        when(() => repo.getAttempt('open1')).thenAnswer(
          (_) async => Task.success(
            _attemptDetail(id: 'open1', status: TestAttemptStatus.submitted),
          ),
        );

        final cubit = build();
        await pumpEventQueue();

        expect(cubit.state.isFilling, isFalse);
        expect(cubit.state.blocked, isTrue);
        expect(cubit.state.errorCode, 'TEST_ATTEMPT_ALREADY_SUBMITTED');
      },
    );

    test(
      'shuffle_questions=false сохраняет исходный порядок вопросов',
      () async {
        when(() => repo.getAssignmentDetail('a1')).thenAnswer(
          (_) async => Task.success(_assignment(attempts: const [])),
        );
        when(() => repo.startAttempt('a1')).thenAnswer(
          (_) async => Task.success(
            _attemptFill(
              questions: [_question('q1'), _question('q2'), _question('q3')],
            ),
          ),
        );

        final cubit = build();
        await pumpEventQueue();

        expect(cubit.state.attempt?.questions.map((q) => q.id).toList(), [
          'q1',
          'q2',
          'q3',
        ]);
      },
    );

    test('shuffle_questions=true — тот же набор вопросов', () async {
      const shuffledTemplate = TestTemplateBrief(
        id: 't1',
        title: 'T',
        questionCount: 3,
        maxAttempts: 2,
        passThresholdPercent: 70,
        shuffleQuestions: true,
      );
      when(() => repo.getAssignmentDetail('a1')).thenAnswer(
        (_) async => Task.success(
          _assignment(template: shuffledTemplate, attempts: const []),
        ),
      );
      when(() => repo.startAttempt('a1')).thenAnswer(
        (_) async => Task.success(
          _attemptFill(
            questions: [_question('q1'), _question('q2'), _question('q3')],
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();

      expect(cubit.state.attempt?.questions.map((q) => q.id).toSet(), {
        'q1',
        'q2',
        'q3',
      });
    });
  });

  group('Локальный выбор ответов', () {
    TestAttemptCubit buildFilling() {
      when(
        () => repo.getAssignmentDetail('a1'),
      ).thenAnswer((_) async => Task.success(_assignment(attempts: const [])));
      when(
        () => repo.startAttempt('a1'),
      ).thenAnswer((_) async => Task.success(_attemptFill()));
      return build();
    }

    test('selectSingle заменяет выбор (radio)', () async {
      final cubit = buildFilling();
      await pumpEventQueue();

      cubit.selectSingle('q1', 'q1o1');
      expect(cubit.state.selectedOptionIds['q1'], {'q1o1'});
      cubit.selectSingle('q1', 'q1o2');
      expect(cubit.state.selectedOptionIds['q1'], {'q1o2'});
      expect(cubit.state.answeredCount, 1);
    });

    test('toggleMultiple добавляет/убирает вариант (checkbox)', () async {
      final cubit = buildFilling();
      await pumpEventQueue();

      cubit
        ..toggleMultiple('q2', 'q2o1')
        ..toggleMultiple('q2', 'q2o2');
      expect(cubit.state.selectedOptionIds['q2'], {'q2o1', 'q2o2'});

      cubit.toggleMultiple('q2', 'q2o1');
      expect(cubit.state.selectedOptionIds['q2'], {'q2o2'});
    });
  });

  group('Submit', () {
    test('успех → результат, attempt сброшен (isResult=true)', () async {
      when(
        () => repo.getAssignmentDetail('a1'),
      ).thenAnswer((_) async => Task.success(_assignment(attempts: const [])));
      when(
        () => repo.startAttempt('a1'),
      ).thenAnswer((_) async => Task.success(_attemptFill()));
      when(
        () => repo.submitAttempt('attempt1', answers: any(named: 'answers')),
      ).thenAnswer(
        (_) async => const Task<TestResult>.success(
          TestResult(
            score: 1,
            maxScore: 2,
            percent: 50,
            passed: false,
            passThresholdPercent: 70,
            attemptsUsed: 1,
            attemptsLeft: 1,
            revealAnswers: false,
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();
      cubit.selectSingle('q1', 'q1o1');
      await cubit.submit();

      expect(cubit.state.isResult, isTrue);
      expect(cubit.state.attempt, isNull);
      expect(cubit.state.result?.percent, 50);

      final captured =
          verify(
                () => repo.submitAttempt(
                  'attempt1',
                  answers: captureAny(named: 'answers'),
                ),
              ).captured.single
              as List<TestSubmitAnswer>;
      expect(
        captured
            .firstWhere((a) => a.attemptQuestionId == 'q1')
            .selectedOptionIds,
        ['q1o1'],
      );
      expect(
        captured
            .firstWhere((a) => a.attemptQuestionId == 'q2')
            .selectedOptionIds,
        isEmpty,
      );
    });

    test('ошибка → submitErrorCode проставлен, попытка не теряется', () async {
      when(
        () => repo.getAssignmentDetail('a1'),
      ).thenAnswer((_) async => Task.success(_assignment(attempts: const [])));
      when(
        () => repo.startAttempt('a1'),
      ).thenAnswer((_) async => Task.success(_attemptFill()));
      when(
        () => repo.submitAttempt('attempt1', answers: any(named: 'answers')),
      ).thenAnswer(
        (_) async => const Task<TestResult>.failure(
          ApiException.server(
            message: 'Уже сдана',
            code: 'TEST_ATTEMPT_ALREADY_SUBMITTED',
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();
      await cubit.submit();

      expect(cubit.state.submitErrorCode, 'TEST_ATTEMPT_ALREADY_SUBMITTED');
      expect(cubit.state.submitting, isFalse);
      expect(cubit.state.attempt, isNotNull);
      expect(cubit.state.isResult, isFalse);
    });
  });

  group('Назначение снято/удалено (TEST_ASSIGNMENT_NOT_FOUND)', () {
    test('резолв деталей → «больше не назначен» вместо error-экрана', () async {
      when(() => repo.getAssignmentDetail('a1')).thenAnswer(
        (_) async => const Task<TestAssignment>.failure(
          ApiException.server(
            message: 'Не найдено',
            code: 'TEST_ASSIGNMENT_NOT_FOUND',
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();

      expect(cubit.state.unassigned, isTrue);
      expect(cubit.state.errorCode, 'TEST_ASSIGNMENT_NOT_FOUND');
      expect(cubit.state.isFatalError, isFalse);
      expect(cubit.state.blocked, isFalse);
      expect(cubit.state.isFilling, isFalse);
    });

    test('старт попытки → «больше не назначен» вместо error-экрана', () async {
      when(
        () => repo.getAssignmentDetail('a1'),
      ).thenAnswer((_) async => Task.success(_assignment(attempts: const [])));
      when(() => repo.startAttempt('a1')).thenAnswer(
        (_) async => const Task<TestAttemptFill>.failure(
          ApiException.server(
            message: 'Не найдено',
            code: 'TEST_ASSIGNMENT_NOT_FOUND',
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();

      expect(cubit.state.unassigned, isTrue);
      expect(cubit.state.errorCode, 'TEST_ASSIGNMENT_NOT_FOUND');
      expect(cubit.state.isFatalError, isFalse);
      expect(cubit.state.blocked, isFalse);
    });

    test('загрузка попытки (резюме открытой) → «больше не назначен»'
        ' вместо error-экрана', () async {
      when(() => repo.getAssignmentDetail('a1')).thenAnswer(
        (_) async => Task.success(
          _assignment(
            status: TestAssignmentStatus.inProgress,
            attempts: const [
              TestAssignmentAttemptBrief(
                id: 'open1',
                attemptNumber: 1,
                percent: 0,
                passed: false,
                status: TestAttemptStatus.inProgress,
              ),
            ],
          ),
        ),
      );
      when(() => repo.getAttempt('open1')).thenAnswer(
        (_) async => const Task<TestAttemptDetail>.failure(
          ApiException.server(
            message: 'Не найдено',
            code: 'TEST_ASSIGNMENT_NOT_FOUND',
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();

      expect(cubit.state.unassigned, isTrue);
      expect(cubit.state.errorCode, 'TEST_ASSIGNMENT_NOT_FOUND');
      expect(cubit.state.isFatalError, isFalse);
    });

    test('submit → «больше не назначен» вместо инлайн submitErrorCode,'
        ' без ретраев', () async {
      when(
        () => repo.getAssignmentDetail('a1'),
      ).thenAnswer((_) async => Task.success(_assignment(attempts: const [])));
      when(
        () => repo.startAttempt('a1'),
      ).thenAnswer((_) async => Task.success(_attemptFill()));
      when(
        () => repo.submitAttempt('attempt1', answers: any(named: 'answers')),
      ).thenAnswer(
        (_) async => const Task<TestResult>.failure(
          ApiException.server(
            message: 'Не найдено',
            code: 'TEST_ASSIGNMENT_NOT_FOUND',
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();
      await cubit.submit();

      expect(cubit.state.unassigned, isTrue);
      expect(cubit.state.errorCode, 'TEST_ASSIGNMENT_NOT_FOUND');
      expect(cubit.state.submitting, isFalse);
      expect(cubit.state.submitErrorCode, isNull);
      expect(cubit.state.attempt, isNull);
      expect(cubit.state.isFilling, isFalse);
    });

    test('TEST_TEMPLATE_DELETED на старте попытки → тоже «больше не назначен»,'
        ' с отдельной причиной', () async {
      when(
        () => repo.getAssignmentDetail('a1'),
      ).thenAnswer((_) async => Task.success(_assignment(attempts: const [])));
      when(() => repo.startAttempt('a1')).thenAnswer(
        (_) async => const Task<TestAttemptFill>.failure(
          ApiException.server(
            message: 'Тест удалён',
            code: 'TEST_TEMPLATE_DELETED',
          ),
        ),
      );

      final cubit = build();
      await pumpEventQueue();

      expect(cubit.state.unassigned, isTrue);
      expect(cubit.state.errorCode, 'TEST_TEMPLATE_DELETED');
      expect(
        cubit.state.unassignedReason,
        TestUnassignedReason.templateDeleted,
      );
    });
  });

  group('Retry', () {
    test(
      'пройти ещё раз → сбрасывает результат и стартует новую попытку',
      () async {
        var startCalls = 0;
        when(() => repo.getAssignmentDetail('a1')).thenAnswer(
          (_) async => Task.success(_assignment(attempts: const [])),
        );
        when(() => repo.startAttempt('a1')).thenAnswer((_) async {
          startCalls++;
          return Task.success(_attemptFill(id: 'attempt$startCalls'));
        });
        when(
          () => repo.submitAttempt(any(), answers: any(named: 'answers')),
        ).thenAnswer(
          (_) async => const Task<TestResult>.success(
            TestResult(
              score: 0,
              maxScore: 2,
              percent: 0,
              passed: false,
              passThresholdPercent: 70,
              attemptsUsed: 1,
              attemptsLeft: 1,
              revealAnswers: false,
            ),
          ),
        );

        final cubit = build();
        await pumpEventQueue();
        await cubit.submit();
        expect(cubit.state.isResult, isTrue);

        await cubit.retry();

        expect(cubit.state.isResult, isFalse);
        expect(cubit.state.isFilling, isTrue);
        expect(cubit.state.attempt?.id, 'attempt2');
        expect(startCalls, 2);
      },
    );
  });
}
