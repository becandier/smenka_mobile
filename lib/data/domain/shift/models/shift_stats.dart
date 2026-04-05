import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_stats.freezed.dart';

@freezed
abstract class ShiftStats with _$ShiftStats {
  const factory ShiftStats({
    required String period,
    required int totalWorkedSeconds,
    required int shiftCount,
    required int averageShiftSeconds,
  }) = _ShiftStats;
}
