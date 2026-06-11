part of '../view/members_page.dart';

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final data = context
        .select<MembersCubit, ({bool isSelf, bool canManage, String orgId})>(
          (cubit) => (
            isSelf: member.userId == cubit.state.currentUserId,
            canManage: cubit.state.canManage,
            orgId: cubit.orgId,
          ),
        );
    final isSelf = data.isSelf;
    final canManage = data.canManage;

    final joinedDate =
        '${member.joinedAt.day.toString().padLeft(2, '0')}.'
        '${member.joinedAt.month.toString().padLeft(2, '0')}.'
        '${member.joinedAt.year}';

    Widget tile = Material(
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

    if (!isSelf && canManage) {
      tile = Dismissible(
        key: ValueKey(member.id),
        direction: DismissDirection.endToStart,
        background: Material(
          color: appColors.error,
          borderRadius: BorderRadius.circular(12),
          child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete_outline, color: Colors.white),
            ),
          ),
        ),
        confirmDismiss: (_) => _confirmRemove(context),
        child: tile,
      );
    }

    return tile;
  }

  void _openDetail(BuildContext context, String orgId) {
    context.router.push(MemberDetailRoute(orgId: orgId, member: member));
  }

  Future<bool> _confirmRemove(BuildContext context) async {
    final l10n = context.l10n;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.membersRemove),
        content: Text(l10n.membersRemoveConfirm(member.userName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return false;

    final cubit = context.read<MembersCubit>();
    final didRemove = await cubit.removeMember(member.userId);

    if (didRemove && context.mounted) {
      context.modals.showSuccess(l10n.membersRemoved);
    }

    return didRemove;
  }
}
