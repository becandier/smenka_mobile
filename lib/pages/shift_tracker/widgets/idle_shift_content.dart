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
      // Все ветки гео-отказа ведут в один диалог: текст он выбирает по типу
      // GeoFailure и уровню блокировки, а набор действий («Повторить»,
      // «Как исправить», системные настройки) — по платформе. См.
      // docs/tasks/geo_troubleshooting/mobile.md.
      case StartShiftResult.geoServiceDisabled ||
          StartShiftResult.geoPermissionDenied ||
          StartShiftResult.geoPermissionDeniedForever ||
          StartShiftResult.geoUnavailable ||
          StartShiftResult.geoInsecureContext ||
          StartShiftResult.geoUnsupported:
        await _handleGeoFailure(context);
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

  /// Диалог финальной гео-неудачи + отработка выбранного действия.
  ///
  /// Сам отказ берём из состояния кубита ([ShiftTrackerState.lastGeoFailure]),
  /// а не из ветки [StartShiftResult]: диалогу нужен объект таксономии, а не
  /// выведенная из enum строка.
  Future<void> _handleGeoFailure(BuildContext context) async {
    final cubit = context.read<ShiftTrackerCubit>();
    final failure = cubit.state.lastGeoFailure;
    // Защита от гонки: пока диалог собирался, состояние успели перезаписать.
    if (failure == null) return;

    final action = await showGeoFailureDialog(
      context,
      failure: failure,
      blockLevel: cubit.state.geoBlockLevel,
      // Фолбэк по фото — только в организации с геопроверкой (координаты там
      // и требуются). Серверный GEO_CHECK_FAILED сюда не приходит вовсе: он
      // прилетает как ошибка действия, а не как GeoFailure, — обходить
      // «вне зоны» фотографией нельзя.
      allowPhotoFallback:
          cubit.state.selectedOrganization?.geoCheckEnabled ?? false,
    );
    if (!context.mounted) return;

    switch (action) {
      case GeoFailureAction.retry:
        await _onStartShift(context);
      case GeoFailureAction.howToFix:
        await context.router.root.push(const GeoDiagnosticsRoute());
      case GeoFailureAction.openAppSettings:
        await cubit.openGeoAppSettings();
      case GeoFailureAction.openLocationSettings:
        await cubit.openGeoLocationSettings();
      case GeoFailureAction.startWithPhoto:
        await _startWithPhoto(context, failure);
      case null:
        break;
    }
  }

  /// Фолбэк-старт по фото (`shift_geo_photo_fallback`). Отдельный экран со
  /// своим кубитом; связь с трекером — только через результат навигации:
  /// вернулась стартовавшая смена → трекер её принимает.
  Future<void> _startWithPhoto(BuildContext context, GeoFailure failure) async {
    final cubit = context.read<ShiftTrackerCubit>();
    final org = cubit.state.selectedOrganization;
    if (org == null) return;

    final shift = await context.router.push<Shift?>(
      GeoFallbackStartRoute(
        organizationId: org.id,
        // Машинный код фактически полученного отказа — не выведенная из
        // enum-ветки строка (см. ТЗ: «передавать code, не хардкодить»).
        geoFallbackReason: failure.code,
        organizationTimezone: org.timezone,
      ),
    );
    if (shift == null) return;
    cubit.adoptStartedShift(shift);
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
