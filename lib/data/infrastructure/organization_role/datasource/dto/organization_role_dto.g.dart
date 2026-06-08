// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_role_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationRoleDto _$OrganizationRoleDtoFromJson(Map<String, dynamic> json) =>
    _OrganizationRoleDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$OrganizationRoleDtoToJson(
        _OrganizationRoleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
    };
