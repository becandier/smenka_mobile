import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/user/models/_models.dart';

part 'organizations_state.freezed.dart';

@freezed
abstract class OrganizationsState with _$OrganizationsState {
  const factory OrganizationsState({
    @Default(SectionData<List<Organization>>())
    SectionData<List<Organization>> organizations,
    @Default(SectionData<User>()) SectionData<User> currentUser,
    @Default(FeatureStatus.initial) FeatureStatus joinStatus,
    String? actionError,
    JoinResult? joinResult,
  }) = _OrganizationsState;
}
