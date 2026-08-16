import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/shift/mappers/_mappers.dart';

/// Минимальный набор обязательных полей `ShiftResponse` + опциональные
/// additive-поля ручного ввода (`manual_time_entry`).
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
  group('ShiftDto.toDomain — ручные пометки (manual_time_entry)', () {
    test(
      'старый ответ без новых полей → безопасные дефолты, парсинг не падает',
      () {
        final shift = ShiftDto.fromJson(_shiftJson()).toDomain();

        expect(shift.isManual, isFalse);
        expect(shift.isEdited, isFalse);
        expect(shift.isDeleted, isFalse);
        expect(shift.manualNote, isNull);
        expect(shift.editedAt, isNull);
        expect(shift.createdByName, isNull);
        expect(shift.editedByName, isNull);
      },
    );

    test('смена, заведённая администратором — is_manual + created_by_name', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({
          'is_manual': true,
          'manual_note': 'Забыл отметиться, подтверждено бригадиром',
          'created_by_name': 'Админ Иванов',
        }),
      ).toDomain();

      expect(shift.isManual, isTrue);
      expect(shift.isEdited, isFalse);
      expect(shift.manualNote, 'Забыл отметиться, подтверждено бригадиром');
      expect(shift.createdByName, 'Админ Иванов');
    });

    test(
      'смена, изменённая администратором — is_edited + edited_at/edited_by_name',
      () {
        final shift = ShiftDto.fromJson(
          _shiftJson({
            'is_edited': true,
            'edited_at': '2026-08-13T09:00:00Z',
            'edited_by_name': 'Админ Петров',
          }),
        ).toDomain();

        expect(shift.isManual, isFalse);
        expect(shift.isEdited, isTrue);
        expect(shift.editedAt?.isUtc, isTrue);
        expect(shift.editedByName, 'Админ Петров');
      },
    );

    test('персональный эндпоинт (GET /shifts) — created_by_name/edited_by_name '
        'всегда null, даже если смена ручная', () {
      final shift = ShiftDto.fromJson(
        _shiftJson({'is_manual': true, 'manual_note': 'Задним числом'}),
      ).toDomain();

      expect(shift.isManual, isTrue);
      expect(shift.createdByName, isNull);
      expect(shift.editedByName, isNull);
    });

    test(
      'is_deleted=true — видна только при include_deleted/DELETE-ответе',
      () {
        final shift = ShiftDto.fromJson(
          _shiftJson({'is_deleted': true}),
        ).toDomain();

        expect(shift.isDeleted, isTrue);
      },
    );
  });
}
