import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_page_cubit.dart';

class _MockKnowledgeRepository extends Mock implements KnowledgeRepository {}

void main() {
  late _MockKnowledgeRepository repo;

  setUp(() => repo = _MockKnowledgeRepository());

  final detail = KnowledgeNodeDetail(
    id: 'p1',
    kind: KnowledgeNodeKind.page,
    title: 'Открытие точки',
    position: 0,
    allMembers: false,
    createdAt: DateTime.utc(2026, 6, 22, 8),
    updatedAt: DateTime.utc(2026, 6, 22, 9),
    content: const [],
  );

  KnowledgePageCubit build() =>
      KnowledgePageCubit(orgId: 'o1', nodeId: 'p1', knowledgeRepository: repo);

  test('успех → node.success с деталью', () async {
    when(
      () => repo.getNode('o1', 'p1'),
    ).thenAnswer((_) async => Task<KnowledgeNodeDetail>.success(detail));

    final cubit = build();
    await cubit.load();

    expect(cubit.state.node.status, FeatureStatus.success);
    expect(cubit.state.node.data, detail);
  });

  test(
    'доступ отозван/узел удалён → node.error с KNOWLEDGE_NODE_NOT_FOUND',
    () async {
      when(() => repo.getNode('o1', 'p1')).thenAnswer(
        (_) async => const Task<KnowledgeNodeDetail>.failure(
          ApiException.server(
            message: 'not found',
            code: 'KNOWLEDGE_NODE_NOT_FOUND',
          ),
        ),
      );

      final cubit = build();
      await cubit.load();

      expect(cubit.state.node.status, FeatureStatus.error);
      expect(cubit.state.node.errorCode, 'KNOWLEDGE_NODE_NOT_FOUND');
    },
  );
}
