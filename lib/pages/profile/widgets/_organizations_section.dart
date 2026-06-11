part of '../view/profile_page.dart';

class _OrganizationsSection extends StatelessWidget {
  const _OrganizationsSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.myOrganizations,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          BlocSelector<
            ProfileCubit,
            ProfileState,
            SectionData<List<Organization>>
          >(
            selector: (state) => state.organizations,
            builder: (context, orgSection) {
              if (orgSection.isLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              }

              final orgs = orgSection.data;
              if (orgs == null || orgs.isEmpty) {
                return Material(
                  color: appColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        l10n.noOrganizations,
                        style: textTheme.bodyMedium?.copyWith(
                          color: appColors.secondary,
                        ),
                      ),
                    ),
                  ),
                );
              }

              return Column(
                children: orgs.map((org) => _OrgCard(org: org)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _OrgCard extends StatelessWidget {
  const _OrgCard({required this.org});

  final Organization org;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final isOwner = org.myRole.isOwner;
    final systemRole = org.myRole.asSystemRole;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: appColors.surface,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () =>
              context.router.push(OrganizationDetailRoute(orgId: org.id)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: appColors.primary.withValues(alpha: 0.1),
                  child: Text(
                    org.name.isNotEmpty ? org.name[0].toUpperCase() : '?',
                    style: textTheme.titleSmall?.copyWith(
                      color: appColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    org.name,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                MemberRoleBadges(
                  isOwner: isOwner,
                  systemRole: systemRole,
                  customRole: org.myCustomRole,
                  direction: Axis.horizontal,
                  compact: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
