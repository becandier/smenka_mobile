import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';

class OrganizationDataSource {
  OrganizationDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<OrganizationDto>> getAll() async {
    final response = await _dio.get<Map<String, dynamic>>('/organizations');
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(OrganizationDto.fromJson)
        .toList();
  }

  Future<OrganizationDto> getById(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId',
    );
    return OrganizationDto.fromJson(response.data!);
  }

  Future<JoinResultDto> join(String inviteCode) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/join/$inviteCode',
    );
    return JoinResultDto.fromJson(response.data!);
  }

  Future<List<MemberDto>> getMembers(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/members',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items.cast<Map<String, dynamic>>().map(MemberDto.fromJson).toList();
  }

  Future<List<WorkLocationDto>> getWorkLocations(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/locations',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(WorkLocationDto.fromJson)
        .toList();
  }

  Future<void> removeMember(String orgId, String memberUserId) async {
    await _dio.delete<void>('/organizations/$orgId/members/$memberUserId');
  }

  Future<PaginatedShiftsDto> getShifts(
    String orgId, {
    String? userId,
    String? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) async {
    final queryParameters = <String, dynamic>{'limit': limit, 'offset': offset};
    if (userId != null) queryParameters['user_id'] = userId;
    if (status != null) queryParameters['status'] = status;
    if (dateFrom != null) {
      queryParameters['date_from'] = dateFrom.toIso8601String();
    }
    if (dateTo != null) {
      queryParameters['date_to'] = dateTo.toIso8601String();
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/shifts',
      queryParameters: queryParameters,
    );
    return PaginatedShiftsDto.fromJson(response.data!);
  }

  Future<ShiftDto> getShiftDetail(String orgId, String shiftId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/shifts/$shiftId',
    );
    return ShiftDto.fromJson(response.data!);
  }

  /// Статистика организации. Окно — либо [period], либо [dateFrom]/[dateTo]
  /// (взаимоисключение обеспечивает вызывающая сторона, см. кубиты).
  Future<OrgStatsDto> getStats(
    String orgId, {
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
      '/organizations/$orgId/stats',
      queryParameters: queryParameters,
    );
    return OrgStatsDto.fromJson(response.data!);
  }
}
