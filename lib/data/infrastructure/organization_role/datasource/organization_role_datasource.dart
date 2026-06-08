import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/datasource/dto/_dto.dart';

class OrganizationRoleDataSource {
  OrganizationRoleDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<List<OrganizationRoleDto>> getRoles(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/roles',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(OrganizationRoleDto.fromJson)
        .toList();
  }

  Future<OrganizationRoleDto> createRole(
    String orgId, {
    required String name,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/$orgId/roles',
      data: {'name': name},
    );
    return OrganizationRoleDto.fromJson(response.data!);
  }

  Future<OrganizationRoleDto> updateRole(
    String orgId,
    String roleId, {
    required String name,
  }) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/roles/$roleId',
      data: {'name': name},
    );
    return OrganizationRoleDto.fromJson(response.data!);
  }

  Future<void> deleteRole(String orgId, String roleId) async {
    await _dio.delete<void>('/organizations/$orgId/roles/$roleId');
  }

  Future<void> assignRoleToMember(
    String orgId,
    String userId, {
    required String? roleId,
  }) async {
    await _dio.patch<void>(
      '/organizations/$orgId/members/$userId/custom-role',
      data: {'role_id': roleId},
    );
  }
}
