import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_settings.freezed.dart';

@freezed
abstract class OrgSettings with _$OrgSettings {
  const factory OrgSettings({
    required String organizationId,
    required bool geoCheckEnabled,
    required int autoFinishHours,
    int? maxPauseMinutes,
    int? maxPausesPerShift,
  }) = _OrgSettings;
}
