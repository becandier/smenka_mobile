import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_page_state.dart';

/// Деталь страницы базы знаний (read-only). На `KNOWLEDGE_NODE_NOT_FOUND`
/// (доступ отозван / узел удалён) — состояние error с этим кодом.
class KnowledgePageCubit extends Cubit<KnowledgePageState> {
  KnowledgePageCubit({
    required String orgId,
    required String nodeId,
    required KnowledgeRepository knowledgeRepository,
  }) : _orgId = orgId,
       _nodeId = nodeId,
       _knowledgeRepository = knowledgeRepository,
       super(const KnowledgePageState()) {
    load();
  }

  final String _orgId;
  final String _nodeId;
  final KnowledgeRepository _knowledgeRepository;

  Future<void> load() async {
    emit(state.copyWith(node: state.node.toLoading()));
    final result = await _knowledgeRepository.getNode(_orgId, _nodeId);
    result.fold(
      onSuccess: (detail) =>
          emit(state.copyWith(node: state.node.toSuccess(detail))),
      onFailure: (error) => emit(
        state.copyWith(
          node: state.node.toError(error.message, code: error.code),
        ),
      ),
    );
  }
}
