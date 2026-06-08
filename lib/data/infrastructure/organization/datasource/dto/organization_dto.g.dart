// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationDto _$OrganizationDtoFromJson(Map<String, dynamic> json) =>
    _OrganizationDto(
      id: json['id'] as String,
      name: json['name'] as String,
      ownerId: json['owner_id'] as String,
      inviteCode: json['invite_code'] as String,
      isDeleted: json['is_deleted'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      geoCheckEnabled: json['geo_check_enabled'] as bool? ?? false,
      myRole: json['my_role'] as String?,
      myCustomRole: json['my_custom_role'] == null
          ? null
          : OrganizationRoleDto.fromJson(
              json['my_custom_role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrganizationDtoToJson(_OrganizationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner_id': instance.ownerId,
      'invite_code': instance.inviteCode,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt.toIso8601String(),
      'geo_check_enabled': instance.geoCheckEnabled,
      'my_role': instance.myRole,
      'my_custom_role': instance.myCustomRole,
    };
