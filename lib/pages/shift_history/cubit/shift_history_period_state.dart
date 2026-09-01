import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';

part 'shift_history_period_state.freezed.dart';

@freezed
abstract class ShiftHistoryPeriodState with _$ShiftHistoryPeriodState {
  const factory ShiftHistoryPeriodState({
    /// Активный пресет; `null` — активен произвольный диапазон
    /// ([dateFrom]/[dateTo]). Ровно один источник окна одновременно.
    /// Только `week`/`month` приходят от UI этого экрана — `day` этому
    /// пресет-селектору не показывается (mobile.md, «A»).
    @Default(PeriodPreset.week) PeriodPreset? selectedPreset,

    /// Вычисленное клиентом окно (UTC), которое уходит одинаковым во все
    /// три запроса экрана: `GET /shifts`, `GET /shifts/stats`,
    /// `GET /organizations/{org_id}/my-earnings`.
    DateTime? dateFrom,
    DateTime? dateTo,
  }) = _ShiftHistoryPeriodState;
  const ShiftHistoryPeriodState._();

  bool get isCustomRange => selectedPreset == null;
}
