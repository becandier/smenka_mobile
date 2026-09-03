import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_period_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_period_state.dart';

/// Кубит по умолчанию считает границы в контексте устройства, пока
/// `ShiftHistoryPage` не резолвит контекст экрана через [applyContext].
const _device = AppTimeContext.device();

void main() {
  test('по умолчанию — пресет «неделя» с вычисленными границами (UTC)', () {
    final cubit = ShiftHistoryPeriodCubit();
    final expected = PeriodPreset.week.boundsUtc(DateTime.now().toUtc(), _device);

    expect(cubit.state.selectedPreset, PeriodPreset.week);
    expect(cubit.state.dateFrom, expected.fromUtc);
    expect(cubit.state.dateTo, expected.toUtc);
    expect(cubit.state.isCustomRange, isFalse);
    unawaited(cubit.close());
  });

  test('changePeriod(month) пересчитывает границы под месяц', () {
    final cubit = ShiftHistoryPeriodCubit()..changePeriod(PeriodPreset.month);
    final expected = PeriodPreset.month.boundsUtc(DateTime.now().toUtc(), _device);

    expect(cubit.state.selectedPreset, PeriodPreset.month);
    expect(cubit.state.dateFrom, expected.fromUtc);
    expect(cubit.state.dateTo, expected.toUtc);
    unawaited(cubit.close());
  });

  test('changePeriod с тем же пресетом не эмитит новое состояние', () {
    final cubit = ShiftHistoryPeriodCubit();
    final states = <ShiftHistoryPeriodState>[];
    final subscription = cubit.stream.listen(states.add);

    cubit.changePeriod(PeriodPreset.week);

    expect(states, isEmpty);
    unawaited(subscription.cancel());
    unawaited(cubit.close());
  });

  test('setCustomRange задаёт произвольное окно и снимает пресет', () {
    final dateFrom = DateTime.utc(2026, 6);
    final dateTo = DateTime.utc(2026, 6, 10, 23, 59, 59);
    final cubit = ShiftHistoryPeriodCubit()..setCustomRange(dateFrom, dateTo);

    expect(cubit.state.selectedPreset, isNull);
    expect(cubit.state.isCustomRange, isTrue);
    expect(cubit.state.dateFrom, dateFrom);
    expect(cubit.state.dateTo, dateTo);
    unawaited(cubit.close());
  });

  test('setCustomRange допускает открытую границу (только одна из дат)', () {
    final dateFrom = DateTime.utc(2026, 6);
    final cubit = ShiftHistoryPeriodCubit()..setCustomRange(dateFrom, null);

    expect(cubit.state.isCustomRange, isTrue);
    expect(cubit.state.dateFrom, dateFrom);
    expect(cubit.state.dateTo, isNull);
    unawaited(cubit.close());
  });

  test('setCustomRange(null, null) возвращает дефолтный пресет «неделя»', () {
    final cubit = ShiftHistoryPeriodCubit()
      ..setCustomRange(DateTime.utc(2026, 6), DateTime.utc(2026, 6, 10))
      ..setCustomRange(null, null);

    final expected = PeriodPreset.week.boundsUtc(DateTime.now().toUtc(), _device);

    expect(cubit.state.selectedPreset, PeriodPreset.week);
    expect(cubit.state.isCustomRange, isFalse);
    expect(cubit.state.dateFrom, expected.fromUtc);
    expect(cubit.state.dateTo, expected.toUtc);
    unawaited(cubit.close());
  });
}
