import 'package:smenka_mobile/data/domain/auth/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/auth/datasource/dto/_dto.dart';

extension OAuthConfigMapper on OAuthConfigDto {
  OAuthConfig toDomain() {
    return OAuthConfig(google: google?.toDomain(), apple: apple?.toDomain());
  }
}

extension OAuthProviderConfigMapper on OAuthProviderConfigDto {
  OAuthProviderConfig toDomain() {
    return OAuthProviderConfig(clientId: clientId, enabled: enabled);
  }
}
