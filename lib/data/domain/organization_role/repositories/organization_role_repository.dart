import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';

abstract class OrganizationRoleRepository {
  Future<Task<List<OrganizationRole>>> getRoles(String orgId);

  Future<Task<OrganizationRole>> createRole(
    String orgId, {
    required String name,
  });

  Future<Task<OrganizationRole>> updateRole(
    String orgId,
    String roleId, {
    required String name,
  });

  Future<Task<void>> deleteRole(String orgId, String roleId);

  Future<Task<void>> assignRoleToMember(
    String orgId,
    String userId, {
    required String? roleId,
  });
}
