import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/shift/_shift.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/shift_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/shift/mappers/_mappers.dart';

class ShiftRepositoryImpl with TaskHandler implements ShiftRepository {
  ShiftRepositoryImpl({required ShiftDataSource dataSource})
      : _dataSource = dataSource;

  final ShiftDataSource _dataSource;

  @override
  Future<Task<DefaultPaginator<Shift>>> getShifts({
    ShiftStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) {
    return execute(() async {
      final dto = await _dataSource.getShifts(
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
  Future<Task<ShiftStats>> getStats({required String period}) {
    return execute(() async {
      final dto = await _dataSource.getStats(period: period);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Shift>> startShift({
    String? organizationId,
    double? latitude,
    double? longitude,
  }) {
    return execute(() async {
      final dto = await _dataSource.startShift(
        organizationId: organizationId,
        latitude: latitude,
        longitude: longitude,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Shift>> pauseShift(String shiftId) {
    return execute(() async {
      final dto = await _dataSource.pauseShift(shiftId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Shift>> resumeShift(String shiftId) {
    return execute(() async {
      final dto = await _dataSource.resumeShift(shiftId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Shift>> finishShift(String shiftId) {
    return execute(() async {
      final dto = await _dataSource.finishShift(shiftId);
      return dto.toDomain();
    });
  }
}
