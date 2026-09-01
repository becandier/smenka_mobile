part of '../view/shift_history_page.dart';

/// Карточка над списком: единый выбор периода (`shift_history_earnings/
/// mobile.md`, «A») + время/количество смен + заработок за период («B»,
/// только при контексте конкретной организации).
class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Material(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _PeriodSelector(),
              SizedBox(height: 16),
              _StatsContent(),
              _EarningsSummary(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Единый источник окна периода экрана: сегменты «Неделя»/«Месяц»
/// (пресет «День» этому экрану не показывается — mobile.md, «A») плюс
/// произвольный диапазон. Управляет списком, статистикой и заработком
/// одновременно — см. `ShiftHistoryPage._applyPeriod`.
class _PeriodSelector extends StatelessWidget {
  const _PeriodSelector();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<ShiftHistoryPeriodCubit>();
    final state = cubit.state;
    final result = await context.router.push<DateRangePickerResult?>(
      DateRangePickerRoute(
        initialFrom: state.isCustomRange ? state.dateFrom?.toLocal() : null,
        initialTo: state.isCustomRange ? state.dateTo?.toLocal() : null,
      ),
    );
    if (result != null) {
      cubit.setCustomRange(result.fromUtc, result.toUtc);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ShiftHistoryPeriodCubit, ShiftHistoryPeriodState>(
      builder: (context, state) {
        final selectedPreset = state.selectedPreset;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SegmentedButton<PeriodPreset>(
              segments: [
                ButtonSegment(
                  value: PeriodPreset.week,
                  label: Text(context.l10n.statsPeriodWeek),
                ),
                ButtonSegment(
                  value: PeriodPreset.month,
                  label: Text(context.l10n.statsPeriodMonth),
                ),
              ],
              selected: selectedPreset == null
                  ? const <PeriodPreset>{}
                  : {selectedPreset},
              emptySelectionAllowed: true,
              onSelectionChanged: (selection) {
                final preset = selection.firstOrNull;
                if (preset == null) return;
                context.read<ShiftHistoryPeriodCubit>().changePeriod(preset);
              },
              showSelectedIcon: false,
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: WidgetStatePropertyAll(textTheme.labelMedium),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: DateRangeFilterChip(
                from: state.isCustomRange ? state.dateFrom : null,
                to: state.isCustomRange ? state.dateTo : null,
                label: context.l10n.statsModeCustom,
                onTap: () => _openDateRangePicker(context),
                onClear: () => context
                    .read<ShiftHistoryPeriodCubit>()
                    .setCustomRange(null, null),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Время и количество смен за период (`ShiftStatsCubit`) — окно приходит
/// извне от `ShiftHistoryPeriodCubit`, кубит его не выбирает сам.
class _StatsContent extends StatelessWidget {
  const _StatsContent();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SectionDataWrapper<ShiftStatsCubit, ShiftStatsState, ShiftStats>(
        selector: (state) => state.stats,
        onRetry: () => context.read<ShiftStatsCubit>().loadStats(),
        contentBuilder: (stats) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    value: _formatDuration(context, stats.totalWorkedSeconds),
                    label: context.l10n.statsTotalWorked,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    value: stats.shiftCount.toString(),
                    label: context.l10n.statsShiftCount,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    value: _formatDuration(context, stats.averageShiftSeconds),
                    label: context.l10n.statsAverage,
                  ),
                ),
              ],
            ),
            if (appliedRangeLabel(context, stats.rangeFrom, stats.rangeTo)
                case final rangeLabel?) ...[
              const SizedBox(height: 12),
              Text(
                rangeLabel,
                style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDuration(BuildContext context, int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    return context.l10n.statsHours(hours, minutes);
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(color: colors.secondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Заработок за период (`ShiftEarningsCubit`) — только при выбранном
/// контексте конкретной организации (mobile.md, «B»): персональные смены
/// и «все смены» заработка не имеют в принципе (ADR-005 п.8), блок не
/// рисуется вовсе (не «0 ₽»).
///
/// Грузится отдельным запросом независимо от времени/количества смен
/// ([_StatsContent]): пока заработок в пути — плейсхолдер, время уже
/// видно. Ошибка запроса заработка не ломает остальной экран.
class _EarningsSummary extends StatelessWidget {
  const _EarningsSummary();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftEarningsCubit, ShiftEarningsState>(
      buildWhen: (prev, curr) =>
          prev.scope != curr.scope || prev.earnings != curr.earnings,
      builder: (context, state) {
        if (state.scope != ShiftScope.organization) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child:
              SectionDataWrapper<
                ShiftEarningsCubit,
                ShiftEarningsState,
                MyEarnings
              >(
                selector: (s) => s.earnings,
                onRetry: () => context.read<ShiftEarningsCubit>().retry(),
                loadingBuilder: () => const AppShimmerLoader(
                  itemCount: 1,
                  padding: EdgeInsets.zero,
                ),
                contentBuilder: (earnings) =>
                    _EarningsContent(earnings: earnings),
              ),
        );
      },
    );
  }
}

class _EarningsContent extends StatelessWidget {
  const _EarningsContent({required this.earnings});

  final MyEarnings earnings;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final net = earnings.netAmountMinor;

    return Column(
      children: [
        Divider(height: 1, color: colors.line),
        const SizedBox(height: 12),
        Text(
          l10n.payrollToPay,
          style: textTheme.bodySmall?.copyWith(color: colors.secondary),
        ),
        const SizedBox(height: 4),
        Text(
          formatMoneyMinor(net),
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: net < 0 ? colors.error : null,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 4,
          children: [
            Text(
              '${l10n.payrollAccrued} '
              '${formatMoneyMinor(earnings.grossAmountMinor)}',
              style: textTheme.bodySmall?.copyWith(color: colors.secondary),
            ),
            if (earnings.penaltyAmountMinor != 0)
              Text(
                '${l10n.finesAmount} '
                '−${formatMoneyMinor(earnings.penaltyAmountMinor)}',
                style: textTheme.bodySmall?.copyWith(color: colors.error),
              ),
            if (earnings.adjustmentAmountMinor != 0)
              Text(
                '${l10n.shiftHistoryAdjustments} '
                '${earnings.adjustmentAmountMinor >= 0 ? '+' : ''}'
                '${formatMoneyMinor(earnings.adjustmentAmountMinor)}',
                style: textTheme.bodySmall?.copyWith(
                  color: earnings.adjustmentAmountMinor >= 0
                      ? colors.success
                      : colors.error,
                ),
              ),
          ],
        ),
        if (earnings.hasMissingRate) ...[
          const SizedBox(height: 8),
          Text(
            l10n.payrollMissingRateBadge,
            style: textTheme.bodySmall?.copyWith(color: colors.warning),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
