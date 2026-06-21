import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/_mappers.dart';

void main() {
  group('ChecklistItemPhotoDto.fromJson + toDomain', () {
    test('парсит snake_case поля фото', () {
      final dto = ChecklistItemPhotoDto.fromJson({
        'id': 'p1',
        'file_id': 'f1',
        'position': 2,
        'url': 'https://x/y.jpg',
        'url_expires_at': '2026-06-20T10:00:00Z',
        'captured_at': '2026-06-20T09:30:00Z',
        'latitude': 55.75,
        'longitude': 37.61,
      });

      final photo = dto.toDomain();

      expect(photo.id, 'p1');
      expect(photo.fileId, 'f1');
      expect(photo.position, 2);
      expect(photo.url, 'https://x/y.jpg');
      expect(photo.capturedAt!.isUtc, isTrue);
      expect(photo.latitude, 55.75);
      expect(photo.longitude, 37.61);
    });

    test('url/координаты nullable — бэк мог не прислать', () {
      final dto = ChecklistItemPhotoDto.fromJson({
        'id': 'p1',
        'file_id': 'f1',
        'position': 0,
      });

      final photo = dto.toDomain();

      expect(photo.url, isNull);
      expect(photo.capturedAt, isNull);
      expect(photo.latitude, isNull);
      expect(photo.longitude, isNull);
    });
  });

  group('ChecklistInstanceItemDto enum-маппинг', () {
    ChecklistInstanceItem mapItem(Map<String, dynamic> extra) {
      return ChecklistInstanceItemDto.fromJson({
        'id': 'i1',
        'text': 'пункт',
        'is_required': false,
        'position': 0,
        'is_completed': false,
        'change_count': 0,
        ...extra,
      }).toDomain();
    }

    test(
      'photo_requirement/photo_source → enum, camera_or_gallery критичен',
      () {
        final item = mapItem({
          'photo_requirement': 'required',
          'photo_source': 'camera_or_gallery',
          'photos_count': 1,
        });

        expect(item.photoRequirement, PhotoRequirement.required);
        expect(item.photoSource, PhotoSource.cameraOrGallery);
        expect(item.photosCount, 1);
      },
    );

    test('неизвестное значение enum → безопасный дефолт (none/camera)', () {
      final item = mapItem({
        'photo_requirement': 'whatever_new',
        'photo_source': 'multi_cam',
      });

      expect(item.photoRequirement, PhotoRequirement.none);
      expect(item.photoSource, PhotoSource.camera);
    });

    test('поэтапный деплой: старый бэк без фото-полей → дефолты', () {
      final item = mapItem({});

      expect(item.photoRequirement, PhotoRequirement.none);
      expect(item.photoSource, PhotoSource.camera);
      expect(item.photosCount, 0);
      expect(item.photos, isEmpty);
    });
  });

  group('ChecklistItemsSummaryDto обратная совместимость', () {
    test('старый бэк без satisfied_count → фолбэк на completed', () {
      final summary = ChecklistItemsSummaryDto.fromJson({
        'total': 5,
        'completed': 3,
      }).toDomain();

      expect(summary.satisfiedCount, 3);
      expect(summary.photosRequiredMissing, 0);
    });

    test('новый бэк: satisfied_count и photos_required_missing мапятся', () {
      final summary = ChecklistItemsSummaryDto.fromJson({
        'total': 5,
        'completed': 3,
        'satisfied_count': 2,
        'photos_required_missing': 1,
      }).toDomain();

      expect(summary.satisfiedCount, 2);
      expect(summary.photosRequiredMissing, 1);
    });
  });

  group('ChecklistInstanceDetailDto.maxPhotosPerItem', () {
    ChecklistInstanceDetail mapDetail(Map<String, dynamic> extra) {
      return ChecklistInstanceDetailDto.fromJson({
        'id': 'inst1',
        'name': 'Открытие',
        'type': 'shift_start',
        'is_required': true,
        'status': 'pending',
        'created_at': '2026-06-20T09:00:00Z',
        'items': <dynamic>[],
        ...extra,
      }).toDomain();
    }

    test('старый бэк без max_photos_per_item → null', () {
      expect(mapDetail({}).maxPhotosPerItem, isNull);
    });

    test('новый бэк присылает лимит', () {
      expect(mapDetail({'max_photos_per_item': 10}).maxPhotosPerItem, 10);
    });
  });
}
