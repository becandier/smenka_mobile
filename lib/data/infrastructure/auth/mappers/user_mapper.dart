import 'package:templatecmd/data/domain/auth/models/_models.dart';
import 'package:templatecmd/data/infrastructure/auth/datasource/dto/_dto.dart';

/// Mapper для преобразования UserDto -> User
extension UserMapper on UserDto {
  /// Преобразует DTO в доменную модель
  User toDomain() {
    return User(
      id: id,
      email: email,
      name: name,
      avatarUrl: avatarUrl,
    );
  }
}
