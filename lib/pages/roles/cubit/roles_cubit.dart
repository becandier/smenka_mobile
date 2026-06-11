import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization_role/repositories/organization_role_repository.dart';
import 'package:smenka_mobile/pages/roles/cubit/roles_state.dart';

class RolesCubit extends Cubit<RolesState> {
  RolesCubit({
    required String orgId,
    required OrganizationRoleRepository roleRepository,
  }) : _orgId = orgId,
       _roleRepository = roleRepository,
       super(const RolesState()) {
    loadRoles();
  }

  final String _orgId;
  final OrganizationRoleRepository _roleRepository;

  String get orgId => _orgId;

  Future<void> loadRoles() async {
    emit(state.copyWith(roles: state.roles.toLoading()));
    final result = await _roleRepository.getRoles(_orgId);
    result.fold(
      onSuccess: (roles) {
        emit(state.copyWith(roles: state.roles.toSuccess(roles)));
      },
      onFailure: (error) {
        emit(state.copyWith(roles: state.roles.toError(error.message)));
      },
    );
  }

  Future<bool> createRole(String name) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _roleRepository.createRole(_orgId, name: name);
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadRoles();
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
          ),
        );
        return false;
      },
    );
  }

  Future<bool> updateRole(String roleId, String name) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _roleRepository.updateRole(_orgId, roleId, name: name);
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadRoles();
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
          ),
        );
        return false;
      },
    );
  }

  Future<bool> deleteRole(String roleId) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _roleRepository.deleteRole(_orgId, roleId);
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadRoles();
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
          ),
        );
        return false;
      },
    );
  }

  void resetActionStatus() {
    emit(
      state.copyWith(actionStatus: FeatureStatus.initial, actionError: null),
    );
  }
}
