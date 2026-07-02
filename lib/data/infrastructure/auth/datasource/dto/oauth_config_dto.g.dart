// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OAuthConfigDto _$OAuthConfigDtoFromJson(
  Map<String, dynamic> json,
) => _OAuthConfigDto(
  google: json['google'] == null
      ? null
      : OAuthProviderConfigDto.fromJson(json['google'] as Map<String, dynamic>),
  apple: json['apple'] == null
      ? null
      : OAuthProviderConfigDto.fromJson(json['apple'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OAuthConfigDtoToJson(_OAuthConfigDto instance) =>
    <String, dynamic>{'google': instance.google, 'apple': instance.apple};

_OAuthProviderConfigDto _$OAuthProviderConfigDtoFromJson(
  Map<String, dynamic> json,
) => _OAuthProviderConfigDto(
  clientId: json['client_id'] as String,
  enabled: json['enabled'] as bool,
);

Map<String, dynamic> _$OAuthProviderConfigDtoToJson(
  _OAuthProviderConfigDto instance,
) => <String, dynamic>{
  'client_id': instance.clientId,
  'enabled': instance.enabled,
};
