import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/knowledge/models/knowledge_block.dart';

part 'knowledge_node.freezed.dart';

/// Тип узла базы знаний. [unknown] — безопасный фолбэк на незнакомое значение
/// от бэка (forward-compat): UI не падает, просто не открывает экран страницы.
enum KnowledgeNodeKind { section, page, unknown }

/// Узел дерева базы знаний (раздел или страница), без контента.
///
/// Приходит из `GET /organizations/{org_id}/knowledge/nodes?tree=true`.
/// [allMembers] присутствует только у owner/admin/super_admin (управляющая
/// инфа); у employee поле отсутствует → `null`, на мобилке не показывается.
@freezed
abstract class KnowledgeNode with _$KnowledgeNode {
  const factory KnowledgeNode({
    required String id,
    required KnowledgeNodeKind kind,
    required String title,
    required int position,
    String? icon,
    bool? allMembers,
    @Default(<KnowledgeNode>[]) List<KnowledgeNode> children,
  }) = _KnowledgeNode;

  const KnowledgeNode._();

  bool get isSection => kind == KnowledgeNodeKind.section;
  bool get isPage => kind == KnowledgeNodeKind.page;
  bool get hasChildren => children.isNotEmpty;
}

/// Крошка хлебной навигации (предок узла) — путь от корня к узлу.
@freezed
abstract class KnowledgeBreadcrumb with _$KnowledgeBreadcrumb {
  const factory KnowledgeBreadcrumb({
    required String id,
    required String title,
  }) = _KnowledgeBreadcrumb;
}

/// Деталь узла из `GET .../knowledge/nodes/{node_id}`.
///
/// Для `page` [content] — обогащённый список блоков (у `image`/`file` уже
/// подставлены presigned `url`); для `section` [content] = `null`.
@freezed
abstract class KnowledgeNodeDetail with _$KnowledgeNodeDetail {
  const factory KnowledgeNodeDetail({
    required String id,
    required KnowledgeNodeKind kind,
    required String title,
    required int position,
    required bool allMembers,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? parentId,
    String? icon,
    List<KnowledgeBlock>? content,
    @Default(<KnowledgeBreadcrumb>[]) List<KnowledgeBreadcrumb> breadcrumbs,
  }) = _KnowledgeNodeDetail;
}
