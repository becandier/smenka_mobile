import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension JoinResultMapper on JoinResultDto {
  JoinResult toDomain() {
    return JoinResult(
      organizationId: organizationId,
      organizationName: organizationName,
      role: role,
    );
  }
}
