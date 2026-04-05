import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension MemberMapper on MemberDto {
  Member toDomain() {
    return Member(
      id: id,
      organizationId: organizationId,
      userId: userId,
      userName: userName,
      userEmail: userEmail,
      role: MemberRole.values.byName(role),
      joinedAt: joinedAt,
    );
  }
}
