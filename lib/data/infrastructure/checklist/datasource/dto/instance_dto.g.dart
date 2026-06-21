// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItemsSummaryDto _$ChecklistItemsSummaryDtoFromJson(
  Map<String, dynamic> json,
) => _ChecklistItemsSummaryDto(
  total: (json['total'] as num).toInt(),
  completed: (json['completed'] as num).toInt(),
  satisfiedCount: (json['satisfied_count'] as num?)?.toInt(),
  photosRequiredMissing:
      (json['photos_required_missing'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChecklistItemsSummaryDtoToJson(
  _ChecklistItemsSummaryDto instance,
) => <String, dynamic>{
  'total': instance.total,
  'completed': instance.completed,
  'satisfied_count': instance.satisfiedCount,
  'photos_required_missing': instance.photosRequiredMissing,
};

_ChecklistInstanceDto _$ChecklistInstanceDtoFromJson(
  Map<String, dynamic> json,
) => _ChecklistInstanceDto(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  isRequired: json['is_required'] as bool,
  status: json['status'] as String,
  itemsSummary: ChecklistItemsSummaryDto.fromJson(
    json['items_summary'] as Map<String, dynamic>,
  ),
  createdAt: DateTime.parse(json['created_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
);

Map<String, dynamic> _$ChecklistInstanceDtoToJson(
  _ChecklistInstanceDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'is_required': instance.isRequired,
  'status': instance.status,
  'items_summary': instance.itemsSummary,
  'created_at': instance.createdAt.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
};

_ChecklistInstanceDetailDto _$ChecklistInstanceDetailDtoFromJson(
  Map<String, dynamic> json,
) => _ChecklistInstanceDetailDto(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  isRequired: json['is_required'] as bool,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  items: (json['items'] as List<dynamic>)
      .map((e) => ChecklistInstanceItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  maxPhotosPerItem: (json['max_photos_per_item'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChecklistInstanceDetailDtoToJson(
  _ChecklistInstanceDetailDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'is_required': instance.isRequired,
  'status': instance.status,
  'created_at': instance.createdAt.toIso8601String(),
  'items': instance.items,
  'completed_at': instance.completedAt?.toIso8601String(),
  'max_photos_per_item': instance.maxPhotosPerItem,
};

_ChecklistInstanceItemDto _$ChecklistInstanceItemDtoFromJson(
  Map<String, dynamic> json,
) => _ChecklistInstanceItemDto(
  id: json['id'] as String,
  text: json['text'] as String,
  isRequired: json['is_required'] as bool,
  position: (json['position'] as num).toInt(),
  isCompleted: json['is_completed'] as bool,
  changeCount: (json['change_count'] as num).toInt(),
  comment: json['comment'] as String?,
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  photoRequirement: json['photo_requirement'] as String? ?? 'none',
  photoSource: json['photo_source'] as String? ?? 'camera',
  photosCount: (json['photos_count'] as num?)?.toInt() ?? 0,
  photos:
      (json['photos'] as List<dynamic>?)
          ?.map(
            (e) => ChecklistItemPhotoDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ChecklistItemPhotoDto>[],
);

Map<String, dynamic> _$ChecklistInstanceItemDtoToJson(
  _ChecklistInstanceItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'is_required': instance.isRequired,
  'position': instance.position,
  'is_completed': instance.isCompleted,
  'change_count': instance.changeCount,
  'comment': instance.comment,
  'completed_at': instance.completedAt?.toIso8601String(),
  'photo_requirement': instance.photoRequirement,
  'photo_source': instance.photoSource,
  'photos_count': instance.photosCount,
  'photos': instance.photos,
};

_ChecklistItemPhotoDto _$ChecklistItemPhotoDtoFromJson(
  Map<String, dynamic> json,
) => _ChecklistItemPhotoDto(
  id: json['id'] as String,
  fileId: json['file_id'] as String,
  position: (json['position'] as num).toInt(),
  url: json['url'] as String?,
  urlExpiresAt: json['url_expires_at'] == null
      ? null
      : DateTime.parse(json['url_expires_at'] as String),
  capturedAt: json['captured_at'] == null
      ? null
      : DateTime.parse(json['captured_at'] as String),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ChecklistItemPhotoDtoToJson(
  _ChecklistItemPhotoDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'file_id': instance.fileId,
  'position': instance.position,
  'url': instance.url,
  'url_expires_at': instance.urlExpiresAt?.toIso8601String(),
  'captured_at': instance.capturedAt?.toIso8601String(),
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
