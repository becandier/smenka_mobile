import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';

class OrganizationDataSource {
  OrganizationDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<OrganizationDto> create({required String name}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations',
      data: {'name': name},
    );
    return OrganizationDto.fromJson(response.data!);
  }

  Future<List<OrganizationDto>> getAll() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations',
    );
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

  Future<OrganizationDto> update(String orgId, {required String name}) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId',
      data: {'name': name},
    );
    return OrganizationDto.fromJson(response.data!);
  }

  Future<void> delete(String orgId) async {
    await _dio.delete<void>('/organizations/$orgId');
  }

  Future<String> rotateInvite(String orgId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/$orgId/rotate-invite',
    );
    return response.data!['invite_code'] as String;
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
    return items
        .cast<Map<String, dynamic>>()
        .map(MemberDto.fromJson)
        .toList();
  }

  Future<void> removeMember(String orgId, String memberUserId) async {
    await _dio.delete<void>(
      '/organizations/$orgId/members/$memberUserId',
    );
  }

  Future<OrgSettingsDto> getSettings(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/settings',
    );
    return OrgSettingsDto.fromJson(response.data!);
  }

  Future<OrgSettingsDto> updateSettings(
    String orgId, {
    bool? geoCheckEnabled,
    int? autoFinishHours,
    int? maxPauseMinutes,
    int? maxPausesPerShift,
  }) async {
    final data = <String, dynamic>{};
    if (geoCheckEnabled != null) data['geo_check_enabled'] = geoCheckEnabled;
    if (autoFinishHours != null) data['auto_finish_hours'] = autoFinishHours;
    if (maxPauseMinutes != null) data['max_pause_minutes'] = maxPauseMinutes;
    if (maxPausesPerShift != null) {
      data['max_pauses_per_shift'] = maxPausesPerShift;
    }

    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/settings',
      data: data,
    );
    return OrgSettingsDto.fromJson(response.data!);
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
    final queryParameters = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
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

  Future<List<OrganizationDto>> getAllOrganizations() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/all',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(OrganizationDto.fromJson)
        .toList();
  }

  Future<MemberDto> updateMemberRole(
    String orgId,
    String userId, {
    required String role,
  }) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/members/$userId/role',
      data: {'role': role},
    );
    return MemberDto.fromJson(response.data!);
  }

  Future<OrgStatsDto> getStats(String orgId, {required String period}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/stats',
      queryParameters: {'period': period},
    );
    return OrgStatsDto.fromJson(response.data!);
  }
}
