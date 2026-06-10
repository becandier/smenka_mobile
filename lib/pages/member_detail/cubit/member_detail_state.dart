import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';

part 'member_detail_state.freezed.dart';

@freezed
abstract class MemberDetailState with _$MemberDetailState {
  const factory MemberDetailState({
    required Member member,
    OrgMembershipRole? viewerRole,
    @Default(SectionData<List<MemberChecklistOverride>>())
    SectionData<List<MemberChecklistOverride>> overrides,
    @Default(SectionData<List<EffectiveChecklistTemplate>>())
    SectionData<List<EffectiveChecklistTemplate>> effective,
    @Default(SectionData<List<OrganizationRole>>())
    SectionData<List<OrganizationRole>> availableRoles,
    @Default(<String>{}) Set<String> pendingTemplateIds,
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
  }) = _MemberDetailState;
  const MemberDetailState._();

  bool get canManage =>
      viewerRole == OrgMembershipRole.owner ||
      viewerRole == OrgMembershipRole.admin;
}
