import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/pages/org_shifts/cubit/org_shifts_state.dart';

class OrgShiftsCubit extends Cubit<OrgShiftsState>
    with PaginationMixin<OrgShiftsState> {
  OrgShiftsCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
  }) : _orgId = orgId,
       _organizationRepository = organizationRepository,
       super(const OrgShiftsState()) {
    loadShifts();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;

  String get orgId => _orgId;

  Future<void> loadShifts({bool isRefresh = true}) => fetchPaginated<Shift>(
    getSection: (s) => s.shifts,
    updateState: (s, section) => s.copyWith(shifts: section),
    fetch: (page, perPage) => _organizationRepository.getShifts(
      _orgId,
      userId: state.filterUserId,
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

  /// Фильтр по сотруднику. `null` — сброс (все сотрудники).
  /// Смена фильтра сбрасывает offset (перезагрузка с первой страницы).
  void setEmployeeFilter(Member? member) {
    emit(
      state.copyWith(
        filterUserId: member?.userId,
        filterUserName: member?.userName,
      ),
    );
    loadShifts();
  }

  /// Применить диапазон дат (UTC-границы, обе включительно по `started_at`).
  /// Обе `null` — сброс диапазона. Один перезапрос с первой страницы.
  void setDateRange(DateTime? dateFrom, DateTime? dateTo) {
    emit(state.copyWith(filterDateFrom: dateFrom, filterDateTo: dateTo));
    loadShifts();
  }

  void resetFilters() {
    emit(
      state.copyWith(
        filterStatus: null,
        filterDateFrom: null,
        filterDateTo: null,
        filterUserId: null,
        filterUserName: null,
      ),
    );
    loadShifts();
  }
}
