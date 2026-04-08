import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/pages/organizations/cubit/organizations_state.dart';

class OrganizationsCubit extends Cubit<OrganizationsState> {
  OrganizationsCubit({
    required OrganizationRepository organizationRepository,
    required UserRepository userRepository,
  })  : _organizationRepository = organizationRepository,
        _userRepository = userRepository,
        super(const OrganizationsState()) {
    _orgSubscription = _organizationRepository
        .watchMyOrganizations()
        .listen((orgs) {
      emit(state.copyWith(
        organizations: state.organizations.toSuccess(orgs),
      ),);
    },);
    _init();
  }

  final OrganizationRepository _organizationRepository;
  final UserRepository _userRepository;

  StreamSubscription<List<Organization>>? _orgSubscription;

  Future<void> _init() async {
    await Future.wait([
      _organizationRepository.fetchMyOrganizations(),
      _loadCurrentUser(),
    ]);
  }

  Future<void> _loadCurrentUser() async {
    emit(state.copyWith(currentUser: state.currentUser.toLoading()));
    final result = await _userRepository.getMe();

    result.fold(
      onSuccess: (user) {
        emit(
          state.copyWith(
            currentUser: state.currentUser.toSuccess(user),
          ),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            currentUser: state.currentUser.toError(error.message),
          ),
        );
      },
    );
  }

  Future<void> loadOrganizations() async {
    emit(state.copyWith(organizations: state.organizations.toLoading()));
    await _organizationRepository.fetchMyOrganizations();
  }

  Future<void> createOrganization({required String name}) async {
    emit(
      state.copyWith(
        createStatus: FeatureStatus.loading,
        actionError: null,
      ),
    );
    final result = await _organizationRepository.create(name: name);

    result.fold(
      onSuccess: (_) {
        emit(state.copyWith(createStatus: FeatureStatus.success));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            createStatus: FeatureStatus.error,
            actionError: error.message,
          ),
        );
      },
    );
  }

  Future<void> joinOrganization({required String inviteCode}) async {
    emit(
      state.copyWith(
        joinStatus: FeatureStatus.loading,
        actionError: null,
      ),
    );
    final result = await _organizationRepository.join(inviteCode);

    result.fold(
      onSuccess: (joinResult) {
        emit(
          state.copyWith(
            joinStatus: FeatureStatus.success,
            joinResult: joinResult,
          ),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            joinStatus: FeatureStatus.error,
            actionError: error.message,
          ),
        );
      },
    );
  }

  void resetCreateStatus() {
    emit(
      state.copyWith(
        createStatus: FeatureStatus.initial,
        actionError: null,
      ),
    );
  }

  void resetJoinStatus() {
    emit(
      state.copyWith(
        joinStatus: FeatureStatus.initial,
        actionError: null,
        joinResult: null,
      ),
    );
  }

  @override
  Future<void> close() {
    _orgSubscription?.cancel();
    return super.close();
  }
}
