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
    ShiftScope? scope,
    String? organizationId,
    int limit = 20,
    int offset = 0,
  }) {
    return execute(() async {
      final dto = await _dataSource.getShifts(
        status: status?.name,
        dateFrom: dateFrom,
        dateTo: dateTo,
        scope: scope?.value,
        organizationId: organizationId,
        limit: limit,
        offset: offset,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Shift>> getShiftById(String shiftId) {
    return execute(() async {
      final dto = await _dataSource.getShiftById(shiftId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<ShiftStats>> getStats({
    DateTime? dateFrom,
    DateTime? dateTo,
    ShiftScope? scope,
    String? organizationId,
  }) {
    return execute(() async {
      final dto = await _dataSource.getStats(
        dateFrom: dateFrom,
        dateTo: dateTo,
        scope: scope?.value,
        organizationId: organizationId,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<Shift>> startShift({
    String? organizationId,
    double? latitude,
    double? longitude,
    String? workLocationId,
    String? workScheduleId,
    String? geoFallbackPhotoId,
    String? geoFallbackReason,
  }) {
    return execute(() async {
      final dto = await _dataSource.startShift(
        organizationId: organizationId,
        latitude: latitude,
        longitude: longitude,
        workLocationId: workLocationId,
        workScheduleId: workScheduleId,
        geoFallbackPhotoId: geoFallbackPhotoId,
        geoFallbackReason: geoFallbackReason,
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

  @override
  Future<Task<ShiftOvertimeRequest>> requestOvertime(
    String shiftId, {
    required int minutes,
    required String comment,
  }) {
    return execute(() async {
      final dto = await _dataSource.requestOvertime(
        shiftId,
        minutes: minutes,
        comment: comment,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> cancelOvertimeRequest(String shiftId) {
    return executeVoid(() => _dataSource.cancelOvertimeRequest(shiftId));
  }
}
