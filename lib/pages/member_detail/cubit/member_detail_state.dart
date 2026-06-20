import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'member_detail_state.freezed.dart';

@freezed
abstract class MemberDetailState with _$MemberDetailState {
  const factory MemberDetailState({
    required Member member,
    OrgMembershipRole? viewerRole,
    @Default(SectionData<List<EffectiveChecklistTemplate>>())
    SectionData<List<EffectiveChecklistTemplate>> effective,
  }) = _MemberDetailState;
  const MemberDetailState._();

  bool get canManage =>
      viewerRole == OrgMembershipRole.owner ||
      viewerRole == OrgMembershipRole.admin;
}
