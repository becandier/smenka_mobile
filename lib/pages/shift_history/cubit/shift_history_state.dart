import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_history_state.freezed.dart';

@freezed
abstract class ShiftHistoryState with _$ShiftHistoryState {
  const factory ShiftHistoryState({
    @Default(PaginatedSectionData<Shift>()) PaginatedSectionData<Shift> shifts,

    /// Фильтр по статусу (null = все)
    ShiftStatus? filterStatus,

    /// Фильтр по дате — от
    DateTime? filterDateFrom,

    /// Фильтр по дате — до
    DateTime? filterDateTo,
  }) = _ShiftHistoryState;
  const ShiftHistoryState._();

  bool get hasFilters =>
      filterStatus != null || filterDateFrom != null || filterDateTo != null;
}
