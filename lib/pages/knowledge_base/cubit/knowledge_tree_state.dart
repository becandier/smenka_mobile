import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';

part 'knowledge_tree_state.freezed.dart';

@freezed
abstract class KnowledgeTreeState with _$KnowledgeTreeState {
  const factory KnowledgeTreeState({
    @Default(SectionData<List<KnowledgeNode>>())
    SectionData<List<KnowledgeNode>> tree,
    @Default(<String>{}) Set<String> expandedIds,
  }) = _KnowledgeTreeState;
}
