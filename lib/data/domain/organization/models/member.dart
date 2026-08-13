import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/utils/contact_label.dart';
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

    /// Пустая строка — у учётки, заведённой админом организации, нет email
    /// (бэк отдаёт `""`, не `null` — см. `docs/tasks/admin_created_accounts`).
    /// Для отображения используй [contactLabel].
    required String userEmail,
    required MemberRole role,
    required DateTime joinedAt,
    OrganizationRole? customRole,

    /// Логин пользователя. Заполнен только у учёток, заведённых админом
    /// организации; у остальных `null`. Additive — старый бэк не шлёт → `null`.
    String? userLogin,

    /// Действующая ставка (фича payroll); null — не задана
    /// либо ответ старого бэка без поля.
    CurrentRate? currentRate,
  }) = _Member;
  const Member._();

  /// email, а если его нет — login; `null`, если показывать нечего.
  /// Используй везде, где раньше безусловно выводился [userEmail]
  /// (см. mobile.md admin_created_accounts).
  String? get contactLabel =>
      resolveContactLabel(email: userEmail, login: userLogin);
}
