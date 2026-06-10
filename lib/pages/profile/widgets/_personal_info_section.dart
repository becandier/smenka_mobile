part of '../view/profile_page.dart';

class _PersonalInfoSection extends StatelessWidget {
  const _PersonalInfoSection({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final formattedDate = '${user.createdAt.day.toString().padLeft(2, '0')}.'
        '${user.createdAt.month.toString().padLeft(2, '0')}.'
        '${user.createdAt.year}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: appColors.surface,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.personalInfo,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        context.router.push(const EditProfileRoute()),
                    child: Text(l10n.editProfile),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.person_outline,
                label: l10n.authName,
                value: user.name,
              ),
              const SizedBox(height: 8),
              _InfoRow(
                icon: Icons.email_outlined,
                label: l10n.authEmail,
                value: user.email,
              ),
              const SizedBox(height: 8),
              _InfoRow(
                icon: Icons.phone_outlined,
                label: l10n.phone,
                value: user.phone ?? l10n.phoneNotSpecified,
                isPlaceholder: user.phone == null,
              ),
              const SizedBox(height: 8),
              _InfoRow(
                icon: Icons.calendar_today_outlined,
                label: l10n.memberSince(formattedDate),
                value: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isPlaceholder = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isPlaceholder;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 20, color: appColors.secondary),
        const SizedBox(width: 12),
        if (value.isNotEmpty) ...[
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(color: appColors.secondary),
          ),
          const Spacer(),
          Text(
            value,
            style: textTheme.bodyMedium?.copyWith(
              color: isPlaceholder
                  ? appColors.secondary.withValues(alpha: 0.6)
                  : null,
              fontStyle: isPlaceholder ? FontStyle.italic : null,
            ),
          ),
        ] else
          Expanded(
            child: Text(
              label,
              style: textTheme.bodySmall?.copyWith(color: appColors.secondary),
            ),
          ),
      ],
    );
  }
}
