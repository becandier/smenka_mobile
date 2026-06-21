import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

abstract class ShiftRepository {
  Future<Task<DefaultPaginator<Shift>>> getShifts({
    ShiftStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  });

  /// Окно статистики: ровно один источник — либо [period],
  /// либо [dateFrom]/[dateTo] (UTC).
  Future<Task<ShiftStats>> getStats({
    String? period,
    DateTime? dateFrom,
    DateTime? dateTo,
  });

  Future<Task<Shift>> startShift({
    String? organizationId,
    double? latitude,
    double? longitude,
    String? workLocationId,
  });

  Future<Task<Shift>> pauseShift(String shiftId);
  Future<Task<Shift>> resumeShift(String shiftId);
  Future<Task<Shift>> finishShift(String shiftId);
}
