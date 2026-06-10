import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';

part 'checklist_template_detail_state.freezed.dart';

@freezed
abstract class ChecklistTemplateDetailState
    with _$ChecklistTemplateDetailState {
  const factory ChecklistTemplateDetailState({
    @Default(SectionData<ChecklistTemplateDetail>())
    SectionData<ChecklistTemplateDetail> template,
    @Default(SectionData<List<OrganizationRole>>())
    SectionData<List<OrganizationRole>> roles,
    @Default(SectionData<ChecklistAssignment>())
    SectionData<ChecklistAssignment> assignments,
    @Default(SectionData<List<Member>>()) SectionData<List<Member>> members,
    @Default(<String>{}) Set<String> pendingMemberIds,
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
  }) = _ChecklistTemplateDetailState;
}
