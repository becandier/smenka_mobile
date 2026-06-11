part of '../view/profile_page.dart';

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: appColors.primary.withValues(alpha: 0.15),
            child: Text(
              user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
              style: textTheme.headlineLarge?.copyWith(
                color: appColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            user.name,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: textTheme.bodyMedium?.copyWith(color: appColors.secondary),
          ),
        ],
      ),
    );
  }
}
