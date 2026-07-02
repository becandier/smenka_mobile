import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_config_dto.freezed.dart';
part 'oauth_config_dto.g.dart';

@freezed
abstract class OAuthConfigDto with _$OAuthConfigDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OAuthConfigDto({
    OAuthProviderConfigDto? google,
    OAuthProviderConfigDto? apple,
  }) = _OAuthConfigDto;

  factory OAuthConfigDto.fromJson(Map<String, dynamic> json) =>
      _$OAuthConfigDtoFromJson(json);
}

@freezed
abstract class OAuthProviderConfigDto with _$OAuthProviderConfigDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OAuthProviderConfigDto({
    required String clientId,
    required bool enabled,
  }) = _OAuthProviderConfigDto;

  factory OAuthProviderConfigDto.fromJson(Map<String, dynamic> json) =>
      _$OAuthProviderConfigDtoFromJson(json);
}
