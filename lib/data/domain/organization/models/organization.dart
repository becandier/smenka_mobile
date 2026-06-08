import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/organization/models/member.dart';
import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';

part 'organization.freezed.dart';

enum OrgMembershipRole { owner, admin, employee }

@freezed
abstract class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String ownerId,
    required String inviteCode,
    required bool isDeleted,
    required DateTime createdAt,
    @Default(false) bool geoCheckEnabled,
    OrgMembershipRole? myRole,
    OrganizationRole? myCustomRole,
  }) = _Organization;
}

extension OrgMembershipRoleX on OrgMembershipRole? {
  bool get isOwner => this == OrgMembershipRole.owner;

  MemberRole? get asSystemRole => switch (this) {
        OrgMembershipRole.admin => MemberRole.admin,
        OrgMembershipRole.employee => MemberRole.employee,
        OrgMembershipRole.owner => null,
        null => null,
      };
}
