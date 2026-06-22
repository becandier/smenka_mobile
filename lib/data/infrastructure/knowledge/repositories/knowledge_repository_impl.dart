import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/data/infrastructure/knowledge/datasource/knowledge_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/knowledge/mappers/knowledge_mapper.dart';

class KnowledgeRepositoryImpl with TaskHandler implements KnowledgeRepository {
  KnowledgeRepositoryImpl({required KnowledgeDataSource dataSource})
    : _dataSource = dataSource;

  final KnowledgeDataSource _dataSource;

  @override
  Future<Task<List<KnowledgeNode>>> getTree(String orgId) {
    return execute(() async {
      final dtos = await _dataSource.getTree(orgId);
      return dtos.map((dto) => dto.toDomain()).toList();
    });
  }

  @override
  Future<Task<KnowledgeNodeDetail>> getNode(String orgId, String nodeId) {
    return execute(() async {
      final dto = await _dataSource.getNode(orgId, nodeId);
      return dto.toDomain();
    });
  }
}
