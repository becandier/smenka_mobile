part of '../view/roles_page.dart';

class _RoleTile extends StatelessWidget {
  const _RoleTile({required this.role});

  final OrganizationRole role;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showActions(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(Icons.badge_outlined, color: appColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  role.name,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
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

  void _showActions(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final cubit = context.read<RolesCubit>();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AppBottomSheet(
        title: role.name,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.edit_outlined, color: appColors.primary),
              title: Text(l10n.rolesRename),
              onTap: () {
                Navigator.of(context).pop();
                _openEdit(context, cubit);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_outline, color: appColors.error),
              title: Text(
                l10n.rolesDelete,
                style: TextStyle(color: appColors.error),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _confirmDelete(context, cubit);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openEdit(BuildContext context, RolesCubit cubit) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _RoleEditorSheet(role: role),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, RolesCubit cubit) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.rolesDelete),
        content: Text(l10n.rolesDeleteConfirm(role.name)),
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

    if (confirmed != true || !context.mounted) return;

    final ok = await cubit.deleteRole(role.id);
    if (ok && context.mounted) {
      context.modals.showSuccess(l10n.rolesDeleted);
    }
  }
}
