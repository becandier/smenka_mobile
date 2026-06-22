import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/knowledge/datasource/dto/_dto.dart';

/// Только-читательский источник данных базы знаний. Конверт `{data}` уже
/// развёрнут интерсептором — `response.data` это содержимое `data`.
class KnowledgeDataSource {
  KnowledgeDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Дерево разделов/страниц (`?tree=true`). Ответ: `{items:[NodeTreeItem...]}`.
  Future<List<KnowledgeNodeDto>> getTree(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/knowledge/nodes',
      queryParameters: const {'tree': true},
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(KnowledgeNodeDto.fromJson)
        .toList();
  }

  /// Деталь узла: обогащённый `content` + `breadcrumbs`.
  Future<KnowledgeNodeDetailDto> getNode(String orgId, String nodeId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/knowledge/nodes/$nodeId',
    );
    return KnowledgeNodeDetailDto.fromJson(response.data!);
  }
}
