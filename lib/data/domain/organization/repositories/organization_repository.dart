import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

abstract class OrganizationRepository {
  Future<Task<Organization>> create({required String name});
  Future<Task<List<Organization>>> getAll();
  Future<Task<Organization>> getById(String orgId);
  Future<Task<Organization>> update(String orgId, {required String name});
  Future<Task<void>> delete(String orgId);
  Future<Task<String>> rotateInvite(String orgId);
  Future<Task<JoinResult>> join(String inviteCode);
  Future<Task<List<Member>>> getMembers(String orgId);
  Future<Task<void>> removeMember(String orgId, String memberUserId);
  Future<Task<OrgSettings>> getSettings(String orgId);

  Future<Task<OrgSettings>> updateSettings(
    String orgId, {
    bool? geoCheckEnabled,
    int? autoFinishHours,
    int? maxPauseMinutes,
    int? maxPausesPerShift,
  });

  Future<Task<DefaultPaginator<Shift>>> getShifts(
    String orgId, {
    String? userId,
    ShiftStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  });

  Future<Task<OrgStats>> getStats(String orgId, {required String period});

  Future<Task<List<Organization>>> getAllOrganizations();
  Future<Task<Member>> updateMemberRole(
    String orgId,
    String userId, {
    required MemberRole role,
  });
}
