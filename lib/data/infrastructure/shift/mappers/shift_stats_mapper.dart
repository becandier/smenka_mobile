import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';

extension ShiftStatsMapper on ShiftStatsDto {
  ShiftStats toDomain() {
    return ShiftStats(
      period: period,
      totalWorkedSeconds: totalWorkedSeconds,
      shiftCount: shiftCount,
      averageShiftSeconds: averageShiftSeconds,
      rangeFrom: rangeFrom,
      rangeTo: rangeTo,
    );
  }
}
