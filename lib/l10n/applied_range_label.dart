import 'package:flutter/widgets.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Подпись фактически применённого окна (из `range_from`/`range_to` статистики
/// либо `period` payroll-ответа), в настенном времени явного [timeContext].
/// Поддерживает открытые границы: «за 01.06.2026 – 10.06.2026», «с
/// 01.06.2026», «по 10.06.2026». Обе границы пусты — `null` (подпись не
/// рисуется).
String? appliedRangeLabel(
  BuildContext context,
  DateTime? from,
  DateTime? to,
  AppTimeContext timeContext,
) {
  final l10n = context.l10n;
  const appTime = AppTime();
  final fromStr = from == null ? null : appTime.formatDate(from, timeContext);
  final toStr = to == null ? null : appTime.formatDate(to, timeContext);

  if (fromStr != null && toStr != null) {
    return l10n.statsAppliedRange(fromStr, toStr);
  }
  if (fromStr != null) return l10n.dateRangeChipFromOnly(fromStr);
  if (toStr != null) return l10n.dateRangeChipToOnly(toStr);
  return null;
}
