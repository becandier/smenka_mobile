part of '../view/shift_tracker_page.dart';

class _IdleShiftContent extends StatelessWidget {
  const _IdleShiftContent({required this.state});

  final ShiftTrackerState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.timer_outlined,
              size: 80,
              color: colors.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.shiftTracker,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            if (state.hasOrganizations) ...[
              _OrgSelector(
                organizations: state.organizations.data ?? [],
                selectedOrganizationId: state.selectedOrganizationId,
                onChanged: context.read<ShiftTrackerCubit>().selectOrganization,
              ),
              const SizedBox(height: 24),
            ],
            AppButton(
              label: l10n.shiftStart,
              isLoading: state.isActionLoading,
              onPressed: () => _onStartShift(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onStartShift(BuildContext context) async {
    final cubit = context.read<ShiftTrackerCubit>();
    final result = await cubit.startShift();

    if (!context.mounted) return;

    if (result == StartShiftResult.success) {
      context.modals.showSuccess(context.l10n.shiftStarted);
    }
  }
}
