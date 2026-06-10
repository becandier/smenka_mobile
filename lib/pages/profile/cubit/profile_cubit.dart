import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/pages/profile/cubit/profile_state.dart';
import 'package:smenka_mobile/shared/auth/cubit/auth_cubit.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required UserRepository userRepository,
    required OrganizationRepository organizationRepository,
    required AuthCubit authCubit,
  })  : _userRepository = userRepository,
        _organizationRepository = organizationRepository,
        _authCubit = authCubit,
        super(const ProfileState()) {
    _orgSubscription =
        _organizationRepository.watchMyOrganizations().listen((orgs) {
      emit(
        state.copyWith(
          organizations: state.organizations.toSuccess(orgs),
        ),
      );
    });
    _init();
  }

  final UserRepository _userRepository;
  final OrganizationRepository _organizationRepository;
  final AuthCubit _authCubit;

  StreamSubscription<List<Organization>>? _orgSubscription;

  Future<void> _init() async {
    await Future.wait([
      _loadUser(),
      _organizationRepository.fetchMyOrganizations(),
    ]);
  }

  Future<void> _loadUser() async {
    emit(state.copyWith(user: state.user.toLoading()));
    final result = await _userRepository.getMe();

    result.fold(
      onSuccess: (user) {
        emit(state.copyWith(user: state.user.toSuccess(user)));
      },
      onFailure: (error) {
        emit(state.copyWith(user: state.user.toError(error.message)));
      },
    );
  }

  Future<void> updateProfile({String? name, String? phone}) async {
    emit(state.copyWith(updateStatus: FeatureStatus.loading));
    final result = await _userRepository.updateMe(name: name, phone: phone);

    result.fold(
      onSuccess: (user) {
        emit(
          state.copyWith(
            user: state.user.toSuccess(user),
            updateStatus: FeatureStatus.success,
          ),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            updateStatus: FeatureStatus.error,
            updateError: error.message,
          ),
        );
      },
    );
  }

  void resetUpdateStatus() {
    emit(
      state.copyWith(
        updateStatus: FeatureStatus.initial,
        updateError: null,
      ),
    );
  }

  Future<void> refresh() async {
    await Future.wait([
      _loadUser(),
      _organizationRepository.fetchMyOrganizations(),
    ]);
  }

  Future<void> logout() async {
    await _authCubit.logout();
  }

  @override
  Future<void> close() {
    _orgSubscription?.cancel();
    return super.close();
  }
}
