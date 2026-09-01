import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_state.dart';

class ShiftHistoryCubit extends Cubit<ShiftHistoryState>
    with PaginationMixin<ShiftHistoryState> {
  ShiftHistoryCubit({required ShiftRepository shiftRepository})
    : _shiftRepository = shiftRepository,
      super(const ShiftHistoryState());
  // Не грузит сразу: контекст (`scope`/`organizationId`) приходит извне от
  // `ShiftHistoryContextCubit` через `setContext` — первый вызов запускает
  // первичную загрузку (shift_history_scope/mobile.md, «Загрузка»).

  final ShiftRepository _shiftRepository;

  /// Контекст применён хотя бы раз — гейт первого запроса. Отдельно от
  /// сравнения полей состояния: дефолтные `scope`/`organizationId` в
  /// состоянии (`null`/`null`) совпадают с валидным «нет ограничения»
  /// контекстом, поэтому только сравнения состояния недостаточно, чтобы
  /// отличить «контекст ещё не приходил» от «пришёл и совпал с дефолтом».
  bool _contextApplied = false;

  Future<void> loadShifts({bool isRefresh = true}) => fetchPaginated<Shift>(
    getSection: (s) => s.shifts,
    updateState: (s, section) => s.copyWith(shifts: section),
    fetch: (page, perPage) => _shiftRepository.getShifts(
      status: state.filterStatus,
      dateFrom: state.filterDateFrom,
      dateTo: state.filterDateTo,
      scope: state.scope,
      organizationId: state.organizationId,
      limit: perPage,
      offset: (page - 1) * perPage,
    ),
    isRefresh: isRefresh,
  );

  /// Контекст (`shift_history_scope`) пришёл извне — см. `ShiftHistoryPage`,
  /// слушает `ShiftHistoryContextCubit` и прокидывает сюда и в
  /// `ShiftStatsCubit` независимо (инвариант «кубиты не зависят друг от
  /// друга» сохраняется — они не знают друг о друге и об источнике
  /// контекста). Сбрасывает пагинацию, фильтры статуса/дат сохраняются.
  void setContext(ShiftScope? scope, String? organizationId) {
    final unchanged =
        _contextApplied &&
        state.scope == scope &&
        state.organizationId == organizationId;
    if (unchanged) return;
    _contextApplied = true;
    emit(state.copyWith(scope: scope, organizationId: organizationId));
    loadShifts();
  }

  void setStatusFilter(ShiftStatus? status) {
    emit(state.copyWith(filterStatus: status));
    loadShifts();
  }

  /// Применить диапазон дат (UTC-границы, обе включительно по `started_at`).
  /// Обе `null` — сброс диапазона. Один перезапрос с первой страницы.
  void setDateRange(DateTime? dateFrom, DateTime? dateTo) {
    emit(state.copyWith(filterDateFrom: dateFrom, filterDateTo: dateTo));
    loadShifts();
  }

  /// Сбрасывает только фильтры статуса/дат — контекст (`scope`/
  /// `organizationId`) ортогонален и не трогается (mobile.md: «"Сбросить
  /// фильтры" сбрасывает статус и даты, но не контекст»).
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
