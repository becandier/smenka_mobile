part of '../view/super_admin_page.dart';

class _AdminOrgCard extends StatelessWidget {
  const _AdminOrgCard({required this.organization});

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final formattedDate =
        DateFormat('dd.MM.yyyy').format(organization.createdAt);

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.router.push(
          OrganizationDetailRoute(orgId: organization.id),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: appColors.primary.withValues(alpha: 0.1),
                child: Text(
                  organization.name.isNotEmpty
                      ? organization.name[0].toUpperCase()
                      : '?',
                  style: textTheme.titleMedium?.copyWith(
                    color: appColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      organization.name,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      formattedDate,
                      style: textTheme.bodySmall?.copyWith(
                        color: appColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: appColors.secondary.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
