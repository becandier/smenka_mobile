import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_stats_state.freezed.dart';

enum StatsPeriod { day, week, month }

@freezed
abstract class ShiftStatsState with _$ShiftStatsState {
  const factory ShiftStatsState({
    @Default(SectionData<ShiftStats>()) SectionData<ShiftStats> stats,

    /// Пресет окна; null — активен произвольный диапазон
    /// ([customFrom]/[customTo]). Ровно один источник окна одновременно.
    @Default(StatsPeriod.day) StatsPeriod? selectedPeriod,

    /// Границы произвольного окна (UTC); заданы только при
    /// `selectedPeriod == null`, хотя бы одна из границ непуста.
    DateTime? customFrom,
    DateTime? customTo,
  }) = _ShiftStatsState;
  const ShiftStatsState._();

  bool get isCustomRange => selectedPeriod == null;
}
