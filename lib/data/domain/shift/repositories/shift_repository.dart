import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

abstract class ShiftRepository {
  Future<Task<PaginatedShifts>> getShifts({
    ShiftStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  });

  Future<Task<ShiftStats>> getStats({required String period});

  Future<Task<Shift>> startShift({
    String? organizationId,
    double? latitude,
    double? longitude,
  });

  Future<Task<Shift>> pauseShift(String shiftId);
  Future<Task<Shift>> resumeShift(String shiftId);
  Future<Task<Shift>> finishShift(String shiftId);
}
