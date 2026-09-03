import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/pages/my_tests/cubit/my_tests_state.dart';

Organization _organization({required String timezone, String id = 'org1'}) =>
    Organization(
      id: id,
      name: 'Org',
      ownerId: 'owner1',
      inviteCode: 'abcd1234',
      isDeleted: false,
      createdAt: DateTime.utc(2026),
      timezone: timezone,
    );

TestAssignment _assignment({
  String organizationId = 'org1',
  String? organizationTimezone,
}) => TestAssignment(
  id: 'a1',
  organizationId: organizationId,
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
  organizationTimezone: organizationTimezone,
);

void main() {
  group('MyTestsState.timeContextFor', () {
    test('назначение несёт своё organization_timezone — используется оно, '
        'а не зона из списка организаций', () {
      final state = MyTestsState(
        organizations: [_organization(timezone: 'Europe/Berlin')],
      );
      final assignment = _assignment(organizationTimezone: 'Europe/Moscow');

      final context = state.timeContextFor(assignment);

      expect(context, const AppTimeContext.organization('Europe/Moscow'));
    });

    test('у назначения нет organization_timezone (rolling deploy) — фолбэк на '
        'зону из уже загруженного списка организаций пользователя', () {
      final state = MyTestsState(
        organizations: [_organization(timezone: 'Europe/Berlin')],
      );
      final assignment = _assignment();

      final context = state.timeContextFor(assignment);

      expect(context, const AppTimeContext.organization('Europe/Berlin'));
    });

    test('ни organization_timezone, ни организация в списке ещё не загружены — '
        'безопасный фолбэк на устройство', () {
      const state = MyTestsState();
      final assignment = _assignment();

      final context = state.timeContextFor(assignment);

      expect(context, const AppTimeContext.device());
    });
  });
}
