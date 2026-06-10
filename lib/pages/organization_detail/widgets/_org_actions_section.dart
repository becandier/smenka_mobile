part of '../view/organization_detail_page.dart';

class _OrgActionsSection extends StatelessWidget {
  const _OrgActionsSection({required this.organization});

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    return BlocSelector<OrganizationDetailCubit, OrganizationDetailState, bool>(
      selector: (state) => context.read<OrganizationDetailCubit>().isOwner,
      builder: (context, isOwner) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              if (!isOwner)
                OutlinedButton.icon(
                  onPressed: () => _confirmLeave(context),
                  icon: Icon(Icons.exit_to_app, color: appColors.warning),
                  label: Text(
                    l10n.orgDetailLeave,
                    style: TextStyle(color: appColors.warning),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: appColors.warning.withValues(alpha: 0.5),
                    ),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              if (isOwner)
                OutlinedButton.icon(
                  onPressed: () => _confirmDelete(context),
                  icon: Icon(Icons.delete_outline, color: appColors.error),
                  label: Text(
                    l10n.orgDetailDelete,
                    style: TextStyle(color: appColors.error),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: appColors.error.withValues(alpha: 0.5),
                    ),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _confirmLeave(BuildContext context) {
    final l10n = context.l10n;
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.orgDetailLeave),
        content: Text(l10n.orgDetailLeaveConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final cubit = context.read<OrganizationDetailCubit>();
              final didLeave = await cubit.leaveOrganization();
              if (didLeave && context.mounted) {
                context.modals.showSuccess(l10n.orgDetailLeft);
                await context.router.maybePop();
              }
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    final l10n = context.l10n;
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.orgDetailDelete),
        content: Text(l10n.orgDetailDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final cubit = context.read<OrganizationDetailCubit>();
              final didDelete = await cubit.deleteOrganization();
              if (didDelete && context.mounted) {
                context.modals.showSuccess(l10n.orgDetailDeleted);
                await context.router.maybePop();
              }
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
