part of '../view/organization_detail_page.dart';

class _OrgInviteSection extends StatelessWidget {
  const _OrgInviteSection({required this.organization});

  final Organization organization;

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
            l10n.orgDetailInviteCode,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          BlocSelector<OrganizationDetailCubit, OrganizationDetailState,
              String?>(
            selector: (state) => state.inviteCode,
            builder: (context, inviteCode) {
              final code = inviteCode ?? organization.inviteCode;

              return Material(
                color: appColors.surface,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          code,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, size: 20),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: code));
                          context.modals.showInfo(l10n.orgDetailInviteCopied);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextButton.icon(
              onPressed: () => _confirmRotate(context),
              icon: const Icon(Icons.refresh, size: 18),
              label: Text(l10n.orgDetailRotateInvite),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmRotate(BuildContext context) {
    final l10n = context.l10n;
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.orgDetailRotateInvite),
        content: Text(l10n.orgDetailRotateConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<OrganizationDetailCubit>().rotateInviteCode();
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
