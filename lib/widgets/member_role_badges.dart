import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Единый способ показать роли сотрудника в организации.
///
/// Показывает:
/// - Бейдж «Владелец», если [isOwner]
/// - Иначе — бейдж «Администратор»/«Участник» по [systemRole]
/// - Плюс зелёный бейдж с именем [customRole], если она назначена
///
/// [direction] управляет раскладкой: vertical (по умолчанию) — для
/// плиток со свободной высотой; horizontal — для карточек в одну строку.
class MemberRoleBadges extends StatelessWidget {
  const MemberRoleBadges({
    required this.systemRole,
    this.customRole,
    this.customRoleName,
    this.isOwner = false,
    this.direction = Axis.vertical,
    this.compact = false,
    super.key,
  });

  final MemberRole? systemRole;
  final OrganizationRole? customRole;

  /// Плоское имя кастомной роли — используется, когда объект [customRole]
  /// недоступен (напр. в карточке смены приходит только имя). Приоритет
  /// у [customRole], если задан.
  final String? customRoleName;
  final bool isOwner;
  final Axis direction;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    final (String systemLabel, Color systemColor)? system = switch ((
      isOwner,
      systemRole,
    )) {
      (true, _) => (l10n.roleOwner, appColors.primary),
      (false, MemberRole.admin) => (l10n.roleAdmin, appColors.primary),
      (false, MemberRole.employee) => (l10n.roleEmployee, appColors.secondary),
      (false, null) => null,
    };

    final customLabel = customRole?.name ?? customRoleName;

    final badges = <Widget>[
      if (system != null)
        _RoleBadge(
          label: system.$1,
          color: system.$2,
          compact: compact,
        ),
      if (customLabel != null)
        _RoleBadge(
          label: customLabel,
          color: appColors.success,
          compact: compact,
        ),
    ];

    if (badges.isEmpty) return const SizedBox.shrink();

    final spacing = compact ? 4.0 : 6.0;

    if (direction == Axis.horizontal) {
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: badges,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < badges.length; i++) ...[
          if (i > 0) SizedBox(height: spacing),
          badges[i],
        ],
      ],
    );
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge({
    required this.label,
    required this.color,
    required this.compact,
  });

  final String label;
  final Color color;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 8 : 10,
          vertical: compact ? 3 : 4,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
