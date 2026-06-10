import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/date_range_filter_chip.dart';

/// Селектор окна периода для payroll-экранов: пресеты
/// «Сегодня / Неделя / Месяц» (SegmentedButton) либо произвольный
/// диапазон (чип, открывающий date-range picker). Ровно один источник
/// окна: при активном диапазоне пресеты не выделены.
class PeriodPresetSelector extends StatelessWidget {
  const PeriodPresetSelector({
    required this.preset,
    required this.customFrom,
    required this.customTo,
    required this.onPresetChanged,
    required this.onCustomTap,
    required this.onCustomClear,
    super.key,
  });

  /// Активный пресет; null — активен произвольный диапазон.
  final PeriodPreset? preset;

  /// Границы произвольного диапазона (UTC) — для подписи чипа.
  final DateTime? customFrom;
  final DateTime? customTo;

  final ValueChanged<PeriodPreset> onPresetChanged;
  final VoidCallback onCustomTap;
  final VoidCallback onCustomClear;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final selectedPreset = preset;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SegmentedButton<PeriodPreset>(
          segments: [
            ButtonSegment(
              value: PeriodPreset.day,
              label: Text(l10n.statsPeriodDay),
            ),
            ButtonSegment(
              value: PeriodPreset.week,
              label: Text(l10n.statsPeriodWeek),
            ),
            ButtonSegment(
              value: PeriodPreset.month,
              label: Text(l10n.statsPeriodMonth),
            ),
          ],
          selected: selectedPreset == null
              ? const <PeriodPreset>{}
              : {selectedPreset},
          emptySelectionAllowed: true,
          onSelectionChanged: (selection) {
            final value = selection.firstOrNull;
            if (value == null) return;
            onPresetChanged(value);
          },
          showSelectedIcon: false,
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: WidgetStatePropertyAll(textTheme.labelMedium),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: DateRangeFilterChip(
            from: customFrom,
            to: customTo,
            label: l10n.statsModeCustom,
            onTap: onCustomTap,
            onClear: onCustomClear,
          ),
        ),
      ],
    );
  }
}
