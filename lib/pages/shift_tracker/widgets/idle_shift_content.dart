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
    final l10n = context.l10n;
    final result = await cubit.startShift();

    if (!context.mounted) return;

    switch (result) {
      case StartShiftResult.success:
        context.modals.showSuccess(l10n.shiftStarted);
      case StartShiftResult.geoServiceDisabled:
        // native: сервис геолокации выключен → диалог + системные настройки.
        await showGeoServiceDisabledDialog(context, GeoService());
      case StartShiftResult.geoPermissionDenied:
        // Короткий тост; повтор — это повторное нажатие «Начать».
        context.modals.showError(l10n.geoPermissionDenied);
      case StartShiftResult.geoPermissionDeniedForever:
        // native: настройки приложения; web: инструкция по браузеру +
        // «Повторить» (без мёртвой кнопки настроек — она на web no-op).
        await showGeoDeniedForeverDialog(
          context,
          geoService: GeoService(),
          onRetry: () => _onStartShift(context),
        );
      case StartShiftResult.geoUnavailable:
        context.modals.showError(l10n.errorGeoUnavailable);
      case StartShiftResult.geoInsecureContext:
        context.modals.showError(l10n.geoInsecureContextMessage);
      case StartShiftResult.geoUnsupported:
        context.modals.showError(l10n.geoUnsupportedMessage);
      case StartShiftResult.error:
        break; // Обрабатывается BlocListener
    }
  }
}
