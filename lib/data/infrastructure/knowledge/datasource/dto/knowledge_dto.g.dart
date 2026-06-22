// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KnowledgeNodeDto _$KnowledgeNodeDtoFromJson(Map<String, dynamic> json) =>
    _KnowledgeNodeDto(
      id: json['id'] as String,
      kind: json['kind'] as String,
      title: json['title'] as String,
      position: (json['position'] as num).toInt(),
      icon: json['icon'] as String?,
      allMembers: json['all_members'] as bool?,
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => KnowledgeNodeDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <KnowledgeNodeDto>[],
    );

Map<String, dynamic> _$KnowledgeNodeDtoToJson(_KnowledgeNodeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'title': instance.title,
      'position': instance.position,
      'icon': instance.icon,
      'all_members': instance.allMembers,
      'children': instance.children,
    };

_KnowledgeBreadcrumbDto _$KnowledgeBreadcrumbDtoFromJson(
  Map<String, dynamic> json,
) => _KnowledgeBreadcrumbDto(
  id: json['id'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$KnowledgeBreadcrumbDtoToJson(
  _KnowledgeBreadcrumbDto instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

_KnowledgeNodeDetailDto _$KnowledgeNodeDetailDtoFromJson(
  Map<String, dynamic> json,
) => _KnowledgeNodeDetailDto(
  id: json['id'] as String,
  kind: json['kind'] as String,
  title: json['title'] as String,
  position: (json['position'] as num).toInt(),
  allMembers: json['all_members'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  parentId: json['parent_id'] as String?,
  icon: json['icon'] as String?,
  content: json['content'] as List<dynamic>?,
  breadcrumbs:
      (json['breadcrumbs'] as List<dynamic>?)
          ?.map(
            (e) => KnowledgeBreadcrumbDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <KnowledgeBreadcrumbDto>[],
);

Map<String, dynamic> _$KnowledgeNodeDetailDtoToJson(
  _KnowledgeNodeDetailDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'kind': instance.kind,
  'title': instance.title,
  'position': instance.position,
  'all_members': instance.allMembers,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'parent_id': instance.parentId,
  'icon': instance.icon,
  'content': instance.content,
  'breadcrumbs': instance.breadcrumbs,
};
