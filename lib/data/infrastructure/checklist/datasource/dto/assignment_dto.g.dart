// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistAssignedUserDto _$ChecklistAssignedUserDtoFromJson(
        Map<String, dynamic> json) =>
    _ChecklistAssignedUserDto(
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
    );

Map<String, dynamic> _$ChecklistAssignedUserDtoToJson(
        _ChecklistAssignedUserDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
    };

_ChecklistAssignmentDto _$ChecklistAssignmentDtoFromJson(
        Map<String, dynamic> json) =>
    _ChecklistAssignmentDto(
      templateId: json['template_id'] as String,
      roleIds:
          (json['role_ids'] as List<dynamic>).map((e) => e as String).toList(),
      personalAdd: (json['personal_add'] as List<dynamic>)
          .map((e) =>
              ChecklistAssignedUserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalRemove: (json['personal_remove'] as List<dynamic>)
          .map((e) =>
              ChecklistAssignedUserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChecklistAssignmentDtoToJson(
        _ChecklistAssignmentDto instance) =>
    <String, dynamic>{
      'template_id': instance.templateId,
      'role_ids': instance.roleIds,
      'personal_add': instance.personalAdd,
      'personal_remove': instance.personalRemove,
    };
