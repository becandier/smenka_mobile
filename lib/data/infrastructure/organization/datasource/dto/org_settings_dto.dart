import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_settings_dto.freezed.dart';
part 'org_settings_dto.g.dart';

@freezed
abstract class OrgSettingsDto with _$OrgSettingsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrgSettingsDto({
    required String organizationId,
    required bool geoCheckEnabled,
    required int autoFinishHours,
    int? maxPauseMinutes,
    int? maxPausesPerShift,
  }) = _OrgSettingsDto;

  factory OrgSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$OrgSettingsDtoFromJson(json);
}
