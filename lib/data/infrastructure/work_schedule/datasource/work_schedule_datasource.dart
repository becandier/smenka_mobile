import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/work_schedule/datasource/dto/_dto.dart';

class WorkScheduleDataSource {
  WorkScheduleDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<MySchedulesDto> getMySchedules(
    String orgId, {
    String? workLocationId,
  }) async {
    final queryParameters = <String, dynamic>{};
    if (workLocationId != null) {
      queryParameters['work_location_id'] = workLocationId;
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/my-schedules',
      queryParameters: queryParameters,
    );
    return MySchedulesDto.fromJson(response.data!);
  }
}
