import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';

part 'member.freezed.dart';

enum MemberRole { admin, employee }

@freezed
abstract class Member with _$Member {
  const factory Member({
    required String id,
    required String organizationId,
    required String userId,
    required String userName,
    required String userEmail,
    required MemberRole role,
    required DateTime joinedAt,
    OrganizationRole? customRole,

    /// Действующая ставка (фича payroll); null — не задана
    /// либо ответ старого бэка без поля.
    CurrentRate? currentRate,
  }) = _Member;
}
