import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_tree_cubit.dart';

class _MockKnowledgeRepository extends Mock implements KnowledgeRepository {}

void main() {
  late _MockKnowledgeRepository repo;

  setUp(() => repo = _MockKnowledgeRepository());

  const node = KnowledgeNode(
    id: 's1',
    kind: KnowledgeNodeKind.section,
    title: 'Регламенты',
    position: 0,
  );

  KnowledgeTreeCubit build() =>
      KnowledgeTreeCubit(orgId: 'o1', knowledgeRepository: repo);

  test('успех → tree.success с данными', () async {
    when(
      () => repo.getTree('o1'),
    ).thenAnswer((_) async => const Task<List<KnowledgeNode>>.success([node]));

    final cubit = build();
    await cubit.load();

    expect(cubit.state.tree.status, FeatureStatus.success);
    expect(cubit.state.tree.data, [node]);
  });

  test('ошибка → tree.error + errorCode (логика по коду)', () async {
    when(() => repo.getTree('o1')).thenAnswer(
      (_) async => const Task<List<KnowledgeNode>>.failure(
        ApiException.server(message: 'нет org', code: 'ORG_NOT_FOUND'),
      ),
    );

    final cubit = build();
    await cubit.load();

    expect(cubit.state.tree.status, FeatureStatus.error);
    expect(cubit.state.tree.errorCode, 'ORG_NOT_FOUND');
  });

  test('toggleExpanded раскрывает и сворачивает раздел', () async {
    when(
      () => repo.getTree('o1'),
    ).thenAnswer((_) async => const Task<List<KnowledgeNode>>.success([node]));

    final cubit = build();
    await cubit.load();

    expect(cubit.state.expandedIds.contains('s1'), isFalse);
    cubit.toggleExpanded('s1');
    expect(cubit.state.expandedIds.contains('s1'), isTrue);
    cubit.toggleExpanded('s1');
    expect(cubit.state.expandedIds.contains('s1'), isFalse);
  });
}
