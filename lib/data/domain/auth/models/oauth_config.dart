import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_config.freezed.dart';

/// Публичная конфигурация OAuth-провайдеров для текущей платформы
/// (`GET /auth/oauth/config`). `null` у провайдера — не настроен супер-админом.
@freezed
abstract class OAuthConfig with _$OAuthConfig {
  const factory OAuthConfig({
    OAuthProviderConfig? google,
    OAuthProviderConfig? apple,
  }) = _OAuthConfig;
}

@freezed
abstract class OAuthProviderConfig with _$OAuthProviderConfig {
  const factory OAuthProviderConfig({
    required String clientId,
    required bool enabled,
  }) = _OAuthProviderConfig;
}
