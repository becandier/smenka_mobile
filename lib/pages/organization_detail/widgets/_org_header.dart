part of '../view/organization_detail_page.dart';

class _OrgHeader extends StatelessWidget {
  const _OrgHeader({required this.organization});

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: appColors.surface,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: appColors.primary.withValues(alpha: 0.1),
                child: Text(
                  organization.name.isNotEmpty
                      ? organization.name[0].toUpperCase()
                      : '?',
                  style: textTheme.headlineMedium?.copyWith(
                    color: appColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                organization.name,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
