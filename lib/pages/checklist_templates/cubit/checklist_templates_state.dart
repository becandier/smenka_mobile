import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';

part 'checklist_templates_state.freezed.dart';

@freezed
abstract class ChecklistTemplatesState with _$ChecklistTemplatesState {
  const factory ChecklistTemplatesState({
    @Default(SectionData<List<ChecklistTemplate>>())
    SectionData<List<ChecklistTemplate>> templates,
    @Default(false) bool includeArchived,
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
  }) = _ChecklistTemplatesState;
}
