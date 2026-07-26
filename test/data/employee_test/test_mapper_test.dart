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

Map<String, dynamic> _attemptJson({String status = 'in_progress'}) => {
  'id': 'attempt1',
  'attempt_number': 1,
  'status': status,
  'max_score': 2,
  'started_at': '2026-07-20T10:00:00Z',
  'questions': [_questionJson()],
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

  group('Статус попытки — ручной парсинг с фолбэком unknown', () {
    test('in_progress / submitted распознаются', () {
      final inProgress = TestAttemptDto.fromJson(_attemptJson()).toDomain();
      final submitted = TestAttemptDto.fromJson(
        _attemptJson(status: 'submitted'),
      ).toDomain();

      expect(inProgress.status, TestAttemptStatus.inProgress);
      expect(submitted.status, TestAttemptStatus.submitted);
    });

    test('незнакомое значение → unknown', () {
      final attempt = TestAttemptDto.fromJson(
        _attemptJson(status: 'weird'),
      ).toDomain();

      expect(attempt.status, TestAttemptStatus.unknown);
    });
  });

  group(
    'TestAssignmentAttemptBrief — nullable id/status (открытый вопрос)',
    () {
      test('status передан явно → используется как есть', () {
        final brief = TestAssignmentAttemptBriefDto.fromJson({
          'id': 'att1',
          'attempt_number': 1,
          'status': 'submitted',
          'percent': 80,
          'passed': true,
          'submitted_at': '2026-07-20T10:00:00Z',
        }).toDomain();

        expect(brief.id, 'att1');
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
    test('hasMore считается по offset+items.length < total', () {
      final page = PaginatedTestAssignmentsDto.fromJson({
        'items': <dynamic>[],
        'total': 3,
        'limit': 20,
        'offset': 0,
      }).toDomain();

      expect(page.hasMore, isTrue);
    });
  });
}
