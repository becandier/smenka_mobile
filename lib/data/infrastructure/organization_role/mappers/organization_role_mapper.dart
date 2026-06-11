import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/datasource/dto/_dto.dart';

extension OrganizationRoleMapper on OrganizationRoleDto {
  OrganizationRole toDomain() {
    return OrganizationRole(id: id, name: name, createdAt: createdAt);
  }
}
