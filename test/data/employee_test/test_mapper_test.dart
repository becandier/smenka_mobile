import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/data/infrastructure/employee_test/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/employee_test/mappers/_mappers.dart';

Map<String, dynamic> _questionJson({
  String type = 'single_choice',
  String id = 'q1',
}) => {
  'id': id,
  'text': 'Вопрос?',
  'type': type,
  'points': 2,
  'position': 0,
  'options': [
    {'id': 'o1', 'text': 'Верно', 'position': 0, 'is_correct': true},
    {'id': 'o2', 'text': 'Неверно', 'position': 1, 'is_correct': false},
  ],
};

Map<String, dynamic> _attemptDetailJson({String status = 'in_progress'}) => {
  'id': 'attempt1',
  'attempt_number': 1,
  'status': status,
  'max_score': 2,
  'pass_threshold_percent': 70,
  'started_at': '2026-07-20T10:00:00Z',
  'questions': [_questionJson()],
};

/// Тощая fill-форма (`TestAttemptForFill`, старт попытки) — намеренно БЕЗ
/// `attempt_number`/`status`/`score`/`max_score`/`pass_threshold_percent`,
/// которые раньше ошибочно требовались как `required` и роняли старт теста
/// (`type 'Null' is not a subtype of type 'num'`).
Map<String, dynamic> _attemptFillJson({String id = 'attempt1'}) => {
  'id': id,
  'started_at': '2026-07-20T10:00:00Z',
  'questions': [_questionJson()],
};

Map<String, dynamic> _resultJson({bool revealAnswers = false}) => {
  'score': 1,
  'max_score': 2,
  'percent': 50,
  'passed': false,
  'pass_threshold_percent': 70,
  'attempts_used': 1,
  'attempts_left': 1,
  'reveal_answers': revealAnswers,
  if (revealAnswers) 'questions': [_questionJson()],
};

