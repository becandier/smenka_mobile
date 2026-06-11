import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';

class ShiftDataSource {
  ShiftDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<PaginatedShiftsDto> getShifts({
    String? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) async {
    final queryParameters = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
    if (status != null) queryParameters['status'] = status;
    if (dateFrom != null) {
      queryParameters['date_from'] = dateFrom.toIso8601String();
    }
    if (dateTo != null) {
      queryParameters['date_to'] = dateTo.toIso8601String();
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '/shifts',
      queryParameters: queryParameters,
    );
    return PaginatedShiftsDto.fromJson(response.data!);
  }

  /// Статистика смен. Окно — либо [period], либо [dateFrom]/[dateTo]
  /// (взаимоисключение обеспечивает вызывающая сторона, см. кубиты).
  Future<ShiftStatsDto> getStats({
    String? period,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) async {
    final queryParameters = <String, dynamic>{};
    if (period != null) queryParameters['period'] = period;
    if (dateFrom != null) {
      queryParameters['date_from'] = dateFrom.toIso8601String();
    }
    if (dateTo != null) {
      queryParameters['date_to'] = dateTo.toIso8601String();
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '/shifts/stats',
      queryParameters: queryParameters,
    );
    return ShiftStatsDto.fromJson(response.data!);
  }

  Future<ShiftDto> startShift({
    String? organizationId,
    double? latitude,
    double? longitude,
  }) async {
    final data = <String, dynamic>{};
    if (organizationId != null) data['organization_id'] = organizationId;
    if (latitude != null) data['latitude'] = latitude;
    if (longitude != null) data['longitude'] = longitude;

    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/start',
      data: data.isEmpty ? null : data,
    );
    return ShiftDto.fromJson(response.data!);
  }

  Future<ShiftDto> pauseShift(String shiftId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/$shiftId/pause',
    );
    return ShiftDto.fromJson(response.data!);
  }

  Future<ShiftDto> resumeShift(String shiftId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/$shiftId/resume',
    );
    return ShiftDto.fromJson(response.data!);
  }

  Future<ShiftDto> finishShift(String shiftId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/$shiftId/finish',
    );
    return ShiftDto.fromJson(response.data!);
  }
}
