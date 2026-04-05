import 'package:smenka_mobile/data/domain/auth/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/auth/datasource/dto/_dto.dart';

extension RegisterResultMapper on RegisterResultDto {
  RegisterResult toDomain() {
    return RegisterResult(
      userId: userId,
      message: message,
    );
  }
}
