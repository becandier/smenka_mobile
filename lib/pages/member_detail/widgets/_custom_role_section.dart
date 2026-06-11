part of '../view/member_detail_page.dart';

class _CustomRoleSection extends StatelessWidget {
  const _CustomRoleSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocSelector<
      MemberDetailCubit,
      MemberDetailState,
      OrganizationRole?
    >(
      selector: (state) => state.member.customRole,
      builder: (context, role) {
        return Material(
          color: appColors.surface,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _openPicker(context),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.badge_outlined, color: appColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.memberDetailCustomRole,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          role?.name ?? l10n.membersCustomRoleNone,
                          style: textTheme.bodyMedium?.copyWith(
                            color: appColors.secondary,
                          ),
                        ),
                      ],
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
      },
    );
  }

  void _openPicker(BuildContext context) {
    final cubit = context.read<MemberDetailCubit>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          BlocProvider.value(value: cubit, child: const _CustomRoleSheet()),
    );
  }
}
