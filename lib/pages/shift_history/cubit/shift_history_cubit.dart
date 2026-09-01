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
  // Не грузит сразу: контекст (`scope`/`organizationId`) и окно периода
  // приходят извне — от `ShiftHistoryContextCubit` через `setContext` и от
  // `ShiftHistoryPeriodCubit` через `setPeriod` (shift_history_scope/
  // mobile.md, «Загрузка»; shift_history_earnings/mobile.md, «A»). Первая
  // загрузка запускается, только когда применены оба.

  final ShiftRepository _shiftRepository;

  /// Контекст применён хотя бы раз — гейт первого запроса. Отдельно от
  /// сравнения полей состояния: дефолтные `scope`/`organizationId` в
  /// состоянии (`null`/`null`) совпадают с валидным «нет ограничения»
  /// контекстом, поэтому только сравнения состояния недостаточно, чтобы
  /// отличить «контекст ещё не приходил» от «пришёл и совпал с дефолтом».
  bool _contextApplied = false;

  /// Тот же приём для окна периода — см. [_contextApplied].
  bool _periodApplied = false;

  Future<void> loadShifts({bool isRefresh = true}) => fetchPaginated<Shift>(
    getSection: (s) => s.shifts,
    updateState: (s, section) => s.copyWith(shifts: section),
    fetch: (page, perPage) => _shiftRepository.getShifts(
      status: state.filterStatus,
      dateFrom: state.dateFrom,
      dateTo: state.dateTo,
      scope: state.scope,
      organizationId: state.organizationId,
      limit: perPage,
      offset: (page - 1) * perPage,
    ),
    isRefresh: isRefresh,
  );

  /// Контекст (`shift_history_scope`) пришёл извне — см. `ShiftHistoryPage`,
  /// слушает `ShiftHistoryContextCubit` и прокидывает сюда и в
  /// `ShiftStatsCubit`/`ShiftEarningsCubit` независимо (инвариант «кубиты
  /// не зависят друг от друга» сохраняется — они не знают друг о друге и об
  /// источнике контекста). Сбрасывает пагинацию, фильтр статуса сохраняется.
  void setContext(ShiftScope? scope, String? organizationId) {
    final unchanged =
        _contextApplied &&
        state.scope == scope &&
        state.organizationId == organizationId;
    _contextApplied = true;
    if (unchanged) return;
    emit(state.copyWith(scope: scope, organizationId: organizationId));
    _maybeLoad();
  }

  /// Окно (`shift_history_earnings/mobile.md`) пришло извне от
  /// `ShiftHistoryPeriodCubit` — единый источник периода на весь экран.
  /// Сбрасывает пагинацию, фильтр статуса сохраняется.
  void setPeriod(DateTime? dateFrom, DateTime? dateTo) {
    final unchanged =
        _periodApplied && state.dateFrom == dateFrom && state.dateTo == dateTo;
    _periodApplied = true;
    if (unchanged) return;
    emit(state.copyWith(dateFrom: dateFrom, dateTo: dateTo));
    _maybeLoad();
  }

  void _maybeLoad() {
    if (!_contextApplied || !_periodApplied) return;
    loadShifts();
  }

  void setStatusFilter(ShiftStatus? status) {
    emit(state.copyWith(filterStatus: status));
    loadShifts();
  }

  /// Сбрасывает только фильтр статуса — контекст (`scope`/
  /// `organizationId`) и окно периода (`dateFrom`/`dateTo`) ортогональны и
  /// не трогаются: период больше не «фильтр» поверх списка, а сам список
  /// показывается за период (mobile.md, «A. Единый выбор периода»).
  void resetFilters() {
    emit(state.copyWith(filterStatus: null));
    loadShifts();
  }
}
