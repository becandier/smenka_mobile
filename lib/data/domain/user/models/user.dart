import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/utils/contact_label.dart';

part 'user.freezed.dart';

enum UserRole { superAdmin, user }

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String name,
    required bool isVerified,
    required UserRole role,
    required DateTime createdAt,

    /// `null` — учётка заведена админом организации без email
    /// (`admin_created_accounts`); тогда есть [login].
    String? email,
    String? phone,

    /// Логин для входа. Заполнен только у учёток, заведённых админом
    /// организации без email (`admin_created_accounts`); у остальных `null`.
    String? login,
  }) = _User;
  const User._();

  /// Единый контакт для отображения в профиле: email, а если его нет —
  /// login. `null`, если показывать нечего (не должно происходить — бэк
  /// гарантирует хотя бы один из идентификаторов).
  String? get contactLabel => resolveContactLabel(email: email, login: login);
}
