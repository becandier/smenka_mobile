import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/datasource/organization_role_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/mappers/_mappers.dart';

class OrganizationRoleRepositoryImpl
    with TaskHandler
    implements OrganizationRoleRepository {
  OrganizationRoleRepositoryImpl({
    required OrganizationRoleDataSource dataSource,
  }) : _dataSource = dataSource;

  final OrganizationRoleDataSource _dataSource;

  @override
  Future<Task<List<OrganizationRole>>> getRoles(String orgId) {
    return execute(() async {
      final dtos = await _dataSource.getRoles(orgId);
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  @override
  Future<Task<OrganizationRole>> createRole(
    String orgId, {
    required String name,
  }) {
    return execute(() async {
      final dto = await _dataSource.createRole(orgId, name: name);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<OrganizationRole>> updateRole(
    String orgId,
    String roleId, {
    required String name,
  }) {
    return execute(() async {
      final dto = await _dataSource.updateRole(orgId, roleId, name: name);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> deleteRole(String orgId, String roleId) {
    return executeVoid(() => _dataSource.deleteRole(orgId, roleId));
  }

  @override
  Future<Task<void>> assignRoleToMember(
    String orgId,
    String userId, {
    required String? roleId,
  }) {
    return executeVoid(
      () => _dataSource.assignRoleToMember(orgId, userId, roleId: roleId),
    );
  }
}
