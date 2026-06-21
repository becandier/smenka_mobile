import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

abstract class OrganizationRepository {
  Future<Task<List<Organization>>> getAll();
  Future<Task<Organization>> getById(String orgId);
  Future<Task<JoinResult>> join(String inviteCode);
  Future<Task<List<Member>>> getMembers(String orgId);

  /// Список рабочих точек организации (для выбора точки при старте смены).
  Future<Task<List<WorkLocation>>> getWorkLocations(String orgId);

  /// Покинуть организацию — участник удаляет собственное членство (self-leave).
  Future<Task<void>> removeMember(String orgId, String memberUserId);

  Future<Task<DefaultPaginator<Shift>>> getShifts(
    String orgId, {
    String? userId,
    ShiftStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  });

  /// Деталь конкретной (в т.ч. чужой) орг-смены для owner/admin.
  Future<Task<Shift>> getShiftDetail(String orgId, String shiftId);

  /// Окно статистики: ровно один источник — либо [period],
  /// либо [dateFrom]/[dateTo] (UTC).
  Future<Task<OrgStats>> getStats(
    String orgId, {
    String? period,
    DateTime? dateFrom,
    DateTime? dateTo,
  });

  Stream<List<Organization>> watchMyOrganizations();
  Future<void> fetchMyOrganizations();
  void clearCache();
}
