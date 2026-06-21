import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/template_mapper.dart';

ChecklistInstanceStatus _parseStatus(String value) => switch (value) {
  'pending' => ChecklistInstanceStatus.pending,
  'completed' => ChecklistInstanceStatus.completed,
  'incomplete' => ChecklistInstanceStatus.incomplete,
  _ => throw ArgumentError('Unknown checklist instance status: $value'),
};

// Незнакомое значение → безопасный дефолт (none/camera), не бросаем: бэк может
// со временем добавить варианты, старая мобилка не должна падать.
PhotoRequirement _parsePhotoRequirement(String value) => switch (value) {
  'none' => PhotoRequirement.none,
  'optional' => PhotoRequirement.optional,
  'required' => PhotoRequirement.required,
  _ => PhotoRequirement.none,
};

PhotoSource _parsePhotoSource(String value) => switch (value) {
  'camera' => PhotoSource.camera,
  'camera_or_gallery' => PhotoSource.cameraOrGallery,
  _ => PhotoSource.camera,
};

extension ChecklistItemsSummaryDtoMapper on ChecklistItemsSummaryDto {
  ChecklistItemsSummary toDomain() => ChecklistItemsSummary(
    total: total,
    completed: completed,
    // Старый бэк без satisfied_count → честный прогресс по completed.
    satisfiedCount: satisfiedCount ?? completed,
    photosRequiredMissing: photosRequiredMissing,
  );
}

extension ChecklistItemPhotoDtoMapper on ChecklistItemPhotoDto {
  ChecklistItemPhoto toDomain() => ChecklistItemPhoto(
    id: id,
    fileId: fileId,
    position: position,
    url: url,
    urlExpiresAt: urlExpiresAt,
    capturedAt: capturedAt,
    latitude: latitude,
    longitude: longitude,
  );
}

extension ChecklistInstanceDtoMapper on ChecklistInstanceDto {
  ChecklistInstance toDomain() => ChecklistInstance(
    id: id,
    name: name,
    type: checklistTypeFromApi(type),
    isRequired: isRequired,
    status: _parseStatus(status),
    itemsSummary: itemsSummary.toDomain(),
    completedAt: completedAt,
    createdAt: createdAt,
  );
}

extension ChecklistInstanceItemDtoMapper on ChecklistInstanceItemDto {
  ChecklistInstanceItem toDomain() => ChecklistInstanceItem(
    id: id,
    text: text,
    isRequired: isRequired,
    position: position,
    isCompleted: isCompleted,
    comment: comment,
    completedAt: completedAt,
    changeCount: changeCount,
    photoRequirement: _parsePhotoRequirement(photoRequirement),
    photoSource: _parsePhotoSource(photoSource),
    photosCount: photosCount,
    photos: photos.map((e) => e.toDomain()).toList(),
  );
}

extension ChecklistInstanceDetailDtoMapper on ChecklistInstanceDetailDto {
  ChecklistInstanceDetail toDomain() => ChecklistInstanceDetail(
    id: id,
    name: name,
    type: checklistTypeFromApi(type),
    isRequired: isRequired,
    status: _parseStatus(status),
    completedAt: completedAt,
    createdAt: createdAt,
    items: items.map((e) => e.toDomain()).toList(),
    maxPhotosPerItem: maxPhotosPerItem,
  );
}
