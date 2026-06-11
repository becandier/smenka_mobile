import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/member_role_badges.dart';

/// Блок автора орг-смены: имя / почта / бейджи системной и кастомной ролей.
///
/// Используется в карточке списка смен организации и в шапке экрана детали
/// чужой смены. Заголовок выбирается по цепочке `userName → userEmail →
/// короткий userId`. Если и системная, и кастомная роль отсутствуют — участник
/// исключён из организации, показываем нейтральную подпись «Бывший сотрудник»
/// (историческую смену из списка не убираем).
class ShiftAuthorBlock extends StatelessWidget {
  const ShiftAuthorBlock({
    required this.userId,
    this.userName,
    this.userEmail,
    this.role,
    this.customRoleName,
    this.dense = false,
    super.key,
  });

  final String userId;
  final String? userName;
  final String? userEmail;

  /// Системная роль из API (`admin` | `employee`).
  /// `null` — исключён из org / персональный контекст.
  final String? role;
  final String? customRoleName;

  /// Компактная раскладка для карточки списка;
  /// иначе — крупная для шапки детали.
  final bool dense;

  String get _nameTrimmed => userName?.trim() ?? '';
  String get _emailTrimmed => userEmail?.trim() ?? '';

  String get _primary {
    if (_nameTrimmed.isNotEmpty) return _nameTrimmed;
    if (_emailTrimmed.isNotEmpty) return _emailTrimmed;
    return userId.length > 8 ? '${userId.substring(0, 8)}…' : userId;
  }

  String? get _secondary =>
      (_nameTrimmed.isNotEmpty && _emailTrimmed.isNotEmpty)
      ? _emailTrimmed
      : null;

  bool get _isFormer =>
      _parseRole(role) == null && (customRoleName?.trim().isEmpty ?? true);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    final primaryStyle = (dense ? textTheme.titleSmall : textTheme.titleMedium)
        ?.copyWith(fontWeight: FontWeight.w600);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_primary, style: primaryStyle),
        if (_secondary case final email?) ...[
          const SizedBox(height: 2),
          Text(
            email,
            style: textTheme.bodySmall?.copyWith(color: colors.secondary),
          ),
        ],
        const SizedBox(height: 6),
        if (_isFormer)
          Text(
            context.l10n.shiftAuthorFormerEmployee,
            style: textTheme.labelSmall?.copyWith(
              color: colors.secondary,
              fontStyle: FontStyle.italic,
            ),
          )
        else
          MemberRoleBadges(
            systemRole: _parseRole(role),
            customRoleName: customRoleName,
            direction: Axis.horizontal,
            compact: dense,
          ),
      ],
    );
  }
}

/// Маппинг строковой системной роли из API в [MemberRole].
MemberRole? _parseRole(String? role) {
  return switch (role) {
    'admin' => MemberRole.admin,
    'employee' => MemberRole.employee,
    _ => null,
  };
}
