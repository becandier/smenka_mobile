import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/shift/mappers/_mappers.dart';

/// Минимальный набор обязательных полей `ShiftResponse` + опциональный
/// additive-блок `earnings` (`shift_history_earnings/backend.md`, п.1).
Map<String, dynamic> _shiftJson([Map<String, dynamic> overrides = const {}]) {
  return {
    'id': 'shift1',
    'user_id': 'u1',
    'started_at': '2026-08-12T06:00:00Z',
    'status': 'finished',
    'pauses': <dynamic>[],
    'worked_seconds': 3600,
    ...overrides,
  };
}

Map<String, dynamic> _earningsJson([
  Map<String, dynamic> overrides = const {},
]) {
  return {
    'currency': 'RUB',
    'gross_amount_minor': 120000,
    'penalty_amount_minor': 5000,
    'penalties_count': 1,
    'adjustment_amount_minor': 0,
    'adjustments_count': 0,
    'net_amount_minor': 115000,
    'overtime_seconds': 1800,
    'has_rate': true,
    ...overrides,
  };
}

void main() {
  group('ShiftDto.toDomain — earnings (shift_history_earnings)', () {
    test('старый ответ без блока earnings → Shift.earnings == null '
        '(additive, обратная совместимость)', () {
      final shift = ShiftDto.fromJson(_shiftJson()).toDomain();

      expect(shift.earnings, isNull);
    });

    test('persональная/не-finished смена — бэк присылает earnings: null', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({'earnings': null}),
      ).toDomain();

      expect(shift.earnings, isNull);
    });

    test('has_rate=true — все денежные поля смаплены как есть', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({'earnings': _earningsJson()}),
      ).toDomain();

      final earnings = shift.earnings;
      expect(earnings, isNotNull);
      expect(earnings!.currency, 'RUB');
      expect(earnings.grossAmountMinor, 120000);
      expect(earnings.penaltyAmountMinor, 5000);
      expect(earnings.penaltiesCount, 1);
      expect(earnings.adjustmentAmountMinor, 0);
      expect(earnings.adjustmentsCount, 0);
      expect(earnings.netAmountMinor, 115000);
      expect(earnings.overtimeSeconds, 1800);
      expect(earnings.hasRate, isTrue);
    });

    test('has_rate=false — gross/net приходят нулевыми, флаг сохраняется '
        '(клиент обязан отличить это от «заработал 0», ADR-005 п.3)', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({
          'earnings': _earningsJson({
            'gross_amount_minor': 0,
            'penalty_amount_minor': 0,
            'penalties_count': 0,
            'net_amount_minor': 0,
            'has_rate': false,
          }),
        }),
      ).toDomain();

      final earnings = shift.earnings;
      expect(earnings, isNotNull);
      expect(earnings!.hasRate, isFalse);
      expect(earnings.grossAmountMinor, 0);
      expect(earnings.netAmountMinor, 0);
    });

    test('отрицательный net_amount_minor (штраф больше начисления)', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({
          'earnings': _earningsJson({
            'gross_amount_minor': 10000,
            'penalty_amount_minor': 15000,
            'penalties_count': 1,
            'net_amount_minor': -5000,
          }),
        }),
      ).toDomain();

      expect(shift.earnings!.netAmountMinor, -5000);
    });
  });
}
