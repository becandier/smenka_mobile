import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Результат выбора в модалке диапазона дат.
///
/// [from] и [to] — выбранные **локальные календарные дни** (без времени).
/// Допустим открытый диапазон: заполнена только одна из границ.
///
/// `from == null && to == null` — пользователь нажал «Сбросить».
/// Если модалку закрыли свайпом/тапом по фону — роут вернёт `null` целиком,
/// и вызывающая сторона фильтр НЕ меняет.
class DateRangePickerResult {
  const DateRangePickerResult({this.from, this.to});

  /// Локальный календарный день нижней границы.
  final DateTime? from;

  /// Локальный календарный день верхней границы.
  final DateTime? to;

  /// Сброс диапазона (обе границы пусты).
  bool get isEmpty => from == null && to == null;

  /// Начало дня [from] (00:00:00 локали) в UTC — для отправки на бэк.
  DateTime? get fromUtc {
    final day = from;
    if (day == null) return null;
    return DateTime(day.year, day.month, day.day).toUtc();
  }

  /// Конец дня [to] (23:59:59 локали) в UTC — для отправки на бэк.
  DateTime? get toUtc {
    final day = to;
    if (day == null) return null;
    return DateTime(day.year, day.month, day.day, 23, 59, 59).toUtc();
  }
}

/// Граница диапазона, активная в календаре.
enum _ActiveBound { from, to }

@RoutePage()
class DateRangePickerPage extends StatefulWidget {
  const DateRangePickerPage({
    this.initialFrom,
    this.initialTo,
    super.key,
  });

  /// Предзаполненная нижняя граница (локальный день).
  final DateTime? initialFrom;

  /// Предзаполненная верхняя граница (локальный день).
  final DateTime? initialTo;

  @override
  State<DateRangePickerPage> createState() => _DateRangePickerPageState();
}

class _DateRangePickerPageState extends State<DateRangePickerPage> {
  static final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  DateTime? _from;
  DateTime? _to;
  _ActiveBound _activeBound = _ActiveBound.from;

  @override
  void initState() {
    super.initState();
    _from = _truncateToDay(widget.initialFrom);
    _to = _truncateToDay(widget.initialTo);
  }

  DateTime? _truncateToDay(DateTime? value) {
    if (value == null) return null;
    return DateTime(value.year, value.month, value.day);
  }

  bool get _isInvalidRange {
    final from = _from;
    final to = _to;
    return from != null && to != null && from.isAfter(to);
  }

  DateTime get _today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  DateTime? _clampToCalendar(DateTime? day, DateTime firstDate) {
    if (day == null) return null;
    if (day.isAfter(_today)) return _today;
    if (day.isBefore(firstDate)) return firstDate;
    return day;
  }

  void _onDateChanged(DateTime date) {
    final day = DateTime(date.year, date.month, date.day);
    setState(() {
      switch (_activeBound) {
        case _ActiveBound.from:
          _from = day;
          // После выбора «С» сразу переключаемся на «По» — типичный
          // сценарий заполнения диапазона слева направо.
          _activeBound = _ActiveBound.to;
        case _ActiveBound.to:
          _to = day;
      }
    });
  }

  void _apply() {
    context.router.maybePop(DateRangePickerResult(from: _from, to: _to));
  }

  void _reset() {
    context.router.maybePop(const DateRangePickerResult());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final firstDate = DateTime(2020);
    final activeValue = _activeBound == _ActiveBound.from ? _from : _to;
    final calendarInitial = _clampToCalendar(activeValue, firstDate);

    return AppBottomSheet(
      title: l10n.dateRangeFilterTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: _BoundField(
                  label: l10n.dateRangeFrom,
                  value: _from,
                  formatter: _dateFormat,
                  isActive: _activeBound == _ActiveBound.from,
                  onTap: () => setState(() => _activeBound = _ActiveBound.from),
                  onClear:
                      _from == null ? null : () => setState(() => _from = null),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _BoundField(
                  label: l10n.dateRangeTo,
                  value: _to,
                  formatter: _dateFormat,
                  isActive: _activeBound == _ActiveBound.to,
                  onTap: () => setState(() => _activeBound = _ActiveBound.to),
                  onClear:
                      _to == null ? null : () => setState(() => _to = null),
                ),
              ),
            ],
          ),
          CalendarDatePicker(
            // Пересоздаём календарь при смене активной границы/значения,
            // чтобы он показывал месяц и выделение актуальной даты.
            key: ValueKey('$_activeBound-$calendarInitial'),
            initialDate: calendarInitial,
            firstDate: firstDate,
            lastDate: _today,
            onDateChanged: _onDateChanged,
          ),
          if (_isInvalidRange) ...[
            Text(
              l10n.errorInvalidDateRange,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.appColors.error,
                  ),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: l10n.dateRangeReset,
                  isOutlined: true,
                  onPressed: _reset,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  label: l10n.dateRangeApply,
                  isEnabled: !_isInvalidRange,
                  onPressed: _apply,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BoundField extends StatelessWidget {
  const _BoundField({
    required this.label,
    required this.value,
    required this.formatter,
    required this.isActive,
    required this.onTap,
    this.onClear,
  });

  final String label;
  final DateTime? value;
  final DateFormat formatter;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final day = value;

    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isActive
              ? colors.primary
              : colors.secondary.withValues(alpha: 0.3),
          width: isActive ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      day != null ? formatter.format(day) : '—',
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              if (onClear != null)
                IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  visualDensity: VisualDensity.compact,
                  onPressed: onClear,
                )
              else
                const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
