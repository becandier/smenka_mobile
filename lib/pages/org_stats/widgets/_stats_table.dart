part of '../view/org_stats_page.dart';

class _StatsTable extends StatelessWidget {
  const _StatsTable({required this.employees});

  final List<EmployeeStats> employees;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final sorted = List<EmployeeStats>.of(employees)
      ..sort((a, b) => b.totalWorkedSeconds.compareTo(a.totalWorkedSeconds));

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Material(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              _TableRow(
                name: l10n.orgStatsTableName,
                shifts: l10n.orgStatsTableShifts,
                hours: l10n.orgStatsTableHours,
                avg: l10n.orgStatsTableAvg,
                isHeader: true,
                textTheme: textTheme,
                colors: colors,
              ),
              const Divider(height: 1),
              ...sorted.map(
                (employee) => _TableRow(
                  name: employee.userName,
                  shifts: employee.shiftCount.toString(),
                  hours: _formatHours(context, employee.totalWorkedSeconds),
                  avg: _formatHours(context, employee.averageShiftSeconds),
                  isHeader: false,
                  textTheme: textTheme,
                  colors: colors,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatHours(BuildContext context, int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    return context.l10n.statsHours(hours, minutes);
  }
}

class _TableRow extends StatelessWidget {
  const _TableRow({
    required this.name,
    required this.shifts,
    required this.hours,
    required this.avg,
    required this.isHeader,
    required this.textTheme,
    required this.colors,
  });

  final String name;
  final String shifts;
  final String hours;
  final String avg;
  final bool isHeader;
  final TextTheme textTheme;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    final style = isHeader
        ? textTheme.labelSmall?.copyWith(
            color: colors.secondary,
            fontWeight: FontWeight.w600,
          )
        : textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: style,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(shifts, style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: Text(hours, style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: Text(avg, style: style, textAlign: TextAlign.end),
          ),
        ],
      ),
    );
  }
}
