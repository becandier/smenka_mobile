import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';

part 'knowledge_page_state.freezed.dart';

@freezed
abstract class KnowledgePageState with _$KnowledgePageState {
  const factory KnowledgePageState({
    @Default(SectionData<KnowledgeNodeDetail>())
    SectionData<KnowledgeNodeDetail> node,
  }) = _KnowledgePageState;
}
