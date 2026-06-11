part of '../view/organization_detail_page.dart';

class _OrgNavigationSection extends StatelessWidget {
  const _OrgNavigationSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocSelector<
      OrganizationDetailCubit,
      OrganizationDetailState,
      ({
        SectionData<List<Member>> members,
        bool isAdminOrOwner,
        bool isOwner,
        bool isMember,
        String orgId,
      })
    >(
      selector: (state) {
        final cubit = context.read<OrganizationDetailCubit>();
        return (
          members: state.members,
          isAdminOrOwner: cubit.isAdminOrOwner,
          isOwner: cubit.isOwner,
          isMember: state.currentMemberRole != null,
          orgId: state.organization.data?.id ?? '',
        );
      },
      builder: (context, data) {
        final count = data.members.data?.length ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.orgDetailTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _NavItem(
                icon: Icons.people_outline,
                title: l10n.orgDetailMembers,
                trailing: _CountBadge(count: count),
                onTap: () =>
                    context.router.push(OrgMembersRoute(orgId: data.orgId)),
              ),
              // «Мой заработок» — для участников (owner не member, ADR-001)
              if (data.isMember) ...[
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.account_balance_wallet_outlined,
                  title: l10n.payrollMyEarningsTitle,
                  onTap: () =>
                      context.router.push(MyEarningsRoute(orgId: data.orgId)),
                ),
              ],
              if (data.isAdminOrOwner) ...[
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.location_on_outlined,
                  title: l10n.orgDetailLocations,
                  onTap: () => context.router.push(
                    WorkLocationsRoute(orgId: data.orgId),
                  ),
                ),
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.badge_outlined,
                  title: l10n.orgDetailRoles,
                  onTap: () =>
                      context.router.push(RolesRoute(orgId: data.orgId)),
                ),
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.checklist,
                  title: l10n.orgDetailChecklists,
                  onTap: () => context.router.push(
                    ChecklistTemplatesRoute(orgId: data.orgId),
                  ),
                ),
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.schedule_outlined,
                  title: l10n.orgDetailShifts,
                  onTap: () =>
                      context.router.push(OrgShiftsRoute(orgId: data.orgId)),
                ),
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.bar_chart_outlined,
                  title: l10n.orgDetailStats,
                  onTap: () =>
                      context.router.push(OrgStatsRoute(orgId: data.orgId)),
                ),
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.payments_outlined,
                  title: l10n.payrollReportTitle,
                  onTap: () =>
                      context.router.push(PayrollRoute(orgId: data.orgId)),
                ),
              ],
              if (data.isAdminOrOwner) ...[
                const SizedBox(height: 8),
                _NavItem(
                  icon: Icons.settings_outlined,
                  title: l10n.orgDetailSettings,
                  onTap: () =>
                      context.router.push(OrgSettingsRoute(orgId: data.orgId)),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, size: 22, color: appColors.primary),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailing case final trailing?) ...[
                trailing,
                const SizedBox(width: 8),
              ],
              Icon(Icons.chevron_right, size: 20, color: appColors.secondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: appColors.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          '$count',
          style: textTheme.labelSmall?.copyWith(
            color: appColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
