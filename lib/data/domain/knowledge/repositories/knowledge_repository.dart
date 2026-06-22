import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/knowledge/models/_models.dart';

/// Только-читательский доступ к базе знаний организации.
///
/// Никаких мутирующих методов: создание/редактирование/перемещение узлов,
/// блочный редактор и настройка ACL — только в веб-админке.
abstract class KnowledgeRepository {
  /// Дерево разделов/страниц org (сервер уже отфильтровал по роли).
  Future<Task<List<KnowledgeNode>>> getTree(String orgId);

  /// Деталь узла: обогащённый `content` (presigned `url`) + `breadcrumbs`.
  Future<Task<KnowledgeNodeDetail>> getNode(String orgId, String nodeId);
}
