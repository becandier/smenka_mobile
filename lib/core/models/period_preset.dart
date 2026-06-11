/// Пресет окна периода для payroll-экранов («Мой заработок», «Зарплата»).
///
/// В отличие от статистики, эндпоинты payroll не принимают `period` —
/// окно всегда передаётся парой `date_from`/`date_to`; пресет лишь
/// вычисляет границы на клиенте (локальные дни → UTC, обе включительно).
enum PeriodPreset { day, week, month }

extension PeriodPresetBounds on PeriodPreset {
  /// Границы пресета относительно [nowLocal]: начало первого дня
  /// (00:00:00 локали) и конец последнего (23:59:59 локали), в UTC.
  /// Неделя — с понедельника, месяц — календарный.
  ({DateTime fromUtc, DateTime toUtc}) boundsUtc(DateTime nowLocal) {
    final today = DateTime(nowLocal.year, nowLocal.month, nowLocal.day);

    final (DateTime start, DateTime end) = switch (this) {
      PeriodPreset.day => (
          today,
          DateTime(today.year, today.month, today.day, 23, 59, 59),
        ),
      PeriodPreset.week => () {
          final monday = DateTime(
            today.year,
            today.month,
            today.day - (today.weekday - 1),
          );
          return (
            monday,
            DateTime(monday.year, monday.month, monday.day + 6, 23, 59, 59),
          );
        }(),
      PeriodPreset.month => (
          DateTime(today.year, today.month),
          DateTime(today.year, today.month + 1, 0, 23, 59, 59),
        ),
    };

    return (fromUtc: start.toUtc(), toUtc: end.toUtc());
  }
}
