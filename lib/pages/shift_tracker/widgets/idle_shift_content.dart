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
        physics: const AlwaysScrollableScrollPhysics(),
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
            if (state.showWorkLocationSelector) ...[
              _WorkLocationSelector(state: state),
              const SizedBox(height: 24),
            ],
            AppButton(
              label: l10n.shiftStart,
              isLoading: state.isActionLoading,
              isEnabled: state.canStartShift,
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

    switch (result) {
      case StartShiftResult.success:
        context.modals.showSuccess(context.l10n.shiftStarted);
      case StartShiftResult.geoServiceDisabled:
        _showGeoServiceDialog(context);
      case StartShiftResult.geoDenied:
        context.modals.showError(context.l10n.geoPermissionDenied);
      case StartShiftResult.geoDeniedForever:
        _showOpenSettingsDialog(context);
      case StartShiftResult.error:
        break; // Обрабатывается BlocListener
    }
  }

  void _showGeoServiceDialog(BuildContext context) {
    final l10n = context.l10n;

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.geoServiceDisabledTitle),
        content: Text(l10n.geoServiceDisabledMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              GeoService().openLocationSettings();
            },
            child: Text(l10n.geoOpenSettings),
          ),
        ],
      ),
    );
  }

  void _showOpenSettingsDialog(BuildContext context) {
    final l10n = context.l10n;

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.geoPermissionDeniedForeverTitle),
        content: Text(l10n.geoPermissionDeniedForeverMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              GeoService().openAppSettings();
            },
            child: Text(l10n.geoOpenAppSettings),
          ),
        ],
      ),
    );
  }
}
