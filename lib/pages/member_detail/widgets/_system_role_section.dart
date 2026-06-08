part of '../view/member_detail_page.dart';

class _SystemRoleSection extends StatelessWidget {
  const _SystemRoleSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocSelector<MemberDetailCubit, MemberDetailState,
        ({MemberRole role, bool busy})>(
      selector: (state) => (
        role: state.member.role,
        busy: state.actionStatus == FeatureStatus.loading,
      ),
      builder: (context, data) {
        return Material(
          color: appColors.surface,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.memberDetailSystemRole,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SegmentedButton<MemberRole>(
                  segments: [
                    ButtonSegment(
                      value: MemberRole.employee,
                      label: Text(l10n.roleEmployee),
                    ),
                    ButtonSegment(
                      value: MemberRole.admin,
                      label: Text(l10n.roleAdmin),
                    ),
                  ],
                  selected: {data.role},
                  onSelectionChanged: data.busy
                      ? null
                      : (s) async {
                          final ok = await context
                              .read<MemberDetailCubit>()
                              .updateSystemRole(s.first);
                          if (ok && context.mounted) {
                            context.modals
                                .showSuccess(l10n.membersRoleChanged);
                          }
                        },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
