// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrgSettingsDto _$OrgSettingsDtoFromJson(Map<String, dynamic> json) =>
    _OrgSettingsDto(
      organizationId: json['organization_id'] as String,
      geoCheckEnabled: json['geo_check_enabled'] as bool,
      autoFinishHours: (json['auto_finish_hours'] as num).toInt(),
      maxPauseMinutes: (json['max_pause_minutes'] as num?)?.toInt(),
      maxPausesPerShift: (json['max_pauses_per_shift'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrgSettingsDtoToJson(_OrgSettingsDto instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'geo_check_enabled': instance.geoCheckEnabled,
      'auto_finish_hours': instance.autoFinishHours,
      'max_pause_minutes': instance.maxPauseMinutes,
      'max_pauses_per_shift': instance.maxPausesPerShift,
    };
