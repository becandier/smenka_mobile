import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_detail_state.dart';

class MemberDetailCubit extends Cubit<MemberDetailState> {
  MemberDetailCubit({
    required String orgId,
    required Member member,
    required OrganizationRepository organizationRepository,
    required OrganizationRoleRepository roleRepository,
    required ChecklistRepository checklistRepository,
  }) : _orgId = orgId,
       _organizationRepository = organizationRepository,
       _roleRepository = roleRepository,
       _checklistRepository = checklistRepository,
       super(MemberDetailState(member: member)) {
    _init();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;
  final OrganizationRoleRepository _roleRepository;
  final ChecklistRepository _checklistRepository;

  String get userId => state.member.userId;

  Future<void> _init() async {
    await _loadViewerRole();
    if (!state.canManage) return;
    await Future.wait([loadOverrides(), loadEffective(), loadAvailableRoles()]);
  }

  Future<void> _loadViewerRole() async {
    final result = await _organizationRepository.getById(_orgId);
    result.fold(
      onSuccess: (org) => emit(state.copyWith(viewerRole: org.myRole)),
      onFailure: (_) {},
    );
  }

  Future<void> loadOverrides() async {
    emit(state.copyWith(overrides: state.overrides.toLoading()));
    final result = await _checklistRepository.getMemberOverrides(
      _orgId,
      userId,
    );
    result.fold(
      onSuccess: (list) {
        emit(state.copyWith(overrides: state.overrides.toSuccess(list)));
      },
      onFailure: (error) {
        emit(state.copyWith(overrides: state.overrides.toError(error.message)));
      },
    );
  }

  Future<void> loadEffective() async {
    emit(state.copyWith(effective: state.effective.toLoading()));
    final result = await _checklistRepository.getEffectiveTemplates(
      _orgId,
      userId,
    );
    result.fold(
      onSuccess: (list) {
        emit(state.copyWith(effective: state.effective.toSuccess(list)));
      },
      onFailure: (error) {
        emit(state.copyWith(effective: state.effective.toError(error.message)));
      },
    );
  }

  Future<void> loadAvailableRoles() async {
    emit(state.copyWith(availableRoles: state.availableRoles.toLoading()));
    final result = await _roleRepository.getRoles(_orgId);
    result.fold(
      onSuccess: (list) {
        emit(
          state.copyWith(availableRoles: state.availableRoles.toSuccess(list)),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            availableRoles: state.availableRoles.toError(error.message),
          ),
        );
      },
    );
  }

  // --- Roles ---

  Future<bool> updateSystemRole(MemberRole role) async {
    if (role == state.member.role) return true;
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _organizationRepository.updateMemberRole(
      _orgId,
      userId,
      role: role,
    );
    return result.fold(
      onSuccess: (member) {
        emit(
          state.copyWith(member: member, actionStatus: FeatureStatus.success),
        );
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

  Future<bool> assignCustomRole(String? roleId) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _roleRepository.assignRoleToMember(
      _orgId,
      userId,
      roleId: roleId,
    );
    return result.fold(
      onSuccess: (_) async {
        // API возвращает только статус; обновим member через перезагрузку
        // списка членов с сервера (наиболее надёжный путь) + пересчёт
        // эффективных чек-листов, т.к. роль влияет на них.
        final members = await _organizationRepository.getMembers(_orgId);
        members.fold(
          onSuccess: (list) {
            final found = list.where((m) => m.userId == userId).firstOrNull;
            if (found != null) emit(state.copyWith(member: found));
          },
          onFailure: (_) {},
        );
        await loadEffective();
        emit(state.copyWith(actionStatus: FeatureStatus.success));
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

  // --- Overrides ---

  Future<bool> setOverride(String templateId, ChecklistOverrideType type) {
    return _runTemplateAction(templateId, () async {
      final result = await _checklistRepository.setPersonalOverride(
        _orgId,
        templateId,
        userId,
        type: type,
      );
      return result.isSuccess;
    });
  }

  Future<bool> clearOverride(String templateId) {
    return _runTemplateAction(templateId, () async {
      final result = await _checklistRepository.clearPersonalOverride(
        _orgId,
        templateId,
        userId,
      );
      return result.isSuccess;
    });
  }

  Future<bool> _runTemplateAction(
    String templateId,
    Future<bool> Function() action,
  ) async {
    emit(
      state.copyWith(
        pendingTemplateIds: {...state.pendingTemplateIds, templateId},
        actionError: null,
      ),
    );
    final ok = await action();
    final next = {...state.pendingTemplateIds}..remove(templateId);
    emit(state.copyWith(pendingTemplateIds: next));
    if (ok) {
      await Future.wait([loadOverrides(), loadEffective()]);
    }
    return ok;
  }

  // --- Destructive ---

  Future<bool> removeMember() async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _organizationRepository.removeMember(_orgId, userId);
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
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
}
