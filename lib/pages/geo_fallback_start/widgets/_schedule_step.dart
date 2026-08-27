part of '../view/geo_fallback_start_page.dart';

/// Шаг 2 — график работы. Набор резолвится по выбранной точке
/// (`my-schedules?work_location_id=…`), правила выбора те же, что и в обычном
/// старте: 0 вариантов при `require_schedule` — старт закрыт, 1 —
/// подставляется сам, >1 — выбор обязателен.
class _ScheduleStep extends StatelessWidget {
  const _ScheduleStep({
    required this.state,
    required this.organizationTimezone,
  });

  final GeoFallbackStartState state;
  final String organizationTimezone;

  Future<void> _openPicker(BuildContext context) async {
    final cubit = context.read<GeoFallbackStartCubit>();
    final result = await context.router.push<WorkSchedulePickerResult?>(
      WorkSchedulePickerRoute(
        schedules: state.availableSchedules,
        selectedScheduleId: state.workScheduleId,
        earlyStartMinutes: state.earlyStartMinutes,
        organizationTimezone: organizationTimezone,
      ),
    );
    if (result != null) cubit.selectWorkSchedule(result.schedule);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final selected = state.selectedWorkSchedule;

    final String label;
    VoidCallback? onTap;
    if (state.workLocation == null) {
      label = l10n.geoFallbackScheduleLocationFirst;
    } else if (state.schedules.isLoading) {
      label = l10n.loading;
    } else if (state.availableSchedules.isEmpty) {
      label = state.requireSchedule
          ? l10n.geoFallbackScheduleEmpty
          : l10n.geoFallbackScheduleNotRequired;
    } else {
      label = selected?.name ?? l10n.geoFallbackScheduleSelect;
      if (!state.isSubmitting) onTap = () => _openPicker(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StepTitle(l10n.geoFallbackScheduleStep),
        const SizedBox(height: 8),
        _StepField(
          icon: Icons.schedule_outlined,
          label: label,
          isPlaceholder: selected == null,
          onTap: onTap,
        ),
        if (state.schedules.error case final message?) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  localizedErrorMessage(
                    context,
                    code: state.schedules.errorCode,
                    fallback: message,
                  ),
                  style: textTheme.bodySmall?.copyWith(color: colors.error),
                ),
              ),
              TextButton(
                onPressed: () =>
                    context.read<GeoFallbackStartCubit>().loadSchedules(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
