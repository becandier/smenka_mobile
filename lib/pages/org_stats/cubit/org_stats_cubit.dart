import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/org_stats/cubit/org_stats_state.dart';

class OrgStatsCubit extends Cubit<OrgStatsState> {
  OrgStatsCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
  }) : _orgId = orgId,
       _organizationRepository = organizationRepository,
       super(const OrgStatsState()) {
    loadStats();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;

  /// Монотонный токен запроса: ответы устаревших запросов игнорируются.
  int _requestId = 0;

  /// Перезапрос статистики. Ровно один источник окна:
  /// пресет [OrgStatsState.period] ЛИБО диапазон `customFrom`/`customTo`.
  Future<void> loadStats() async {
    final requestId = ++_requestId;
    emit(state.copyWith(stats: state.stats.toLoading()));

    final isCustom = state.isCustomRange;
    final result = await _organizationRepository.getStats(
      _orgId,
      period: isCustom ? null : state.period,
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

  void setPeriod(String period) {
    if (period == state.period) return;
    emit(state.copyWith(period: period, customFrom: null, customTo: null));
    loadStats();
  }

  /// Применить произвольное окно (UTC-границы, хотя бы одна непуста).
  /// Обе `null` — сброс кастомного окна: возврат к дефолтному пресету.
  void setCustomRange(DateTime? dateFrom, DateTime? dateTo) {
    if (dateFrom == null && dateTo == null) {
      if (state.isCustomRange) setPeriod('week');
      return;
    }
    emit(state.copyWith(period: null, customFrom: dateFrom, customTo: dateTo));
    loadStats();
  }
}
