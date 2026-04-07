import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_state.dart';

class ShiftHistoryCubit extends Cubit<ShiftHistoryState>
    with PaginationMixin<ShiftHistoryState> {
  ShiftHistoryCubit({
    required ShiftRepository shiftRepository,
  })  : _shiftRepository = shiftRepository,
        super(const ShiftHistoryState()) {
    loadShifts();
  }

  final ShiftRepository _shiftRepository;

  Future<void> loadShifts({bool isRefresh = true}) => fetchPaginated<Shift>(
        getSection: (s) => s.shifts,
        updateState: (s, section) => s.copyWith(shifts: section),
        fetch: (page, perPage) => _shiftRepository.getShifts(
          status: state.filterStatus,
          dateFrom: state.filterDateFrom,
          dateTo: state.filterDateTo,
          limit: perPage,
          offset: (page - 1) * perPage,
        ),
        isRefresh: isRefresh,
      );

  void setStatusFilter(ShiftStatus? status) {
    emit(state.copyWith(filterStatus: status));
    loadShifts();
  }

  void setDateFrom(DateTime? date) {
    emit(state.copyWith(filterDateFrom: date));
    loadShifts();
  }

  void setDateTo(DateTime? date) {
    emit(state.copyWith(filterDateTo: date));
    loadShifts();
  }

  void resetFilters() {
    emit(
      state.copyWith(
        filterStatus: null,
        filterDateFrom: null,
        filterDateTo: null,
      ),
    );
    loadShifts();
  }
}
