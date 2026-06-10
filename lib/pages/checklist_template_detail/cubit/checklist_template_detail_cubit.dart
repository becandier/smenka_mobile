import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';
import 'package:smenka_mobile/pages/checklist_template_detail/cubit/checklist_template_detail_state.dart';

class ChecklistTemplateDetailCubit extends Cubit<ChecklistTemplateDetailState> {
  ChecklistTemplateDetailCubit({
    required String orgId,
    required String templateId,
    required ChecklistRepository checklistRepository,
    required OrganizationRoleRepository roleRepository,
    required OrganizationRepository organizationRepository,
  })  : _orgId = orgId,
        _templateId = templateId,
        _checklistRepository = checklistRepository,
        _roleRepository = roleRepository,
        _organizationRepository = organizationRepository,
        super(const ChecklistTemplateDetailState()) {
    _init();
  }

  final String _orgId;
  final String _templateId;
  final ChecklistRepository _checklistRepository;
  final OrganizationRoleRepository _roleRepository;
  final OrganizationRepository _organizationRepository;

  String get orgId => _orgId;
  String get templateId => _templateId;

  Future<void> _init() async {
    await Future.wait([
      loadTemplate(),
      loadRoles(),
      loadAssignments(),
      loadMembers(),
    ]);
  }

  Future<void> loadMembers() async {
    emit(state.copyWith(members: state.members.toLoading()));
    final result = await _organizationRepository.getMembers(_orgId);
    result.fold(
      onSuccess: (list) {
        emit(state.copyWith(members: state.members.toSuccess(list)));
      },
      onFailure: (error) {
        emit(state.copyWith(members: state.members.toError(error.message)));
      },
    );
  }

  Future<void> loadTemplate() async {
    emit(state.copyWith(template: state.template.toLoading()));
    final result = await _checklistRepository.getTemplate(_orgId, _templateId);
    result.fold(
      onSuccess: (detail) {
        emit(state.copyWith(template: state.template.toSuccess(detail)));
      },
      onFailure: (error) {
        emit(state.copyWith(template: state.template.toError(error.message)));
      },
    );
  }

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

  Future<void> loadAssignments() async {
    emit(state.copyWith(assignments: state.assignments.toLoading()));
    final result = await _checklistRepository.getAssignments(
      _orgId,
      _templateId,
    );
    result.fold(
      onSuccess: (a) {
        emit(state.copyWith(assignments: state.assignments.toSuccess(a)));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            assignments: state.assignments.toError(error.message),
          ),
        );
      },
    );
  }

  // --- Template meta ---

  Future<bool> updateMeta({
    String? name,
    ChecklistType? type,
    bool? isRequired,
  }) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _checklistRepository.updateTemplate(
      _orgId,
      _templateId,
      name: name,
      type: type,
      isRequired: isRequired,
    );
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadTemplate();
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

  // --- Items ---

  Future<bool> addItem({required String text, required bool isRequired}) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _checklistRepository.addItem(
      _orgId,
      _templateId,
      text: text,
      isRequired: isRequired,
    );
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadTemplate();
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

  Future<bool> updateItem(
    String itemId, {
    String? text,
    bool? isRequired,
  }) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _checklistRepository.updateItem(
      _orgId,
      _templateId,
      itemId,
      text: text,
      isRequired: isRequired,
    );
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadTemplate();
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

  Future<bool> deleteItem(String itemId) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _checklistRepository.deleteItem(
      _orgId,
      _templateId,
      itemId,
    );
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadTemplate();
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

  Future<void> reorderItems(int oldIndex, int newIndex) async {
    final detail = state.template.data;
    if (detail == null) return;

    final items = [...detail.items]
      ..sort((a, b) => a.position.compareTo(b.position));
    final adjusted = oldIndex < newIndex ? newIndex - 1 : newIndex;
    final moved = items.removeAt(oldIndex);
    items.insert(adjusted, moved);

    // Optimistic update
    final newDetail = detail.copyWith(
      items: [
        for (var i = 0; i < items.length; i++) items[i].copyWith(position: i),
      ],
    );
    emit(state.copyWith(template: state.template.toSuccess(newDetail)));

    final result = await _checklistRepository.reorderItems(
      _orgId,
      _templateId,
      itemIds: items.map((e) => e.id).toList(),
    );
    result.fold(
      onSuccess: (_) {
        loadTemplate();
      },
      onFailure: (error) {
        emit(state.copyWith(actionError: error.message));
        loadTemplate();
      },
    );
  }

  // --- Assignments ---

  Future<bool> assignToRoles(List<String> roleIds) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _checklistRepository.assignToRoles(
      _orgId,
      _templateId,
      roleIds: roleIds,
    );
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadAssignments();
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

  // --- Personal overrides ---

  Future<bool> setPersonalOverride(
    String userId,
    ChecklistOverrideType type,
  ) {
    return _runMemberAction(userId, () async {
      final result = await _checklistRepository.setPersonalOverride(
        _orgId,
        _templateId,
        userId,
        type: type,
      );
      return result.isSuccess;
    });
  }

  Future<bool> clearPersonalOverride(String userId) {
    return _runMemberAction(userId, () async {
      final result = await _checklistRepository.clearPersonalOverride(
        _orgId,
        _templateId,
        userId,
      );
      return result.isSuccess;
    });
  }

  Future<bool> _runMemberAction(
    String userId,
    Future<bool> Function() action,
  ) async {
    final pending = {...state.pendingMemberIds, userId};
    emit(state.copyWith(pendingMemberIds: pending, actionError: null));

    final ok = await action();

    final nextPending = {...state.pendingMemberIds}..remove(userId);
    emit(state.copyWith(pendingMemberIds: nextPending));

    if (ok) {
      await loadAssignments();
    }
    return ok;
  }

  // --- Archive ---

  Future<bool> archiveTemplate() async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result =
        await _checklistRepository.archiveTemplate(_orgId, _templateId);
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadTemplate();
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
