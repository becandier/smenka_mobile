import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';

part 'roles_state.freezed.dart';

@freezed
abstract class RolesState with _$RolesState {
  const factory RolesState({
    @Default(SectionData<List<OrganizationRole>>())
    SectionData<List<OrganizationRole>> roles,
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
  }) = _RolesState;
}
