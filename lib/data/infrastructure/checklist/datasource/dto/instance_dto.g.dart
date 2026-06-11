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
);

Map<String, dynamic> _$ChecklistItemsSummaryDtoToJson(
  _ChecklistItemsSummaryDto instance,
) => <String, dynamic>{
  'total': instance.total,
  'completed': instance.completed,
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
};
