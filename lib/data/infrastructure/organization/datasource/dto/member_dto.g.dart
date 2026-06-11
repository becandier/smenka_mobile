// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberDto _$MemberDtoFromJson(Map<String, dynamic> json) => _MemberDto(
  id: json['id'] as String,
  organizationId: json['organization_id'] as String,
  userId: json['user_id'] as String,
  userName: json['user_name'] as String,
  userEmail: json['user_email'] as String,
  role: json['role'] as String,
  joinedAt: DateTime.parse(json['joined_at'] as String),
  customRole: json['custom_role'] == null
      ? null
      : OrganizationRoleDto.fromJson(
          json['custom_role'] as Map<String, dynamic>,
        ),
  currentRate: json['current_rate'] == null
      ? null
      : CurrentRateDto.fromJson(json['current_rate'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MemberDtoToJson(_MemberDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'role': instance.role,
      'joined_at': instance.joinedAt.toIso8601String(),
      'custom_role': instance.customRole,
      'current_rate': instance.currentRate,
    };
