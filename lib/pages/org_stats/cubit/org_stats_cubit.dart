import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/org_stats/cubit/org_stats_state.dart';

class OrgStatsCubit extends Cubit<OrgStatsState> {
  OrgStatsCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
  })  : _orgId = orgId,
        _organizationRepository = organizationRepository,
        super(const OrgStatsState()) {
    loadStats();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;

  Future<void> loadStats() async {
    emit(state.copyWith(stats: state.stats.toLoading()));
    final result =
        await _organizationRepository.getStats(_orgId, period: state.period);
    result.fold(
      onSuccess: (stats) {
        emit(state.copyWith(stats: state.stats.toSuccess(stats)));
      },
      onFailure: (error) {
        emit(state.copyWith(stats: state.stats.toError(error.message)));
      },
    );
  }

  void setPeriod(String period) {
    emit(state.copyWith(period: period));
    loadStats();
  }
}
