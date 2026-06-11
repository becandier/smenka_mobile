import 'package:smenka_mobile/data/domain/auth/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/auth/datasource/dto/_dto.dart';

extension AuthTokenMapper on AuthTokenDto {
  AuthToken toDomain() {
    return AuthToken(accessToken: accessToken, refreshToken: refreshToken);
  }
}
