import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_photo.freezed.dart';

/// Требование к фото на пункте чек-листа (снимок шаблонного пункта).
///
/// `none` — фото нельзя прикреплять; `optional` — можно, но не обязательно;
/// `required` — мягко требуется (клиент подсказывает бейджем, сервер не
/// блокирует). Незнакомое значение с бэка → [PhotoRequirement.none].
enum PhotoRequirement { none, optional, required }

/// Откуда брать фото для пункта.
///
/// `camera` — только съёмка; `cameraOrGallery` — съёмка или выбор из галереи.
/// Незнакомое значение с бэка → [PhotoSource.camera] (самый строгий вариант).
enum PhotoSource { camera, cameraOrGallery }

/// Фото-подтверждение, привязанное к пункту экземпляра чек-листа.
///
/// Хранить нужно [fileId] (стабильный) — [url] это presigned-ссылка с коротким
/// TTL, бэкенд генерит её свежей при отдаче деталей. [url]/[urlExpiresAt]
/// nullable: при сбое storage бэк может вернуть `url=null`, тогда показ идёт
/// через `StorageImage` по [fileId]. [position] задаёт порядок (его ставит
/// сервер). [capturedAt] — UTC; для `cameraOrGallery` из галереи это время
/// добавления, а не съёмки (см. семантику антифрода в ТЗ).
@freezed
abstract class ChecklistItemPhoto with _$ChecklistItemPhoto {
  const factory ChecklistItemPhoto({
    required String id,
    required String fileId,
    required int position,
    String? url,
    DateTime? urlExpiresAt,
    DateTime? capturedAt,
    double? latitude,
    double? longitude,
  }) = _ChecklistItemPhoto;
}
