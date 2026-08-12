// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  id: json['id'] as String,
  name: json['name'] as String,
  isVerified: json['is_verified'] as bool,
  role: json['role'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  login: json['login'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'is_verified': instance.isVerified,
  'role': instance.role,
  'created_at': instance.createdAt.toIso8601String(),
  'email': instance.email,
  'phone': instance.phone,
  'login': instance.login,
};
