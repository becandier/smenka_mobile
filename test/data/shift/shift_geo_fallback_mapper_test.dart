import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/shift/_shift.dart';

Map<String, dynamic> _shiftJson([Map<String, dynamic> overrides = const {}]) {
  return {
    'id': 'shift1',
    'user_id': 'u1',
    'started_at': '2026-08-27T06:00:00Z',
    'status': 'active',
    'pauses': <dynamic>[],
    'worked_seconds': 0,
    ...overrides,
  };
}

void main() {
  group('additive-поля старта без гео (shift_geo_photo_fallback)', () {
    test('старый бэк без полей → безопасные дефолты', () {
      final shift = ShiftDto.fromJson(_shiftJson()).toDomain();

      expect(shift.geoFallback, isFalse);
      expect(shift.geoFallbackReason, isNull);
      expect(shift.geoFallbackPhotoFileId, isNull);
    });

    test('помеченная смена → признак, причина и файл доезжают до домена', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({
          'geo_fallback': true,
          'geo_fallback_reason': 'GEO_PERMISSION_DENIED_FOREVER',
          'geo_fallback_photo_file_id': 'file-1',
        }),
      ).toDomain();

      expect(shift.geoFallback, isTrue);
      expect(shift.geoFallbackReason, 'GEO_PERMISSION_DENIED_FOREVER');
      expect(shift.geoFallbackPhotoFileId, 'file-1');
    });

    test('обычная смена: geo_fallback=false при null-причине', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({
          'geo_fallback': false,
          'geo_fallback_reason': null,
          'geo_fallback_photo_file_id': null,
        }),
      ).toDomain();

      expect(shift.geoFallback, isFalse);
      expect(shift.geoFallbackReason, isNull);
    });
  });
}
