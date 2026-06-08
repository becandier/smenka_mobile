part of '../view/member_detail_page.dart';

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocSelector<MemberDetailCubit, MemberDetailState, Member>(
      selector: (state) => state.member,
      builder: (context, member) {
        final joinedDate = '${member.joinedAt.day.toString().padLeft(2, '0')}.'
            '${member.joinedAt.month.toString().padLeft(2, '0')}.'
            '${member.joinedAt.year}';

        return Material(
          color: appColors.surface,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: appColors.primary.withValues(alpha: 0.1),
                  child: Text(
                    member.userName.isNotEmpty
                        ? member.userName[0].toUpperCase()
                        : '?',
                    style: textTheme.titleLarge?.copyWith(
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
                        member.userName,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
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
                      const SizedBox(height: 8),
                      MemberRoleBadges(
                        systemRole: member.role,
                        customRole: member.customRole,
                        direction: Axis.horizontal,
                        compact: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
