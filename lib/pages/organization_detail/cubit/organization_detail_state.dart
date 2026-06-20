import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/user/models/user.dart';

part 'organization_detail_state.freezed.dart';

@freezed
abstract class OrganizationDetailState with _$OrganizationDetailState {
  const factory OrganizationDetailState({
    @Default(SectionData<Organization>())
    SectionData<Organization> organization,
    @Default(SectionData<List<Member>>()) SectionData<List<Member>> members,
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
    @Default('') String currentUserId,
    MemberRole? currentMemberRole,
    @Default(UserRole.user) UserRole currentUserRole,
  }) = _OrganizationDetailState;
}
