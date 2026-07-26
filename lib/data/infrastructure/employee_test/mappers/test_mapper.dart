import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/employee_test/datasource/dto/_dto.dart';

TestQuestionType _parseQuestionType(String value) => switch (value) {
  'single_choice' => TestQuestionType.single,
  'multiple_choice' => TestQuestionType.multiple,
  _ => TestQuestionType.unknown,
};

TestAttemptStatus _parseAttemptStatus(String value) => switch (value) {
  'in_progress' => TestAttemptStatus.inProgress,
  'submitted' => TestAttemptStatus.submitted,
  _ => TestAttemptStatus.unknown,
};

TestAttemptStatus? _parseAttemptStatusOrNull(String? value) => switch (value) {
  'in_progress' => TestAttemptStatus.inProgress,
  'submitted' => TestAttemptStatus.submitted,
  null => null,
  _ => TestAttemptStatus.unknown,
};

TestAssignmentStatus _parseAssignmentStatus(String value) => switch (value) {
  'assigned' => TestAssignmentStatus.assigned,
  'in_progress' => TestAssignmentStatus.inProgress,
  'passed' => TestAssignmentStatus.passed,
  'failed' => TestAssignmentStatus.failed,
  _ => TestAssignmentStatus.unknown,
};

extension TestAttemptOptionMapper on TestAttemptOptionDto {
  TestAttemptOption toDomain() {
    return TestAttemptOption(
      id: id,
      text: text,
      position: position,
      isSelected: isSelected,
      isCorrect: isCorrect,
    );
  }
}

extension TestAttemptQuestionMapper on TestAttemptQuestionDto {
  TestAttemptQuestion toDomain() {
    return TestAttemptQuestion(
      id: id,
      text: text,
      type: _parseQuestionType(type),
      points: points,
      position: position,
      options: options.map((e) => e.toDomain()).toList(),
    );
  }
}

extension TestAttemptMapper on TestAttemptDto {
  TestAttempt toDomain() {
    return TestAttempt(
      id: id,
      attemptNumber: attemptNumber,
      status: _parseAttemptStatus(status),
      score: score,
      maxScore: maxScore,
      percent: percent,
      passed: passed,
      startedAt: startedAt,
      submittedAt: submittedAt,
      questions: questions.map((e) => e.toDomain()).toList(),
    );
  }
}

extension TestTemplateBriefMapper on TestTemplateBriefDto {
  TestTemplateBrief toDomain() {
    return TestTemplateBrief(
      id: id,
      title: title,
      description: description,
      questionCount: questionCount,
      maxAttempts: maxAttempts,
      passThresholdPercent: passThresholdPercent,
      shuffleQuestions: shuffleQuestions,
    );
  }
}

extension TestAssignmentAttemptBriefMapper on TestAssignmentAttemptBriefDto {
  TestAssignmentAttemptBrief toDomain() {
    return TestAssignmentAttemptBrief(
      id: id,
      attemptNumber: attemptNumber,
      status: _parseAttemptStatusOrNull(status),
      percent: percent,
      passed: passed,
      submittedAt: submittedAt,
    );
  }
}

extension TestAssignmentMapper on TestAssignmentDto {
  TestAssignment toDomain() {
    return TestAssignment(
      id: id,
      organizationId: organization.id,
      organizationName: organization.name,
      template: template.toDomain(),
      status: _parseAssignmentStatus(status),
      attemptsUsed: attemptsUsed,
      bestPercent: bestPercent,
      passed: passed,
      dueAt: dueAt,
      attempts: attempts?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension PaginatedTestAssignmentsMapper on PaginatedTestAssignmentsDto {
  DefaultPaginator<TestAssignment> toDomain() {
    return DefaultPaginator<TestAssignment>(
      hasMore: offset + items.length < total,
      data: items.map((e) => e.toDomain()).toList(),
      total: total,
    );
  }
}

extension TestResultMapper on TestResultDto {
  TestResult toDomain() {
    return TestResult(
      score: score,
      maxScore: maxScore,
      percent: percent,
      passed: passed,
      passThresholdPercent: passThresholdPercent,
      attemptsUsed: attemptsUsed,
      attemptsLeft: attemptsLeft,
      revealAnswers: revealAnswers,
      questions: questions?.map((e) => e.toDomain()).toList(),
    );
  }
}
