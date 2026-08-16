import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/payroll_mapper.dart';

/// Минимальный набор обязательных полей `MyEarningsResponse` + опциональные
/// additive-поля ручных начислений (`manual_time_entry`).
Map<String, dynamic> _myEarningsJson([
  Map<String, dynamic> overrides = const {},
]) {
  return {
    'period': {'date_from': null, 'date_to': null},
    'currency': 'RUB',
    'worked_seconds': 3600,
    'shifts_count': 1,
    'gross_amount_minor': 100000,
    'has_missing_rate': false,
    ...overrides,
  };
}

void main() {
  group('MyEarningsDto.toDomain — ручные начисления (manual_time_entry)', () {
    test('старый ответ без новых полей → дефолт 0, парсинг не падает', () {
      final earnings = MyEarningsDto.fromJson(_myEarningsJson()).toDomain();

      expect(earnings.adjustmentAmountMinor, 0);
      expect(earnings.adjustmentsCount, 0);
      expect(earnings.netAmountMinor, 0);
    });

    test('доплата (знак +) — net = gross + adjustment', () {
      final earnings = MyEarningsDto.fromJson(
        _myEarningsJson({
          'adjustment_amount_minor': 30000,
          'adjustments_count': 1,
          'net_amount_minor': 130000,
        }),
      ).toDomain();

      expect(earnings.adjustmentAmountMinor, 30000);
      expect(earnings.adjustmentsCount, 1);
      expect(earnings.netAmountMinor, 130000);
    });

    test('удержание (знак −) — net может быть меньше gross', () {
      final earnings = MyEarningsDto.fromJson(
        _myEarningsJson({
          'adjustment_amount_minor': -20000,
          'adjustments_count': 1,
          'net_amount_minor': 80000,
        }),
      ).toDomain();

      expect(earnings.adjustmentAmountMinor, -20000);
      expect(earnings.netAmountMinor, 80000);
    });
  });
}
