import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_state.dart';

class ShiftStatsCubit extends Cubit<ShiftStatsState> {
  ShiftStatsCubit({required ShiftRepository shiftRepository})
    : _shiftRepository = shiftRepository,
      super(const ShiftStatsState());
  // Не грузит сразу: контекст и окно периода приходят извне через
  // `setContext`/`setPeriod`, см. `ShiftHistoryCubit` (тот же принцип, тот
  // же источник координации — `ShiftHistoryPage`).

  final ShiftRepository _shiftRepository;

  /// Контекст применён хотя бы раз — гейт первого запроса (см.
  /// `ShiftHistoryCubit._contextApplied`, тот же приём).
  bool _contextApplied = false;

  /// Тот же приём для окна периода.
  bool _periodApplied = false;

  /// Монотонный токен запроса: ответы устаревших запросов (пользователь
  /// успел сменить окно) игнорируются, чтобы не перетереть актуальные данные.
  int _requestId = 0;

  /// Контекст (`shift_history_scope`) пришёл извне — см.
  /// `ShiftHistoryCubit.setContext`. Независим от него: оба кубита экрана
  /// получают контекст из одного источника (`ShiftHistoryPage`), но друг о
  /// друге не знают.
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
  /// `ShiftHistoryPeriodCubit` — единый источник периода на весь экран,
  /// те же границы, что уходят в `GET /shifts`.
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
    loadStats();
  }

  /// Перезапрос статистики за окно, заданное извне (`dateFrom`/`dateTo`).
  /// Серверный параметр `period` не передаётся.
  Future<void> loadStats() async {
    final requestId = ++_requestId;
    emit(state.copyWith(stats: state.stats.toLoading()));

    final result = await _shiftRepository.getStats(
      dateFrom: state.dateFrom,
      dateTo: state.dateTo,
      scope: state.scope,
      organizationId: state.organizationId,
    );
    if (requestId != _requestId) return;

    result.fold(
      onSuccess: (stats) {
        emit(state.copyWith(stats: state.stats.toSuccess(stats)));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            stats: state.stats.toError(error.message, code: error.code),
          ),
        );
      },
    );
  }
}
