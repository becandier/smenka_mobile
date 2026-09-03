import 'package:smenka_mobile/core/time/app_time.dart';

/// Пресет окна периода для payroll-экранов («Мой заработок», «Зарплата»).
///
/// В отличие от статистики, эндпоинты payroll не принимают `period` —
/// окно всегда передаётся парой `date_from`/`date_to`; пресет лишь
/// вычисляет границы на клиенте (календарные дни контекста → UTC).
enum PeriodPreset { day, week, month }

extension PeriodPresetBounds on PeriodPreset {
  /// Границы пресета относительно [nowUtc] (текущий UTC-момент) в [context]:
  /// начало первого дня и конец последнего (оба — календарные сутки
  /// [context], переведённые в UTC через `AppTime.utcBoundsForDay` — в
  /// организационном контексте это IANA-сутки, 23/25 часов в дни DST, а не
  /// безусловные 24 часа). Неделя — с понедельника, месяц — календарный.
  ({DateTime fromUtc, DateTime toUtc}) boundsUtc(
    DateTime nowUtc,
    AppTimeContext context,
  ) {
    const appTime = AppTime();
    final wallNow = appTime.wallTime(nowUtc, context);
    final today = DateTime(wallNow.year, wallNow.month, wallNow.day);

    final (DateTime startDay, DateTime endDay) = switch (this) {
      PeriodPreset.day => (today, today),
      PeriodPreset.week => () {
        final monday = DateTime(
          today.year,
          today.month,
          today.day - (today.weekday - 1),
        );
        final sunday = DateTime(monday.year, monday.month, monday.day + 6);
        return (monday, sunday);
      }(),
      PeriodPreset.month => (
        DateTime(today.year, today.month),
        DateTime(today.year, today.month + 1, 0),
      ),
    };

    return (
      fromUtc: appTime.utcBoundsForDay(startDay, context).fromUtc,
      toUtc: appTime.utcBoundsForDay(endDay, context).toUtc,
    );
  }
}
