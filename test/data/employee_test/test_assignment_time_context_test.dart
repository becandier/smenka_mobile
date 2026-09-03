import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';

TestAssignment _assignment({String? organizationTimezone}) => TestAssignment(
  id: 'a1',
  organizationId: 'org1',
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
  group('TestAssignmentTimeContext.timeContext', () {
    test(
      'серверное поле есть и валидно — используется как основной источник',
      () {
        final assignment = _assignment(organizationTimezone: 'Europe/Moscow');

        final context = assignment.timeContext(
          scopedOrganizationTimezone: 'Europe/Berlin',
        );

        expect(context, const AppTimeContext.organization('Europe/Moscow'));
      },
    );

    test('серверное поле отсутствует (rolling deploy) — фолбэк на scoped-зону '
        'клиентского списка организаций', () {
      final assignment = _assignment();

      final context = assignment.timeContext(
        scopedOrganizationTimezone: 'Europe/Berlin',
      );

      expect(context, const AppTimeContext.organization('Europe/Berlin'));
    });

    test(
      'серверное поле невалидно — фолбэк на валидную scoped-зону, а не UTC',
      () {
        final assignment = _assignment(organizationTimezone: 'Not/AZone');

        final context = assignment.timeContext(
          scopedOrganizationTimezone: 'Europe/Berlin',
        );

        expect(context, const AppTimeContext.organization('Europe/Berlin'));
      },
    );

    test(
      'ни серверного поля, ни scoped-зоны — безопасный фолбэк на устройство',
      () {
        final assignment = _assignment();

        final context = assignment.timeContext();

        expect(context, const AppTimeContext.device());
      },
    );

    test('обе зоны невалидны — фолбэк на устройство, без падения', () {
      final assignment = _assignment(organizationTimezone: 'Not/AZone');

      final context = assignment.timeContext(
        scopedOrganizationTimezone: 'Also/Invalid',
      );

      expect(context, const AppTimeContext.device());
    });
  });
}
