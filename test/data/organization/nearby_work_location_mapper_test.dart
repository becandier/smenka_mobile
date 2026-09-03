import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/organization/mappers/_mappers.dart';

void main() {
  group('NearbyWorkLocationsDto → toDomain (shift_start_location_choice)', () {
    test('парсит items + nearest_outside, лишние гео-поля игнорирует', () {
      final dto = NearbyWorkLocationsDto.fromJson({
        'items': [
          {
            'id': 'wl1',
            'name': 'Склад №2',
            'address': 'ул. Ленина, 5',
            'latitude': 55.75,
            'longitude': 37.61,
            'radius_meters': 150,
            'distance_meters': 42,
            'is_nearest': true,
          },
        ],
        'nearest_outside': {
          'id': 'wl2',
          'name': 'Офис',
          'address': 'ул. Мира, 1',
          'distance_meters': 320,
          'radius_meters': 100,
        },
      });

      final domain = dto.toDomain();

      expect(domain.items, hasLength(1));
      final item = domain.items.single;
      expect(item.id, 'wl1');
      expect(item.name, 'Склад №2');
      expect(item.address, 'ул. Ленина, 5');
      expect(item.distanceMeters, 42);
      expect(item.isNearest, isTrue);

      expect(domain.nearestOutside?.name, 'Офис');
      expect(domain.nearestOutside?.distanceMeters, 320);
    });

    test('пустой items — штатный случай, nearest_outside отсутствует', () {
      final dto = NearbyWorkLocationsDto.fromJson({'items': <dynamic>[]});

      final domain = dto.toDomain();

      expect(domain.items, isEmpty);
      expect(domain.nearestOutside, isNull);
    });

    test('точка без address парсится, address = null', () {
      final dto = NearbyWorkLocationsDto.fromJson({
        'items': [
          {
            'id': 'wl1',
            'name': 'Склад',
            'distance_meters': 10,
            'is_nearest': true,
          },
        ],
      });

      expect(dto.toDomain().items.single.address, isNull);
    });
  });
}
