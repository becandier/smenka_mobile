import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_tree_state.dart';

/// Дерево базы знаний (read-only). Хранит локальную развёрнутость разделов.
class KnowledgeTreeCubit extends Cubit<KnowledgeTreeState> {
  KnowledgeTreeCubit({
    required String orgId,
    required KnowledgeRepository knowledgeRepository,
  }) : _orgId = orgId,
       _knowledgeRepository = knowledgeRepository,
       super(const KnowledgeTreeState()) {
    load();
  }

  final String _orgId;
  final KnowledgeRepository _knowledgeRepository;

  Future<void> load() async {
    emit(state.copyWith(tree: state.tree.toLoading()));
    final result = await _knowledgeRepository.getTree(_orgId);
    result.fold(
      onSuccess: (nodes) =>
          emit(state.copyWith(tree: state.tree.toSuccess(nodes))),
      onFailure: (error) => emit(
        state.copyWith(
          tree: state.tree.toError(error.message, code: error.code),
        ),
      ),
    );
  }

  /// Раскрыть/свернуть раздел.
  void toggleExpanded(String id) {
    final next = Set<String>.from(state.expandedIds);
    if (!next.add(id)) next.remove(id);
    emit(state.copyWith(expandedIds: next));
  }
}
