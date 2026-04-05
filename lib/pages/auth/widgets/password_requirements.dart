part of '../view/login_page.dart';

class _PasswordRequirements extends StatelessWidget {
  const _PasswordRequirements({
    required this.isLongEnough,
    required this.hasLetter,
    required this.hasDigit,
    required this.passwordNotEmpty,
  });

  final bool isLongEnough;
  final bool hasLetter;
  final bool hasDigit;
  final bool passwordNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RequirementRow(
          text: context.l10n.authPasswordMinLength,
          isMet: isLongEnough,
          passwordNotEmpty: passwordNotEmpty,
        ),
        const SizedBox(height: 4),
        _RequirementRow(
          text: context.l10n.authPasswordNeedLetter,
          isMet: hasLetter,
          passwordNotEmpty: passwordNotEmpty,
        ),
        const SizedBox(height: 4),
        _RequirementRow(
          text: context.l10n.authPasswordNeedDigit,
          isMet: hasDigit,
          passwordNotEmpty: passwordNotEmpty,
        ),
      ],
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({
    required this.text,
    required this.isMet,
    required this.passwordNotEmpty,
  });

  final String text;
  final bool isMet;
  final bool passwordNotEmpty;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final IconData icon;

    if (!passwordNotEmpty) {
      color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5);
      icon = Icons.circle_outlined;
    } else if (isMet) {
      color = context.appColors.success;
      icon = Icons.check_circle_outline;
    } else {
      color = context.appColors.error;
      icon = Icons.close;
    }

    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
        ),
      ],
    );
  }
}
