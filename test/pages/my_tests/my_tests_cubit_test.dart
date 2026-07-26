import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/my_tests/cubit/my_tests_cubit.dart';

class _MockTestRepository extends Mock implements TestRepository {}

class _MockOrganizationRepository extends Mock
    implements OrganizationRepository {}

TestAssignment _assignment({String orgId = 'org1'}) => TestAssignment(
  id: 'a1',
  organizationId: orgId,
  organizationName: 'Org',
  template: const TestTemplateBrief(
    id: 't1',
    title: 'Тест',
    questionCount: 5,
    maxAttempts: 1,
    passThresholdPercent: 70,
  ),
  status: TestAssignmentStatus.assigned,
  attemptsUsed: 0,
  passed: false,
);

void main() {
  late _MockTestRepository testRepo;
  late _MockOrganizationRepository orgRepo;

  setUp(() {
    testRepo = _MockTestRepository();
    orgRepo = _MockOrganizationRepository();
    when(
      () => orgRepo.watchMyOrganizations(),
    ).thenAnswer((_) => const Stream.empty());
    when(() => orgRepo.fetchMyOrganizations()).thenAnswer((_) async {});
  });

  MyTestsCubit build({String? initialOrganizationId}) => MyTestsCubit(
    testRepository: testRepo,
    organizationRepository: orgRepo,
    initialOrganizationId: initialOrganizationId,
  );

  test('конструктор сразу грузит первую страницу назначений', () async {
    when(() => testRepo.getMyAssignments()).thenAnswer(
      (_) async => Task.success(
        DefaultPaginator<TestAssignment>(
          hasMore: false,
          data: [_assignment()],
          total: 1,
        ),
      ),
    );

    final cubit = build();
    await cubit.loadAssignments();

    expect(cubit.state.assignments.data, hasLength(1));
  });

  test('initialOrganizationId предвыбирает фильтр с первого запроса', () async {
    when(() => testRepo.getMyAssignments(organizationId: 'org1')).thenAnswer(
      (_) async => Task.success(
        DefaultPaginator<TestAssignment>(hasMore: false, data: [], total: 0),
      ),
    );

    final cubit = build(initialOrganizationId: 'org1');
    await cubit.loadAssignments();

    expect(cubit.state.filterOrganizationId, 'org1');
    verify(
      () => testRepo.getMyAssignments(organizationId: 'org1'),
    ).called(greaterThanOrEqualTo(1));
  });

  test(
    'setOrganizationFilter меняет фильтр и перезапрашивает список',
    () async {
      when(() => testRepo.getMyAssignments()).thenAnswer(
        (_) async => Task.success(
          DefaultPaginator<TestAssignment>(hasMore: false, data: [], total: 0),
        ),
      );
      when(() => testRepo.getMyAssignments(organizationId: 'org2')).thenAnswer(
        (_) async => Task.success(
          DefaultPaginator<TestAssignment>(
            hasMore: false,
            data: [_assignment(orgId: 'org2')],
            total: 1,
          ),
        ),
      );

      final cubit = build();
      await cubit.loadAssignments();

      cubit.setOrganizationFilter('org2');
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.filterOrganizationId, 'org2');
      expect(cubit.state.assignments.data.single.organizationId, 'org2');
    },
  );
}
