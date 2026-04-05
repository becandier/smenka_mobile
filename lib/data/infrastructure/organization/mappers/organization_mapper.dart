import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension OrganizationMapper on OrganizationDto {
  Organization toDomain() {
    return Organization(
      id: id,
      name: name,
      ownerId: ownerId,
      inviteCode: inviteCode,
      isDeleted: isDeleted,
      createdAt: createdAt,
    );
  }
}
