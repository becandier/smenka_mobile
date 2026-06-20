part of '../view/members_page.dart';

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final data = context.select<MembersCubit, ({bool isSelf, String orgId})>(
      (cubit) => (
        isSelf: member.userId == cubit.state.currentUserId,
        orgId: cubit.orgId,
      ),
    );
    final isSelf = data.isSelf;

    final joinedDate =
        '${member.joinedAt.day.toString().padLeft(2, '0')}.'
        '${member.joinedAt.month.toString().padLeft(2, '0')}.'
        '${member.joinedAt.year}';

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: isSelf ? null : () => _openDetail(context, data.orgId),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: appColors.primary.withValues(alpha: 0.08),
                child: Text(
                  member.userName.isNotEmpty
                      ? member.userName[0].toUpperCase()
                      : '?',
                  style: textTheme.labelLarge?.copyWith(
                    color: appColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.userName,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      member.userEmail,
                      style: textTheme.bodySmall?.copyWith(
                        color: appColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.membersJoinedAt(joinedDate),
                      style: textTheme.bodySmall?.copyWith(
                        color: appColors.secondary.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              MemberRoleBadges(
                systemRole: member.role,
                customRole: member.customRole,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openDetail(BuildContext context, String orgId) {
    context.router.push(MemberDetailRoute(orgId: orgId, member: member));
  }
}