void main() {
  group('Тип вопроса — ручной парсинг с фолбэком unknown', () {
    test('single_choice / multiple_choice распознаются', () {
      final single = TestAttemptQuestionDto.fromJson(
        _questionJson(),
      ).toDomain();
      final multiple = TestAttemptQuestionDto.fromJson(
        _questionJson(type: 'multiple_choice'),
      ).toDomain();

      expect(single.type, TestQuestionType.single);
      expect(multiple.type, TestQuestionType.multiple);
    });

    test('незнакомое значение → unknown (форвард-совместимость)', () {
      final question = TestAttemptQuestionDto.fromJson(
        _questionJson(type: 'open_text'),
      ).toDomain();

      expect(question.type, TestQuestionType.unknown);
    });
  });

  group('TestAttemptDetailDto → toDomain — статус (фолбэк unknown)', () {
    test('in_progress / submitted распознаются', () {
      final inProgress = TestAttemptDetailDto.fromJson(
        _attemptDetailJson(),
      ).toDomain();
      final submitted = TestAttemptDetailDto.fromJson(
        _attemptDetailJson(status: 'submitted'),
      ).toDomain();

      expect(inProgress.status, TestAttemptStatus.inProgress);
      expect(submitted.status, TestAttemptStatus.submitted);
    });

    test('незнакомое значение → unknown', () {
      final attempt = TestAttemptDetailDto.fromJson(
        _attemptDetailJson(status: 'weird'),
      ).toDomain();

      expect(attempt.status, TestAttemptStatus.unknown);
    });

    test('маппит количественные поля и снимок вопросов', () {
      final attempt = TestAttemptDetailDto.fromJson(
        _attemptDetailJson(),
      ).toDomain();

      expect(attempt.id, 'attempt1');
      expect(attempt.attemptNumber, 1);
      expect(attempt.maxScore, 2);
      expect(attempt.passThresholdPercent, 70);
      expect(attempt.questions, hasLength(1));
      expect(attempt.score, isNull);
      expect(attempt.passed, isNull);
    });

    test('toFill() сужает деталь до формы заполнения (резюме попытки)', () {
      final detail = TestAttemptDetailDto.fromJson(
        _attemptDetailJson(),
      ).toDomain();

      final fill = detail.toFill();

      expect(fill.id, detail.id);
      expect(fill.startedAt, detail.startedAt);
      expect(fill.questions, detail.questions);
    });
  });

  group(
    'TestAttemptForFillDto → toDomain (регресс на краш при старте попытки)',
    () {
      test(
        'тощая fill-форма без attempt_number/status/score парсится без краша',
        () {
          final fill = TestAttemptForFillDto.fromJson(
            _attemptFillJson(),
          ).toDomain();

          expect(fill.id, 'attempt1');
          expect(fill.startedAt, DateTime.utc(2026, 7, 20, 10));
          expect(fill.questions, hasLength(1));
          expect(fill.questions.single.options, hasLength(2));
        },
      );

      test(
        'вариант ответа без is_selected/is_correct (fill) → дефолты false/null',
        () {
          final option = TestAttemptOptionDto.fromJson({
            'id': 'o1',
            'text': 'Верно',
            'position': 0,
          }).toDomain();

          expect(option.isSelected, isFalse);
          expect(option.isCorrect, isNull);
        },
      );
    },
  );

  group('TestResultDto → toDomain', () {
    test('revealAnswers=false → questions null, счёт/процент маппятся', () {
      final result = TestResultDto.fromJson(_resultJson()).toDomain();

      expect(result.score, 1);
      expect(result.maxScore, 2);
      expect(result.percent, 50);
      expect(result.passed, isFalse);
      expect(result.attemptsUsed, 1);
      expect(result.attemptsLeft, 1);
      expect(result.revealAnswers, isFalse);
      expect(result.questions, isNull);
    });

    test('revealAnswers=true → вопросы с разметкой приходят в domain', () {
      final result = TestResultDto.fromJson(
        _resultJson(revealAnswers: true),
      ).toDomain();

      expect(result.revealAnswers, isTrue);
      expect(result.questions, hasLength(1));
    });
  });

  group(
    'TestAssignmentAttemptBrief — nullable id/status (открытый вопрос)',
    () {
      test('status передан явно → используется как есть; number→attemptNumber', () {
        // Бэк (MyAttemptSummary) отдаёт `number`, а не `attempt_number` —
        // регресс на краш открытия теста с попытками.
        final brief = TestAssignmentAttemptBriefDto.fromJson({
          'id': 'att1',
          'number': 3,
          'status': 'submitted',
          'percent': 80,
          'passed': true,
          'submitted_at': '2026-07-20T10:00:00Z',
        }).toDomain();

        expect(brief.id, 'att1');
        expect(brief.attemptNumber, 3);
        expect(brief.status, TestAttemptStatus.submitted);
        expect(brief.isInProgress, isFalse);
      });

      test('status отсутствует, submitted_at тоже → выводим "в процессе"', () {
        final brief = TestAssignmentAttemptBriefDto.fromJson({
          'attempt_number': 1,
          'percent': 0,
          'passed': false,
        }).toDomain();

        expect(brief.id, isNull);
        expect(brief.status, isNull);
        expect(brief.isInProgress, isTrue);
      });

      test('status отсутствует, но submitted_at есть → НЕ "в процессе"', () {
        final brief = TestAssignmentAttemptBriefDto.fromJson({
          'attempt_number': 1,
          'percent': 50,
          'passed': false,
          'submitted_at': '2026-07-20T10:00:00Z',
        }).toDomain();

        expect(brief.isInProgress, isFalse);
      });
    },
  );

  group('TestAssignmentDto → toDomain (org/template флэттенится)', () {
    test('переносит вложенные organization/template в плоские поля', () {
      final assignment = TestAssignmentDto.fromJson({
        'id': 'a1',
        'organization': {'id': 'org1', 'name': 'Кофейня на Ленина'},
        'template': {
          'id': 't1',
          'title': 'Техника безопасности',
          'question_count': 5,
          'max_attempts': 2,
          'pass_threshold_percent': 70,
          'shuffle_questions': true,
        },
        'status': 'assigned',
        'attempts_used': 0,
        'passed': false,
      }).toDomain();

      expect(assignment.organizationId, 'org1');
      expect(assignment.organizationName, 'Кофейня на Ленина');
      expect(assignment.template.title, 'Техника безопасности');
      expect(assignment.template.shuffleQuestions, isTrue);
      expect(assignment.status, TestAssignmentStatus.assigned);
      expect(assignment.attempts, isNull);
    });

    test(
      'shuffle_questions отсутствует в ответе → false (аддитивное поле)',
      () {
        final assignment = TestAssignmentDto.fromJson({
          'id': 'a1',
          'organization': {'id': 'org1', 'name': 'Org'},
          'template': {
            'id': 't1',
            'title': 'T',
            'question_count': 1,
            'max_attempts': 1,
            'pass_threshold_percent': 70,
          },
          'status': 'passed',
          'attempts_used': 1,
          'passed': true,
        }).toDomain();

        expect(assignment.template.shuffleQuestions, isFalse);
      },
    );

    test('незнакомый status → unknown', () {
      final assignment = TestAssignmentDto.fromJson({
        'id': 'a1',
        'organization': {'id': 'org1', 'name': 'Org'},
        'template': {
          'id': 't1',
          'title': 'T',
          'question_count': 1,
          'max_attempts': 1,
          'pass_threshold_percent': 70,
        },
        'status': 'weird',
        'attempts_used': 0,
        'passed': false,
      }).toDomain();

      expect(assignment.status, TestAssignmentStatus.unknown);
    });
  });

  group('PaginatedTestAssignmentsDto → toDomain', () {
    test('голый {items} без total/limit/offset — одна полная страница '
        '(регресс на краш "Null is not a subtype of num")', () {
      final page = PaginatedTestAssignmentsDto.fromJson({
        'items': <dynamic>[
          {
            'id': 'a1',
            'organization': {'id': 'org1', 'name': 'Org'},
            'template': {
              'id': 't1',
              'title': 'T',
              'question_count': 1,
              'max_attempts': 1,
              'pass_threshold_percent': 70,
            },
            'status': 'assigned',
            'attempts_used': 0,
            'passed': false,
          },
        ],
      }).toDomain();

      expect(page.data?.length, 1);
      expect(page.total, 1);
      expect(page.hasMore, isFalse);
    });

    test('пустой список — hasMore false, total 0', () {
      final page = PaginatedTestAssignmentsDto.fromJson({
        'items': <dynamic>[],
      }).toDomain();

      expect(page.data, isEmpty);
      expect(page.total, 0);
      expect(page.hasMore, isFalse);
    });
  });
}
