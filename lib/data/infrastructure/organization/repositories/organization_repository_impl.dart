import 'package:rxdart/subjects.dart';
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

  final BehaviorSubject<List<Organization>> _myOrganizations =
      BehaviorSubject<List<Organization>>();

  @override
  Stream<List<Organization>> watchMyOrganizations() => _myOrganizations.stream;

  @override
  Future<void> fetchMyOrganizations() async {
    final dtos = await _dataSource.getAll();
    final orgs = dtos.map((d) => d.toDomain()).toList();
    _myOrganizations.add(orgs);
  }

  @override
  void clearCache() {
    _myOrganizations.add([]);
  }

  @override
  Future<Task<List<Organization>>> getAll() {
    return execute(() async {
      final dtos = await _dataSource.getAll();
      final orgs = dtos.map((d) => d.toDomain()).toList();
      _myOrganizations.add(orgs);
      return orgs;
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
  Future<Task<JoinResult>> join(String inviteCode) {
    return execute(() async {
      final dto = await _dataSource.join(inviteCode);
      final result = dto.toDomain();
      await fetchMyOrganizations();
      return result;
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
  Future<Task<Shift>> getShiftDetail(String orgId, String shiftId) {
    return execute(() async {
      final dto = await _dataSource.getShiftDetail(orgId, shiftId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<OrgStats>> getStats(
    String orgId, {
    String? period,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) {
    return execute(() async {
      final dto = await _dataSource.getStats(
        orgId,
        period: period,
        dateFrom: dateFrom,
        dateTo: dateTo,
      );
      return dto.toDomain();
    });
  }
}
