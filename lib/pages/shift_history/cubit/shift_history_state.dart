import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_history_state.freezed.dart';

@freezed
abstract class ShiftHistoryState with _$ShiftHistoryState {
  const factory ShiftHistoryState({
    @Default(PaginatedSectionData<Shift>()) PaginatedSectionData<Shift> shifts,

    /// Фильтр по статусу (null = все). Единственный «фильтр» в узком
    /// смысле, что остался на экране — дата больше не фильтр поверх
    /// периода, а сам период (mobile.md, «A. Единый выбор периода»).
    ShiftStatus? filterStatus,

    /// Окно (`shift_history_earnings/mobile.md`), приходит извне от
    /// `ShiftHistoryPeriodCubit` через `setPeriod` — те же границы, что
    /// уходят в `GET /shifts/stats` и `GET /organizations/{org_id}/
    /// my-earnings`. Больше не редактируется отдельным чипом в строке
    /// фильтров списка (убран вместе с ним).
    DateTime? dateFrom,
    DateTime? dateTo,

    /// Контекст (`shift_history_scope`), приходит извне от
    /// `ShiftHistoryContextCubit` через `setContext` — `null` = без
    /// ограничения (не передаётся на бэк). Ортогонален [filterStatus]/
    /// [dateFrom]/[dateTo]: сбрасывается только сменой контекста, не
    /// затрагивается `resetFilters`.
    ShiftScope? scope,
    String? organizationId,
  }) = _ShiftHistoryState;
  const ShiftHistoryState._();

  bool get hasFilters => filterStatus != null;
}
