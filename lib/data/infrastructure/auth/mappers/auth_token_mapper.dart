import 'package:templatecmd/data/domain/auth/models/_models.dart';
import 'package:templatecmd/data/infrastructure/auth/datasource/dto/_dto.dart';

/// Mapper для преобразования AuthTokenDto -> AuthToken
extension AuthTokenMapper on AuthTokenDto {
  /// Преобразует DTO в доменную модель
  /// [expiresIn] конвертируется из секунд в DateTime
  AuthToken toDomain() {
    return AuthToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: DateTime.now().add(Duration(seconds: expiresIn)),
    );
  }
}
