import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/_models.dart';

abstract class TestRepository {
  /// Мои назначения. [organizationId] — `null` значит «по всем моим
  /// организациям» (фильтр в UI «Мои тесты»).
  Future<Task<DefaultPaginator<TestAssignment>>> getMyAssignments({
    String? organizationId,
    int limit = 20,
    int offset = 0,
  });

  /// Детали назначения + история моих попыток (`attempts`).
  Future<Task<TestAssignment>> getAssignmentDetail(String assignmentId);

  /// Старт новой попытки (или бэк вернёт уже открытую `in_progress` — см.
  /// `backend.md`).
  Future<Task<TestAttempt>> startAttempt(String assignmentId);

  /// Попытка — для продолжения (`in_progress`) или просмотра результата
  /// (`submitted`).
  Future<Task<TestAttempt>> getAttempt(String attemptId);

  Future<Task<TestResult>> submitAttempt(
    String attemptId, {
    required List<TestSubmitAnswer> answers,
  });
}
