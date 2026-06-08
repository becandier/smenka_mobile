import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'org_settings_state.freezed.dart';

@freezed
abstract class OrgSettingsState with _$OrgSettingsState {
  const factory OrgSettingsState({
    @Default(SectionData<OrgSettings>()) SectionData<OrgSettings> settings,
    @Default(FeatureStatus.initial) FeatureStatus saveStatus,
    @Default(false) bool geoCheckEnabled,
    @Default(false) bool autoFinishEnabled,
    int? autoFinishHours,
    int? maxPauseMinutes,
    int? maxPausesPerShift,
    @Default(false) bool hasChanges,
  }) = _OrgSettingsState;
}
