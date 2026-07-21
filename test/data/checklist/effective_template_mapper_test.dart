import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/_mappers.dart';

void main() {
  group('EffectiveChecklistTemplateDto.fromJson + toDomain', () {
    EffectiveChecklistTemplateDto parse(Map<String, dynamic> extra) {
      return EffectiveChecklistTemplateDto.fromJson({
        'id': 't1',
        'name': 'Открытие кафе',
        'type': 'shift_start',
        'is_required': true,
        'source': 'role',
        ...extra,
      });
    }

    test(
      'старый бэк без checklist_work_location (нет location_ids) → '
      'пустой список, парсинг не падает',
      () {
        final template = parse({}).toDomain();

        expect(template.locationIds, isEmpty);
      },
    );

    test('новый бэк присылает location_ids → мапится как есть', () {
      final template = parse({
        'location_ids': ['loc-1', 'loc-2'],
      }).toDomain();

      expect(template.locationIds, ['loc-1', 'loc-2']);
    });

    test('пустой location_ids от нового бэка → тоже пустой список', () {
      final template = parse({'location_ids': <String>[]}).toDomain();

      expect(template.locationIds, isEmpty);
    });
  });
}
