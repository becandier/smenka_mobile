import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/data/infrastructure/employee_test/datasource/test_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/employee_test/mappers/_mappers.dart';

class TestRepositoryImpl with TaskHandler implements TestRepository {
  TestRepositoryImpl({required TestDataSource dataSource})
    : _dataSource = dataSource;

  final TestDataSource _dataSource;

  @override
  Future<Task<DefaultPaginator<TestAssignment>>> getMyAssignments({
    String? organizationId,
    int limit = 20,
    int offset = 0,
  }) {
    return execute(() async {
      final dto = await _dataSource.getMyAssignments(
        organizationId: organizationId,
        limit: limit,
        offset: offset,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<TestAssignment>> getAssignmentDetail(String assignmentId) {
    return execute(() async {
      final dto = await _dataSource.getAssignmentDetail(assignmentId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<TestAttempt>> startAttempt(String assignmentId) {
    return execute(() async {
      final dto = await _dataSource.startAttempt(assignmentId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<TestAttempt>> getAttempt(String attemptId) {
    return execute(() async {
      final dto = await _dataSource.getAttempt(attemptId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<TestResult>> submitAttempt(
    String attemptId, {
    required List<TestSubmitAnswer> answers,
  }) {
    return execute(() async {
      final dto = await _dataSource.submitAttempt(attemptId, answers: answers);
      return dto.toDomain();
    });
  }
}
