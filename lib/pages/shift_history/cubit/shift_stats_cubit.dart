import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_state.dart';

class ShiftStatsCubit extends Cubit<ShiftStatsState> {
  ShiftStatsCubit({required ShiftRepository shiftRepository})
    : _shiftRepository = shiftRepository,
      super(const ShiftStatsState()) {
    loadStats();
  }

  final ShiftRepository _shiftRepository;

  /// Монотонный токен запроса: ответы устаревших запросов (пользователь
  /// успел сменить окно) игнорируются, чтобы не перетереть актуальные данные.
  int _requestId = 0;

  /// Перезапрос статистики. Ровно один источник окна: пресет
  /// `selectedPeriod` ЛИБО диапазон `customFrom`/`customTo` (UTC).
  Future<void> loadStats() async {
    final requestId = ++_requestId;
    emit(state.copyWith(stats: state.stats.toLoading()));

    final isCustom = state.isCustomRange;
    final result = await _shiftRepository.getStats(
      period: isCustom ? null : state.selectedPeriod?.name,
      dateFrom: isCustom ? state.customFrom : null,
      dateTo: isCustom ? state.customTo : null,
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

  void changePeriod(StatsPeriod period) {
    if (period == state.selectedPeriod) return;
    emit(
      state.copyWith(selectedPeriod: period, customFrom: null, customTo: null),
    );
    loadStats();
  }

  /// Применить произвольное окно (UTC-границы, хотя бы одна непуста).
  /// Обе `null` — сброс кастомного окна: возврат к дефолтному пресету.
  void setCustomRange(DateTime? dateFrom, DateTime? dateTo) {
    if (dateFrom == null && dateTo == null) {
      if (state.isCustomRange) changePeriod(StatsPeriod.day);
      return;
    }
    emit(
      state.copyWith(
        selectedPeriod: null,
        customFrom: dateFrom,
        customTo: dateTo,
      ),
    );
    loadStats();
  }
}
