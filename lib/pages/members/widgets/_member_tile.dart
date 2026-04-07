part of '../view/members_page.dart';

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<MembersCubit>();
    final isSelf = member.userId == cubit.currentUserId;

    final roleLabel = switch (member.role) {
      MemberRole.admin => l10n.roleAdmin,
      MemberRole.employee => l10n.roleEmployee,
    };

    final roleColor = switch (member.role) {
      MemberRole.admin => appColors.primary,
      MemberRole.employee => appColors.secondary,
    };

    final joinedDate =
        '${member.joinedAt.day.toString().padLeft(2, '0')}.'
        '${member.joinedAt.month.toString().padLeft(2, '0')}.'
        '${member.joinedAt.year}';

    Widget tile = Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onLongPress: isSelf ? null : () => _showActions(context),
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
              Material(
                color: roleColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  child: Text(
                    roleLabel,
                    style: textTheme.labelSmall?.copyWith(
                      color: roleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (!isSelf) {
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

  void _showActions(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final cubit = context.read<MembersCubit>();

    final isAdmin = member.role == MemberRole.admin;

    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  isAdmin ? Icons.person_outline : Icons.admin_panel_settings,
                  color: appColors.primary,
                ),
                title: Text(
                  isAdmin ? l10n.membersMakeEmployee : l10n.membersMakeAdmin,
                ),
                onTap: () async {
                  Navigator.of(sheetContext).pop();
                  final newRole =
                      isAdmin ? MemberRole.employee : MemberRole.admin;
                  final didUpdate = await cubit.updateMemberRole(
                    member.userId,
                    role: newRole,
                  );
                  if (didUpdate && context.mounted) {
                    context.modals.showSuccess(l10n.membersRoleChanged);
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: appColors.error,
                ),
                title: Text(
                  l10n.membersRemove,
                  style: TextStyle(color: appColors.error),
                ),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  _confirmRemove(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
