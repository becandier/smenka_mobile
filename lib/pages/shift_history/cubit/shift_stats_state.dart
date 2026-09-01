import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_stats_state.freezed.dart';

@freezed
abstract class ShiftStatsState with _$ShiftStatsState {
  const factory ShiftStatsState({
    @Default(SectionData<ShiftStats>()) SectionData<ShiftStats> stats,

    /// Окно (`shift_history_earnings/mobile.md`), приходит извне от
    /// `ShiftHistoryPeriodCubit` через `setPeriod` — единый источник
    /// периода на экран, те же границы, что уходят в `GET /shifts` и
    /// `GET /organizations/{org_id}/my-earnings`.
    DateTime? dateFrom,
    DateTime? dateTo,

    /// Контекст (`shift_history_scope`), приходит извне от
    /// `ShiftHistoryContextCubit` через `setContext` — `null` = без
    /// ограничения (не передаётся на бэк). Считается по тому же множеству
    /// смен, что отдаёт список (`ShiftHistoryCubit`).
    ShiftScope? scope,
    String? organizationId,
  }) = _ShiftStatsState;
}
