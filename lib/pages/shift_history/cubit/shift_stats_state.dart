import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_stats_state.freezed.dart';

enum StatsPeriod { day, week, month }

@freezed
abstract class ShiftStatsState with _$ShiftStatsState {
  const factory ShiftStatsState({
    @Default(SectionData<ShiftStats>()) SectionData<ShiftStats> stats,
    @Default(StatsPeriod.day) StatsPeriod selectedPeriod,
  }) = _ShiftStatsState;
}
