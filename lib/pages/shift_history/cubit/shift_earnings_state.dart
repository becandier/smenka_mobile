import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_earnings_state.freezed.dart';

@freezed
abstract class ShiftEarningsState with _$ShiftEarningsState {
  const factory ShiftEarningsState({
    @Default(SectionData<MyEarnings>()) SectionData<MyEarnings> earnings,

    /// Контекст (`shift_history_scope`), приходит извне от
    /// `ShiftHistoryContextCubit` через `setContext`. Запрос уходит, только
    /// когда `scope == ShiftScope.organization` (ADR-005 п.8 — заработок
    /// вне организации не существует в принципе).
    ShiftScope? scope,
    String? organizationId,

    /// Окно (`shift_history_earnings/mobile.md`), приходит извне от
    /// `ShiftHistoryPeriodCubit` через `setPeriod` — те же границы, что
    /// уходят в `GET /shifts` и `GET /shifts/stats`.
    DateTime? dateFrom,
    DateTime? dateTo,
  }) = _ShiftEarningsState;
}
