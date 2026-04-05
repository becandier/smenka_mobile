import 'package:smenka_mobile/data/domain/user/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/user/datasource/dto/_dto.dart';

extension UserMapper on UserDto {
  User toDomain() {
    return User(
      id: id,
      email: email,
      name: name,
      phone: phone,
      isVerified: isVerified,
      createdAt: createdAt,
    );
  }
}
