part of '../view/org_stats_page.dart';

class _StatsChart extends StatelessWidget {
  const _StatsChart({required this.employees});

  final List<EmployeeStats> employees;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    // Sort by hours desc, take top 10
    final sorted = List<EmployeeStats>.of(employees)
      ..sort((a, b) => b.totalWorkedSeconds.compareTo(a.totalWorkedSeconds));
    final top = sorted.take(10).toList();

    if (top.isEmpty) return const SizedBox.shrink();

    final maxHours = top.first.totalWorkedSeconds / 3600;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Material(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.orgStatsChartTitle,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: top.length * 40.0 + 16,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxHours > 0 ? maxHours * 1.1 : 1,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(),
                      rightTitles: const AxisTitles(),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              meta: meta,
                              child: Text(
                                '${value.toInt()}h',
                                style: textTheme.labelSmall?.copyWith(
                                  color: colors.secondary,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 100,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index < 0 || index >= top.length) {
                              return const SizedBox.shrink();
                            }
                            final name = _shortenName(top[index].userName);
                            return SideTitleWidget(
                              meta: meta,
                              child: Text(
                                name,
                                style: textTheme.labelSmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    barGroups: List.generate(top.length, (index) {
                      final hours = top[index].totalWorkedSeconds / 3600;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: hours,
                            color: colors.primary,
                            width: 16,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }),
                    groupsSpace: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _shortenName(String name) {
    final parts = name.trim().split(' ');
    if (parts.length <= 1) return name;
    final first = parts.first;
    final lastInitial = parts.last.isNotEmpty ? '${parts.last[0]}.' : '';
    return '$first $lastInitial';
  }
}
