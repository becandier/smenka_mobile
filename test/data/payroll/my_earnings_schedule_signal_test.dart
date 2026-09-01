import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';

/// `MyEarnings.hasScheduleSignal` — единственный источник условия показа
/// карточки «Сколько можно было заработать» на «Моём заработке»
/// (`earnings_drilldown/mobile.md`, «B», п.3): виджет (`_PotentialEarningsCard`)
/// только читает этот геттер, вся логика проверяется здесь.
const _base = MyEarnings(
  period: PayrollPeriod(),
  currency: 'RUB',
  workedSeconds: 3600,
  shiftsCount: 1,
  grossAmountMinor: 100000,
  hasMissingRate: false,
);

void main() {
  group('hasScheduleSignal', () {
    test('delta == 0, overtime == 0, lateCount == 0 → false (блок скрыт)', () {
      expect(_base.hasScheduleSignal, isFalse);
    });

    test('delta != 0 (недобор плана) → true', () {
      final earnings = _base.copyWith(deltaAmountMinor: -5000);
      expect(earnings.hasScheduleSignal, isTrue);
    });

    test('delta != 0 (перебор плана) → true', () {
      final earnings = _base.copyWith(deltaAmountMinor: 5000);
      expect(earnings.hasScheduleSignal, isTrue);
    });

    test('overtimeSeconds > 0, delta == 0, lateCount == 0 → true', () {
      final earnings = _base.copyWith(overtimeSeconds: 1800);
      expect(earnings.hasScheduleSignal, isTrue);
    });

    test('lateCount > 0, delta == 0, overtime == 0 → true (опоздания сами '
        'по себе включают блок)', () {
      final earnings = _base.copyWith(lateCount: 1, lateSecondsTotal: 600);
      expect(earnings.hasScheduleSignal, isTrue);
    });

    test('все три сигнала ненулевые → true', () {
      final earnings = _base.copyWith(
        deltaAmountMinor: -1000,
        overtimeSeconds: 900,
        lateCount: 2,
        lateSecondsTotal: 1200,
      );
      expect(earnings.hasScheduleSignal, isTrue);
    });
  });
}
