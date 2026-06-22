import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/pages/my_penalties/cubit/my_penalties_state.dart';

/// Свои штрафы за период (employee, `my-penalties`, только чтение).
class MyPenaltiesCubit extends Cubit<MyPenaltiesState>
    with PaginationMixin<MyPenaltiesState> {
  MyPenaltiesCubit({
    required String orgId,
    required PenaltyRepository penaltyRepository,
  }) : _orgId = orgId,
       _penaltyRepository = penaltyRepository,
       super(const MyPenaltiesState()) {
    loadPenalties();
  }

  final String _orgId;
  final PenaltyRepository _penaltyRepository;

  ({DateTime? from, DateTime? to}) get _window {
    final preset = state.preset;
    if (preset != null) {
      final bounds = preset.boundsUtc(DateTime.now());
      return (from: bounds.fromUtc, to: bounds.toUtc);
    }
    return (from: state.customFrom, to: state.customTo);
  }

  Future<void> loadPenalties({bool isRefresh = true}) {
    final window = _window;
    return fetchPaginated<MyPenalty>(
      getSection: (s) => s.penalties,
      updateState: (s, section) => s.copyWith(penalties: section),
      fetch: (page, perPage) => _penaltyRepository.getMyPenalties(
        _orgId,
        dateFrom: window.from,
        dateTo: window.to,
        limit: perPage,
        offset: (page - 1) * perPage,
      ),
      isRefresh: isRefresh,
    );
  }

  void loadMore() => loadPenalties(isRefresh: false);

  void setPreset(PeriodPreset preset) {
    if (preset == state.preset) return;
    emit(state.copyWith(preset: preset, customFrom: null, customTo: null));
    loadPenalties();
  }

  /// Произвольное окно (UTC-границы). Обе `null` — возврат к месяцу.
  void setCustomRange(DateTime? dateFrom, DateTime? dateTo) {
    if (dateFrom == null && dateTo == null) {
      if (state.isCustomRange) setPreset(PeriodPreset.month);
      return;
    }
    emit(state.copyWith(preset: null, customFrom: dateFrom, customTo: dateTo));
    loadPenalties();
  }
}
