import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/organization_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/organization/mappers/_mappers.dart';
import 'package:smenka_mobile/data/infrastructure/shift/mappers/_mappers.dart';

class OrganizationRepositoryImpl
    with TaskHandler
    implements OrganizationRepository {
  OrganizationRepositoryImpl({required OrganizationDataSource dataSource})
      : _dataSource = dataSource;

  final OrganizationDataSource _dataSource;

  @override
  Future<Task<Organization>> create({required String name}) {
    return execute(() async {
      final dto = await _dataSource.create(name: name);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<List<Organization>>> getAll() {
    return execute(() async {
      final dtos = await _dataSource.getAll();
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  @override
  Future<Task<Organization>> getById(String orgId) {
    return execute(() async {
      final dto = await _dataSource.getById(orgId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Organization>> update(String orgId, {required String name}) {
    return execute(() async {
      final dto = await _dataSource.update(orgId, name: name);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> delete(String orgId) {
    return executeVoid(() => _dataSource.delete(orgId));
  }

  @override
  Future<Task<String>> rotateInvite(String orgId) {
    return execute(() => _dataSource.rotateInvite(orgId));
  }

  @override
  Future<Task<JoinResult>> join(String inviteCode) {
    return execute(() async {
      final dto = await _dataSource.join(inviteCode);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<List<Member>>> getMembers(String orgId) {
    return execute(() async {
      final dtos = await _dataSource.getMembers(orgId);
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  @override
  Future<Task<void>> removeMember(String orgId, String memberUserId) {
    return executeVoid(() => _dataSource.removeMember(orgId, memberUserId));
  }

  @override
  Future<Task<OrgSettings>> getSettings(String orgId) {
    return execute(() async {
      final dto = await _dataSource.getSettings(orgId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<OrgSettings>> updateSettings(
    String orgId, {
    bool? geoCheckEnabled,
    int? autoFinishHours,
    int? maxPauseMinutes,
    int? maxPausesPerShift,
  }) {
    return execute(() async {
      final dto = await _dataSource.updateSettings(
        orgId,
        geoCheckEnabled: geoCheckEnabled,
        autoFinishHours: autoFinishHours,
        maxPauseMinutes: maxPauseMinutes,
        maxPausesPerShift: maxPausesPerShift,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<DefaultPaginator<Shift>>> getShifts(
    String orgId, {
    String? userId,
    ShiftStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) {
    return execute(() async {
      final dto = await _dataSource.getShifts(
        orgId,
        userId: userId,
        status: status?.name,
        dateFrom: dateFrom,
        dateTo: dateTo,
        limit: limit,
        offset: offset,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<OrgStats>> getStats(String orgId, {required String period}) {
    return execute(() async {
      final dto = await _dataSource.getStats(orgId, period: period);
      return dto.toDomain();
    });
  }
}
