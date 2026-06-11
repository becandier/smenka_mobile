import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/pages/checklist_templates/cubit/checklist_templates_state.dart';

class ChecklistTemplatesCubit extends Cubit<ChecklistTemplatesState> {
  ChecklistTemplatesCubit({
    required String orgId,
    required ChecklistRepository checklistRepository,
  }) : _orgId = orgId,
       _checklistRepository = checklistRepository,
       super(const ChecklistTemplatesState()) {
    loadTemplates();
  }

  final String _orgId;
  final ChecklistRepository _checklistRepository;

  String get orgId => _orgId;

  Future<void> loadTemplates() async {
    emit(state.copyWith(templates: state.templates.toLoading()));
    final result = await _checklistRepository.getTemplates(
      _orgId,
      includeArchived: state.includeArchived,
    );
    result.fold(
      onSuccess: (items) {
        emit(state.copyWith(templates: state.templates.toSuccess(items)));
      },
      onFailure: (error) {
        emit(state.copyWith(templates: state.templates.toError(error.message)));
      },
    );
  }

  Future<void> toggleShowArchived() async {
    emit(state.copyWith(includeArchived: !state.includeArchived));
    await loadTemplates();
  }

  Future<ChecklistTemplate?> createTemplate({
    required String name,
    required ChecklistType type,
    required bool isRequired,
  }) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _checklistRepository.createTemplate(
      _orgId,
      name: name,
      type: type,
      isRequired: isRequired,
    );
    return result.fold(
      onSuccess: (template) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadTemplates();
        return template;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
          ),
        );
        return null;
      },
    );
  }

  Future<bool> archiveTemplate(String templateId) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _checklistRepository.archiveTemplate(
      _orgId,
      templateId,
    );
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadTemplates();
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
