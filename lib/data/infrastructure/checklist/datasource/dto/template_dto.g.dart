// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistTemplateDto _$ChecklistTemplateDtoFromJson(
        Map<String, dynamic> json) =>
    _ChecklistTemplateDto(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      isRequired: json['is_required'] as bool,
      itemsCount: (json['items_count'] as num).toInt(),
      isArchived: json['is_archived'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChecklistTemplateDtoToJson(
        _ChecklistTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'is_required': instance.isRequired,
      'items_count': instance.itemsCount,
      'is_archived': instance.isArchived,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_ChecklistTemplateDetailDto _$ChecklistTemplateDetailDtoFromJson(
        Map<String, dynamic> json) =>
    _ChecklistTemplateDetailDto(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      isRequired: json['is_required'] as bool,
      isArchived: json['is_archived'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              ChecklistTemplateItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ChecklistTemplateDetailDtoToJson(
        _ChecklistTemplateDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'is_required': instance.isRequired,
      'is_archived': instance.isArchived,
      'items': instance.items,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_ChecklistTemplateItemDto _$ChecklistTemplateItemDtoFromJson(
        Map<String, dynamic> json) =>
    _ChecklistTemplateItemDto(
      id: json['id'] as String,
      text: json['text'] as String,
      isRequired: json['is_required'] as bool,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$ChecklistTemplateItemDtoToJson(
        _ChecklistTemplateItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'is_required': instance.isRequired,
      'position': instance.position,
    };
