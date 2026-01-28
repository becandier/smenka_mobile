// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokenDto _$AuthTokenDtoFromJson(Map<String, dynamic> json) =>
    _AuthTokenDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$AuthTokenDtoToJson(_AuthTokenDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };
