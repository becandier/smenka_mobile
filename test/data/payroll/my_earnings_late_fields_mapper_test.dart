import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/payroll_mapper.dart';

/// Минимальный набор обязательных полей `MyEarningsResponse` + опоздания
/// (`work_schedules`, `late_count`/`late_seconds_total`).
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
  group('MyEarningsDto.toDomain — опоздания (earnings_drilldown)', () {
    test('старый ответ без late_count/late_seconds_total → дефолт 0, '
        'парсинг не падает', () {
      final earnings = MyEarningsDto.fromJson(_myEarningsJson()).toDomain();

      expect(earnings.lateCount, 0);
      expect(earnings.lateSecondsTotal, 0);
    });

    test('опоздания приходят и попадают в домен как есть — клиент их не '
        'пересчитывает', () {
      final earnings = MyEarningsDto.fromJson(
        _myEarningsJson({'late_count': 3, 'late_seconds_total': 5400}),
      ).toDomain();

      expect(earnings.lateCount, 3);
      expect(earnings.lateSecondsTotal, 5400);
    });
  });
}
