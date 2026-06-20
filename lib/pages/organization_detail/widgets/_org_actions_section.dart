part of '../view/organization_detail_page.dart';

class _OrgActionsSection extends StatelessWidget {
  const _OrgActionsSection({required this.organization});

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    return BlocSelector<OrganizationDetailCubit, OrganizationDetailState, bool>(
      selector: (state) => context.read<OrganizationDetailCubit>().isMember,
      builder: (context, isMember) {
        // Покинуть организацию может только участник (owner — не member,
        // ADR-001; управление орг. — в веб-админке).
        if (!isMember) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton.icon(
            onPressed: () => _confirmLeave(context),
            icon: Icon(Icons.exit_to_app, color: appColors.warning),
            label: Text(
              l10n.orgDetailLeave,
              style: TextStyle(color: appColors.warning),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: appColors.warning.withValues(alpha: 0.5)),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
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
}
