import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/test_attempt.dart'
    show TestSubmitAnswer;
import 'package:smenka_mobile/data/infrastructure/employee_test/datasource/dto/_dto.dart';

/// `/my/test-assignments*` и `/my/test-attempts*` — единый DataSource
/// (по образцу `ChecklistDataSource`, который тоже покрывает 2 базовых
/// пути одной сущности).
class TestDataSource {
  TestDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<PaginatedTestAssignmentsDto> getMyAssignments({
    String? organizationId,
    String? status,
    int limit = 20,
    int offset = 0,
  }) async {
    final queryParameters = <String, dynamic>{'limit': limit, 'offset': offset};
    if (organizationId != null) {
      queryParameters['organization_id'] = organizationId;
    }
    if (status != null) queryParameters['status'] = status;

    final response = await _dio.get<Map<String, dynamic>>(
      '/my/test-assignments',
      queryParameters: queryParameters,
    );
    return PaginatedTestAssignmentsDto.fromJson(response.data!);
  }

  Future<TestAssignmentDto> getAssignmentDetail(String assignmentId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/my/test-assignments/$assignmentId',
    );
    return TestAssignmentDto.fromJson(response.data!);
  }

  Future<TestAttemptDto> startAttempt(String assignmentId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/my/test-assignments/$assignmentId/attempts',
    );
    return TestAttemptDto.fromJson(response.data!);
  }

  Future<TestAttemptDto> getAttempt(String attemptId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/my/test-attempts/$attemptId',
    );
    return TestAttemptDto.fromJson(response.data!);
  }

  Future<TestResultDto> submitAttempt(
    String attemptId, {
    required List<TestSubmitAnswer> answers,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/my/test-attempts/$attemptId/submit',
      data: {
        'answers': [
          for (final answer in answers)
            {
              'attempt_question_id': answer.attemptQuestionId,
              'selected_option_ids': answer.selectedOptionIds,
            },
        ],
      },
    );
    return TestResultDto.fromJson(response.data!);
  }
}
