import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Чип фильтра по диапазону дат.
///
/// [from]/[to] — границы диапазона как UTC-инстансы (как они хранятся
/// в стейте кубита); для отображения конвертируются в локальное время.
/// Подписи: «01.06 – 09.06», «с 01.06», «по 09.06»; без диапазона — [label].
///
/// Тап — открыть пикер ([onTap]), крестик — сбросить диапазон ([onClear],
/// показывается только при активном диапазоне).
class DateRangeFilterChip extends StatelessWidget {
  const DateRangeFilterChip({
    required this.from,
    required this.to,
    required this.label,
    required this.onTap,
    required this.onClear,
    super.key,
  });

  static final DateFormat _dateFormat = DateFormat('dd.MM');

  final DateTime? from;
  final DateTime? to;

  /// Подпись чипа, когда диапазон не задан.
  final String label;

  final VoidCallback onTap;
  final VoidCallback onClear;

  bool get _hasRange => from != null || to != null;

  String _chipLabel(BuildContext context) {
    final l10n = context.l10n;
    final fromLocal = from?.toLocal();
    final toLocal = to?.toLocal();

    if (fromLocal != null && toLocal != null) {
      return l10n.dateRangeChipBoth(
        _dateFormat.format(fromLocal),
        _dateFormat.format(toLocal),
      );
    }
    if (fromLocal != null) {
      return l10n.dateRangeChipFromOnly(_dateFormat.format(fromLocal));
    }
    if (toLocal != null) {
      return l10n.dateRangeChipToOnly(_dateFormat.format(toLocal));
    }
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
