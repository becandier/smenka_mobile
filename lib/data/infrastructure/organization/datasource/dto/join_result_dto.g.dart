// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JoinResultDto _$JoinResultDtoFromJson(Map<String, dynamic> json) =>
    _JoinResultDto(
      organizationId: json['organization_id'] as String,
      organizationName: json['organization_name'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$JoinResultDtoToJson(_JoinResultDto instance) =>
    <String, dynamic>{
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
      'role': instance.role,
    };
