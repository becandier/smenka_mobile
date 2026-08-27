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
    final queryParameters = <String, dynamic>{'limit': limit, 'offset': offset};
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

  /// Своя смена по id (`GET /shifts/{shift_id}`, `shift_self_detail`).
  /// Чужая/несуществующая/soft-deleted смена → `404 SHIFT_NOT_FOUND`.
  Future<ShiftDto> getShiftById(String shiftId) async {
    final response = await _dio.get<Map<String, dynamic>>('/shifts/$shiftId');
    return ShiftDto.fromJson(response.data!);
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

  /// Старт смены. [geoFallbackPhotoId] + [geoFallbackReason] — ветка старта
  /// без координат по фото (`shift_geo_photo_fallback`): передаются только
  /// вместе и только когда координат нет (иначе бэк вернёт 422
  /// `VALIDATION_ERROR` — фото не обходит проверку «вне зоны»).
  Future<ShiftDto> startShift({
    String? organizationId,
    double? latitude,
    double? longitude,
    String? workLocationId,
    String? workScheduleId,
    String? geoFallbackPhotoId,
    String? geoFallbackReason,
  }) async {
    final data = <String, dynamic>{};
    if (organizationId != null) data['organization_id'] = organizationId;
    if (latitude != null) data['latitude'] = latitude;
    if (longitude != null) data['longitude'] = longitude;
    if (workLocationId != null) data['work_location_id'] = workLocationId;
    if (workScheduleId != null) data['work_schedule_id'] = workScheduleId;
    if (geoFallbackPhotoId != null) {
      data['geo_fallback_photo_id'] = geoFallbackPhotoId;
    }
    if (geoFallbackReason != null) {
      data['geo_fallback_reason'] = geoFallbackReason;
    }

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

  Future<ShiftOvertimeRequestDto> requestOvertime(
    String shiftId, {
    required int minutes,
    required String comment,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/$shiftId/overtime',
      data: {'minutes': minutes, 'comment': comment},
    );
    return ShiftOvertimeRequestDto.fromJson(response.data!);
  }

  Future<void> cancelOvertimeRequest(String shiftId) async {
    await _dio.delete<void>('/shifts/$shiftId/overtime');
  }
}
