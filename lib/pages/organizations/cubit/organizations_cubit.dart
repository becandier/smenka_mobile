import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
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
    _init();
  }

  final OrganizationRepository _organizationRepository;
  final UserRepository _userRepository;

  Future<void> _init() async {
    await Future.wait([
      loadOrganizations(),
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
    final result = await _organizationRepository.getAll();

    result.fold(
      onSuccess: (orgs) {
        emit(
          state.copyWith(
            organizations: state.organizations.toSuccess(orgs),
          ),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            organizations: state.organizations.toError(error.message),
          ),
        );
      },
    );
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
        loadOrganizations();
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
        loadOrganizations();
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
}
