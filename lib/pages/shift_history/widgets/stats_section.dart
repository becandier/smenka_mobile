part of '../view/shift_history_page.dart';

class _StatsSection extends StatelessWidget {
  const _StatsSection();

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
              // Period segmented control
              BlocSelector<ShiftStatsCubit, ShiftStatsState, StatsPeriod>(
                selector: (state) => state.selectedPeriod,
                builder: (context, selectedPeriod) {
                  return SegmentedButton<StatsPeriod>(
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
                    selected: {selectedPeriod},
                    onSelectionChanged: (selection) {
                      context
                          .read<ShiftStatsCubit>()
                          .changePeriod(selection.first);
                    },
                    showSelectedIcon: false,
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: WidgetStatePropertyAll(
                        textTheme.labelMedium,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Stats content
              SectionDataWrapper<ShiftStatsCubit, ShiftStatsState, ShiftStats>(
                selector: (state) => state.stats,
                onRetry: () => context.read<ShiftStatsCubit>().loadStats(),
                contentBuilder: (stats) => Row(
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
              ),
            ],
          ),
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
