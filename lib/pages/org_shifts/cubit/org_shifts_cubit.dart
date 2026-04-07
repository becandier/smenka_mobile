import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/pages/org_shifts/cubit/org_shifts_state.dart';

class OrgShiftsCubit extends Cubit<OrgShiftsState>
    with PaginationMixin<OrgShiftsState> {
  OrgShiftsCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
  })  : _orgId = orgId,
        _organizationRepository = organizationRepository,
        super(const OrgShiftsState()) {
    loadShifts();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;

  Future<void> loadShifts({bool isRefresh = true}) => fetchPaginated<Shift>(
        getSection: (s) => s.shifts,
        updateState: (s, section) => s.copyWith(shifts: section),
        fetch: (page, perPage) => _organizationRepository.getShifts(
          _orgId,
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
