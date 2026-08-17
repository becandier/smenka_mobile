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
            if (state.showSchedulePreview) ...[
              _WorkScheduleSelector(state: state),
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
    await _handleStartShiftResult(context, result);
  }

  Future<void> _handleStartShiftResult(
    BuildContext context,
    StartShiftResult result,
  ) async {
    final cubit = context.read<ShiftTrackerCubit>();
    final l10n = context.l10n;

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
      case StartShiftResult.scheduleSelectionRequired:
        // Гео-check организация, точка резолвлена, графиков >1 — та же
        // модалка, что и на idle-экране для организаций без гео-проверки
        // (см. _WorkScheduleSelector), только поверх экрана трекера.
        final pickerResult = await _pushWorkSchedulePicker(
          context,
          cubit.state,
        );
        if (!context.mounted) return;
        // Закрыто свайпом/тапом по фону без выбора — старт не продолжаем,
        // кнопка «Начать» уже разблокирована (см. ShiftTrackerCubit).
        if (pickerResult == null) return;
        final continueResult = await cubit.continueStartAfterScheduleSelection(
          pickerResult.schedule,
        );
        if (!context.mounted) return;
        await _handleStartShiftResult(context, continueResult);
    }
  }
}

/// Открывает модалку выбора графика (`WorkSchedulePickerRoute`) поверх
/// текущего экрана и возвращает выбор сотрудника (`null` — закрыто без
/// выбора). Общая точка входа для idle-экрана (`_WorkScheduleSelector`,
/// организации без гео-проверки) и продолжения старта у гео-check
/// организаций (`_IdleShiftContent._handleStartShiftResult`), см.
/// docs/tasks/work_schedules_geo_resolve/mobile.md.
Future<WorkSchedulePickerResult?> _pushWorkSchedulePicker(
  BuildContext context,
  ShiftTrackerState state,
) {
  return context.router.push<WorkSchedulePickerResult?>(
    WorkSchedulePickerRoute(
      schedules: state.availableSchedules,
      selectedScheduleId: state.selectedWorkScheduleId,
      earlyStartMinutes: state.earlyStartMinutes,
      organizationTimezone:
          state.selectedOrganization?.timezone ?? 'Europe/Moscow',
    ),
  );
}
