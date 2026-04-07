import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_state.dart';

class ShiftStatsCubit extends Cubit<ShiftStatsState> {
  ShiftStatsCubit({
    required ShiftRepository shiftRepository,
  })  : _shiftRepository = shiftRepository,
        super(const ShiftStatsState()) {
    loadStats();
  }

  final ShiftRepository _shiftRepository;

  Future<void> loadStats() async {
    emit(state.copyWith(stats: state.stats.toLoading()));

    final result = await _shiftRepository.getStats(
      period: state.selectedPeriod.name,
    );

    result.fold(
      onSuccess: (stats) {
        emit(state.copyWith(stats: state.stats.toSuccess(stats)));
      },
      onFailure: (error) {
        emit(state.copyWith(stats: state.stats.toError(error.message)));
      },
    );
  }

  void changePeriod(StatsPeriod period) {
    if (period == state.selectedPeriod) return;
    emit(state.copyWith(selectedPeriod: period));
    loadStats();
  }
}
