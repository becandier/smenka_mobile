import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/mappers/_mappers.dart';

OrgMembershipRole? _parseMyRole(String? value) => switch (value) {
  'owner' => OrgMembershipRole.owner,
  'admin' => OrgMembershipRole.admin,
  'employee' => OrgMembershipRole.employee,
  _ => null,
};

extension OrganizationMapper on OrganizationDto {
  Organization toDomain() {
    return Organization(
      id: id,
      name: name,
      ownerId: ownerId,
      inviteCode: inviteCode,
      isDeleted: isDeleted,
      createdAt: createdAt,
      geoCheckEnabled: geoCheckEnabled,
      requireWorkLocation: requireWorkLocation,
      myRole: _parseMyRole(myRole),
      myCustomRole: myCustomRole?.toDomain(),
    );
  }
}
