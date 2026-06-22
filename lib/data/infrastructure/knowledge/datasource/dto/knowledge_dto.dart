import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_dto.freezed.dart';
part 'knowledge_dto.g.dart';

/// Узел дерева (`NodeTreeItem`) — рекурсивный, без `content`.
@freezed
abstract class KnowledgeNodeDto with _$KnowledgeNodeDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory KnowledgeNodeDto({
    required String id,
    required String kind,
    required String title,
    required int position,
    String? icon,
    bool? allMembers,
    @Default(<KnowledgeNodeDto>[]) List<KnowledgeNodeDto> children,
  }) = _KnowledgeNodeDto;

  factory KnowledgeNodeDto.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeNodeDtoFromJson(json);
}

/// Крошка хлебной навигации.
@freezed
abstract class KnowledgeBreadcrumbDto with _$KnowledgeBreadcrumbDto {
  const factory KnowledgeBreadcrumbDto({
    required String id,
    required String title,
  }) = _KnowledgeBreadcrumbDto;

  factory KnowledgeBreadcrumbDto.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeBreadcrumbDtoFromJson(json);
}

/// Деталь узла (`NodeDetailResponse`). Блоки `content` хранятся сырым JSON и
/// разбираются вручную в маппере (диспетчер по `type` + фолбэк `unknown`),
/// чтобы не падать на новом `schema_version`/типе блока.
@freezed
abstract class KnowledgeNodeDetailDto with _$KnowledgeNodeDetailDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory KnowledgeNodeDetailDto({
    required String id,
    required String kind,
    required String title,
    required int position,
    required bool allMembers,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? parentId,
    String? icon,
    // Сырой JSON блоков; типобезопасная фильтрация и диспетчер — в маппере
    // (forward-compat: не-объектный элемент массива не должен ронять парсинг).
    List<dynamic>? content,
    @Default(<KnowledgeBreadcrumbDto>[])
    List<KnowledgeBreadcrumbDto> breadcrumbs,
  }) = _KnowledgeNodeDetailDto;

  factory KnowledgeNodeDetailDto.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeNodeDetailDtoFromJson(json);
}
