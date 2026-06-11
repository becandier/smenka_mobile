import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/mappers/_mappers.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/rate_mapper.dart';

extension MemberMapper on MemberDto {
  Member toDomain() {
    return Member(
      id: id,
      organizationId: organizationId,
      userId: userId,
      userName: userName,
      userEmail: userEmail,
      role: MemberRole.values.byName(role),
      customRole: customRole?.toDomain(),
      joinedAt: joinedAt,
      currentRate: currentRate?.toDomainOrNull(),
    );
  }
}
