part of '../view/shift_tracker_page.dart';

class _IdleShiftContent extends StatelessWidget {
  const _IdleShiftContent({required this.state});

  final ShiftTrackerState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;
    // Организации, доступные для смены (myRole != owner, shift_org_default) —
    // персональная смена в этот список не входит, это отдельная
    // второстепенная ссылка ниже кнопки «Начать» (см. _PersonalShiftLink).
    final orgs = state.availableOrganizations;
    final selectedOrgId = state.selectedOrganizationId;

    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заметный блок дозаполнения чек-листа последней смены
            // (checklist_grace_period, mobile.md п.2) — над остальным
            // содержимым idle-экрана, пока открыто окно.
            if (state.checklistGraceShift case final graceShift?) ...[
              _ChecklistGraceBlock(
                shift: graceShift,
                remaining: state.checklistGraceRemaining ?? Duration.zero,
              ),
              const SizedBox(height: 24),
            ],
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
            // Одна доступная организация — неинтерактивная плашка вместо
            // селектора (выбирать не из чего). Две и более — селектор.
            // Значение селектора всегда одна из [orgs] — предвыбор
            // (ShiftTrackerCubit._maybePreselectContext) гарантирует
            // selectedOrgId непустым, как только организации загружены.
            if (orgs.length == 1) ...[
              _SingleOrgBadge(organizationName: orgs.first.name),
              const SizedBox(height: 24),
            ] else if (orgs.length > 1 && selectedOrgId != null) ...[
              _OrgSelector(
                organizations: orgs,
                selectedOrganizationId: selectedOrgId,
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
            // Персональная смена — осознанный отдельный выбор, не дефолт
            // (shift_org_default, блок A): второстепенная ссылка, видна
            // только когда есть организационная альтернатива. При нуле
            // доступных организаций «Начать» выше и так стартует
            // персональную смену — ссылка и подтверждение не нужны.
            if (orgs.isNotEmpty) ...[
              const SizedBox(height: 12),
              _PersonalShiftLink(onTap: () => _onStartPersonalTapped(context)),
            ],
          ],
        ),
      ),
    );
  }

  /// Тап по «Начать персональную смену»: показывает модалку подтверждения
  /// (`shift_org_default`, блок B) и обрабатывает выбор. Закрытие
  /// свайпом/тапом по фону (`action == null`) — отмена, ничего не меняется.
  Future<void> _onStartPersonalTapped(BuildContext context) async {
    final cubit = context.read<ShiftTrackerCubit>();
    final orgs = cubit.state.availableOrganizations;
    final singleOrgName = orgs.length == 1 ? orgs.first.name : null;

    final action = await context.router.push<PersonalShiftConfirmAction?>(
      PersonalShiftConfirmRoute(singleOrganizationName: singleOrgName),
    );
    if (!context.mounted || action == null) return;

    switch (action) {
      case PersonalShiftConfirmAction.startOrganization:
        // Единственная доступная организация уже выбрана в состоянии
        // (плашка вместо селектора) — обычный флоу старта, как по «Начать».
        await _onStartShift(context);
      case PersonalShiftConfirmAction.startPersonal:
        final result = await cubit.startPersonalShift();
        if (!context.mounted) return;
        await _handleStartShiftResult(context, result);
    }
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

/// Неинтерактивная плашка «Смена в: <Название>» — заменяет селектор, когда
/// доступна ровно одна организация: выбирать не из чего, а раньше в этом
/// случае селектор либо не показывался вовсе, либо равноправно предлагал
/// персональную (тот самый баг, который чинит shift_org_default).
class _SingleOrgBadge extends StatelessWidget {
  const _SingleOrgBadge({required this.organizationName});

  final String organizationName;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.apartment_outlined, size: 18, color: colors.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                context.l10n.shiftOrgBadge(organizationName),
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Второстепенная ссылка «Начать персональную смену» под основной кнопкой
/// «Начать» (shift_org_default, блок A) — блёклым стилем, чтобы не выглядеть
/// равноправной альтернативой организационному старту. Тап ведёт в модалку
/// подтверждения (блок B), а не сразу стартует смену.
class _PersonalShiftLink extends StatelessWidget {
  const _PersonalShiftLink({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(context.l10n.shiftStartPersonalLink),
    );
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

/// Заметный блок «дозаполните чек-лист последней смены» — виден, пока
/// открыто окно дозаполнения (`checklist_grace_period`, mobile.md п.2).
/// Тап ведёт в уже существующий список чек-листов смены
/// (`ShiftChecklistsRoute`) — там же, где сотрудник заполняет чек-листы
/// активной смены, только для завершённой смены внутри окна.
class _ChecklistGraceBlock extends StatelessWidget {
  const _ChecklistGraceBlock({required this.shift, required this.remaining});

  final Shift shift;
  final Duration remaining;

  Future<void> _open(BuildContext context) async {
    final cubit = context.read<ShiftTrackerCubit>();
    await context.router.push(
      ShiftChecklistsRoute(
        shiftId: shift.id,
        organizationId: shift.organizationId,
      ),
    );
    if (!context.mounted) return;
    // Пользователь мог закрыть все обязательные пункты, либо окно истекло,
    // пока он был на экране чек-листов — перепроверяем без ожидания
    // следующего резюма/pull-to-refresh.
    await cubit.refreshChecklistGrace();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final minutesLeft = wholeMinutesCeil(remaining);

    return Material(
      color: colors.warning.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _open(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(Icons.timer_outlined, color: colors.warning),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.shiftTrackerGraceBlockTitle,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.checklistGraceRemainingMinutes(minutesLeft),
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colors.secondary.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
