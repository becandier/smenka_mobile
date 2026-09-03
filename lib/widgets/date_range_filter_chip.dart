import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Чип фильтра по диапазону дат.
///
/// [from]/[to] — границы диапазона как UTC-моменты (как они хранятся в
/// стейте кубита); для отображения переводятся в настенное время явного
/// [timeContext] (устройство либо IANA-зона организации экрана — общий
/// фильтр не может одновременно представлять сутки нескольких организаций).
/// Подписи: «01.06.2026 – 09.06.2026», «с 01.06.2026», «по 09.06.2026»;
/// без диапазона — [label].
///
/// Тап — открыть пикер ([onTap]), крестик — сбросить диапазон ([onClear],
/// показывается только при активном диапазоне).
class DateRangeFilterChip extends StatelessWidget {
  const DateRangeFilterChip({
    required this.from,
    required this.to,
    required this.label,
    required this.timeContext,
    required this.onTap,
    required this.onClear,
    super.key,
  });

  final DateTime? from;
  final DateTime? to;

  /// Подпись чипа, когда диапазон не задан.
  final String label;

  final AppTimeContext timeContext;

  final VoidCallback onTap;
  final VoidCallback onClear;

  bool get _hasRange => from != null || to != null;

  String _chipLabel(BuildContext context) {
    final l10n = context.l10n;
    const appTime = AppTime();
    final fromMoment = from;
    final toMoment = to;
    final fromStr = fromMoment == null
        ? null
        : appTime.formatDate(fromMoment, timeContext);
    final toStr = toMoment == null
        ? null
        : appTime.formatDate(toMoment, timeContext);

    if (fromStr != null && toStr != null) {
      return l10n.dateRangeChipBoth(fromStr, toStr);
    }
    if (fromStr != null) return l10n.dateRangeChipFromOnly(fromStr);
    if (toStr != null) return l10n.dateRangeChipToOnly(toStr);
    return label;
  }

  @override
  Widget build(BuildContext context) {
    return InputChip(
      avatar: const Icon(Icons.date_range_outlined, size: 18),
      label: Text(_chipLabel(context)),
      selected: _hasRange,
      showCheckmark: false,
      onPressed: onTap,
      onDeleted: _hasRange ? onClear : null,
    );
  }
}
