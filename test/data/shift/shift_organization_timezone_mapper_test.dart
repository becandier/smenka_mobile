import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/shift/mappers/_mappers.dart';

/// Минимальный набор обязательных полей `ShiftResponse` + опциональный
/// additive `organization_timezone` (backend, `553a235`).
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

void main() {
  group('ShiftDto.toDomain — organization_timezone (rolling deploy)', () {
    test('org-смена с IANA-таймзоной — поле прокинуто без изменений', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({
          'organization_id': 'org1',
          'organization_timezone': 'Europe/Moscow',
        }),
      ).toDomain();

      expect(shift.organizationTimezone, 'Europe/Moscow');
    });

    test('персональная смена — organization_timezone всегда null', () {
      final shift = ShiftDto.fromJson(_shiftJson()).toDomain();

      expect(shift.organizationId, isNull);
      expect(shift.organizationTimezone, isNull);
    });

    test('старый бэк без поля (rolling deploy) — null, парсинг не падает', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({'organization_id': 'org1'}),
      ).toDomain();

      expect(shift.organizationId, 'org1');
      expect(shift.organizationTimezone, isNull);
    });

    test('маппер не подставляет дефолтную таймзону вместо null', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({'organization_id': 'org1', 'organization_timezone': null}),
      ).toDomain();

      expect(shift.organizationTimezone, isNull);
      expect(shift.organizationTimezone, isNot('Europe/Moscow'));
    });
  });
}
