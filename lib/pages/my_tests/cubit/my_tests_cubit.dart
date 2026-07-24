import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/my_tests/cubit/my_tests_state.dart';

class MyTestsCubit extends Cubit<MyTestsState>
    with PaginationMixin<MyTestsState> {
  MyTestsCubit({
    required TestRepository testRepository,
    required OrganizationRepository organizationRepository,
    String? initialOrganizationId,
  }) : _testRepository = testRepository,
       _organizationRepository = organizationRepository,
       super(MyTestsState(filterOrganizationId: initialOrganizationId)) {
    _orgSubscription = _organizationRepository.watchMyOrganizations().listen((
      orgs,
    ) {
      emit(state.copyWith(organizations: orgs));
    });
    unawaited(_organizationRepository.fetchMyOrganizations());
    loadAssignments();
  }

  final TestRepository _testRepository;
  final OrganizationRepository _organizationRepository;

  StreamSubscription<List<Organization>>? _orgSubscription;

  Future<void> loadAssignments({bool isRefresh = true}) => fetchPaginated(
    getSection: (s) => s.assignments,
    updateState: (s, section) => s.copyWith(assignments: section),
    fetch: (page, perPage) => _testRepository.getMyAssignments(
      organizationId: state.filterOrganizationId,
      limit: perPage,
      offset: (page - 1) * perPage,
    ),
    isRefresh: isRefresh,
  );

  void setOrganizationFilter(String? organizationId) {
    emit(state.copyWith(filterOrganizationId: organizationId));
    loadAssignments();
  }

  @override
  Future<void> close() {
    _orgSubscription?.cancel();
    return super.close();
  }
}
