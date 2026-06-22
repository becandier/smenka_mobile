import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/data/infrastructure/penalty/datasource/penalty_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/penalty/mappers/penalty_mapper.dart';

class PenaltyRepositoryImpl with TaskHandler implements PenaltyRepository {
  PenaltyRepositoryImpl({required PenaltyDataSource dataSource})
    : _dataSource = dataSource;

  final PenaltyDataSource _dataSource;

  @override
  Future<Task<List<PenaltyTemplate>>> getTemplates(String orgId) {
    return execute(() async {
      final dtos = await _dataSource.getTemplates(orgId);
      return dtos.map((dto) => dto.toDomain()).toList();
    });
  }

  @override
  Future<Task<DefaultPaginator<Penalty>>> getPenalties(
    String orgId, {
    String? memberId,
    String? shiftId,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) {
    return execute(() async {
      final dto = await _dataSource.getPenalties(
        orgId,
        memberId: memberId,
        shiftId: shiftId,
        dateFrom: dateFrom,
        dateTo: dateTo,
        limit: limit,
        offset: offset,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Penalty>> getPenalty(String orgId, String penaltyId) {
    return execute(() async {
      final dto = await _dataSource.getPenalty(orgId, penaltyId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Penalty>> assignPenalty(String orgId, CreatePenaltyInput input) {
    return execute(() async {
      final dto = await _dataSource.createPenalty(orgId, input);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Penalty>> editPenalty(
    String orgId,
    String penaltyId,
    UpdatePenaltyInput input,
  ) {
    return execute(() async {
      final dto = await _dataSource.updatePenalty(orgId, penaltyId, input);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> removePenalty(String orgId, String penaltyId) {
    return executeVoid(() => _dataSource.deletePenalty(orgId, penaltyId));
  }

  @override
  Future<Task<DefaultPaginator<MyPenalty>>> getMyPenalties(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) {
    return execute(() async {
      final dto = await _dataSource.getMyPenalties(
        orgId,
        dateFrom: dateFrom,
        dateTo: dateTo,
        limit: limit,
        offset: offset,
      );
      return dto.toDomain();
    });
  }
}
