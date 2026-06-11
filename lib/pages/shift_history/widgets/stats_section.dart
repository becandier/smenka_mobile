part of '../view/shift_history_page.dart';

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<ShiftStatsCubit>();
    final result = await context.router.push<DateRangePickerResult?>(
      DateRangePickerRoute(
        initialFrom: cubit.state.customFrom?.toLocal(),
        initialTo: cubit.state.customTo?.toLocal(),
      ),
    );
    if (result != null) {
      cubit.setCustomRange(result.fromUtc, result.toUtc);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Material(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Источник окна: пресет ЛИБО произвольный диапазон
              BlocBuilder<ShiftStatsCubit, ShiftStatsState>(
                buildWhen: (prev, curr) =>
                    prev.selectedPeriod != curr.selectedPeriod ||
                    prev.customFrom != curr.customFrom ||
                    prev.customTo != curr.customTo,
                builder: (context, state) {
                  final selectedPeriod = state.selectedPeriod;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SegmentedButton<StatsPeriod>(
                        segments: [
                          ButtonSegment(
                            value: StatsPeriod.day,
                            label: Text(context.l10n.statsPeriodDay),
                          ),
                          ButtonSegment(
                            value: StatsPeriod.week,
                            label: Text(context.l10n.statsPeriodWeek),
                          ),
                          ButtonSegment(
                            value: StatsPeriod.month,
                            label: Text(context.l10n.statsPeriodMonth),
                          ),
                        ],
                        selected: selectedPeriod == null
                            ? const <StatsPeriod>{}
                            : {selectedPeriod},
                        emptySelectionAllowed: true,
                        onSelectionChanged: (selection) {
                          final period = selection.firstOrNull;
                          if (period == null) return;
                          context.read<ShiftStatsCubit>().changePeriod(period);
                        },
                        showSelectedIcon: false,
                        style: ButtonStyle(
                          visualDensity: VisualDensity.compact,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          textStyle: WidgetStatePropertyAll(
                            textTheme.labelMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: DateRangeFilterChip(
                          from: state.customFrom,
                          to: state.customTo,
                          label: context.l10n.statsModeCustom,
                          onTap: () => _openDateRangePicker(context),
                          onClear: () => context
                              .read<ShiftStatsCubit>()
                              .changePeriod(StatsPeriod.day),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),

              // Stats content
              SectionDataWrapper<ShiftStatsCubit, ShiftStatsState, ShiftStats>(
                selector: (state) => state.stats,
                onRetry: () => context.read<ShiftStatsCubit>().loadStats(),
                contentBuilder: (stats) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _StatItem(
                            value: _formatDuration(
                              context,
                              stats.totalWorkedSeconds,
                            ),
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
                            value: _formatDuration(
                              context,
                              stats.averageShiftSeconds,
                            ),
                            label: context.l10n.statsAverage,
                          ),
                        ),
                      ],
                    ),
                    if (_appliedRangeLabel(context, stats)
                        case final rangeLabel?) ...[
                      const SizedBox(height: 12),
                      Text(
                        rangeLabel,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.secondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Подпись фактически применённого окна из `range_from`/`range_to`.
  String? _appliedRangeLabel(BuildContext context, ShiftStats stats) {
    final from = stats.rangeFrom;
    final to = stats.rangeTo;
    if (from == null || to == null) return null;
    final format = DateFormat('dd.MM.yyyy');
    return context.l10n.statsAppliedRange(
      format.format(from.toLocal()),
      format.format(to.toLocal()),
    );
  }

  String _formatDuration(BuildContext context, int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    return context.l10n.statsHours(hours, minutes);
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
  });

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
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colors.secondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
