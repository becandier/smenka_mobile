import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_stats.freezed.dart';

@freezed
abstract class ShiftStats with _$ShiftStats {
  const factory ShiftStats({
    required int totalWorkedSeconds,
    required int shiftCount,
    required int averageShiftSeconds,

    /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
    String? period,

    /// Фактически применённое окно статистики (UTC).
    DateTime? rangeFrom,
    DateTime? rangeTo,
  }) = _ShiftStats;
}
