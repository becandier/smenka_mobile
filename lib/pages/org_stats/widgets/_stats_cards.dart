part of '../view/org_stats_page.dart';

class _StatsCards extends StatelessWidget {
  const _StatsCards({required this.stats});

  final OrgStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              value: _formatDuration(context, stats.totalWorkedSeconds),
              title: l10n.orgStatsTotalHours,
              color: colors.primary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              value: stats.shiftCount.toString(),
              title: l10n.orgStatsShiftCount,
              color: colors.success,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              value: _formatDuration(context, stats.averageShiftSeconds),
              title: l10n.orgStatsAvgShift,
              color: colors.info,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(BuildContext context, int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    return context.l10n.statsHours(hours, minutes);
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.title,
    required this.color,
  });

  final String value;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 16,
          bottom: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: color,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: textTheme.bodySmall?.copyWith(
                color: color.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
