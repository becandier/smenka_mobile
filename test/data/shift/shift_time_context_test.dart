import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

Shift _orgShift({String? organizationTimezone}) => Shift(
  id: 'shift1',
  userId: 'u1',
  startedAt: DateTime.utc(2026, 8, 12, 6),
  status: ShiftStatus.finished,
  pauses: const [],
  workedSeconds: 3600,
  organizationId: 'org1',
  organizationTimezone: organizationTimezone,
);

void main() {
  group('ShiftTimeContext.timeContext', () {
    test('персональная смена (organizationId == null) — всегда устройство', () {
      final shift = _orgShift(
        organizationTimezone: 'Europe/Moscow',
      ).copyWith(organizationId: null);

      expect(shift.timeContext(), const AppTimeContext.device());
    });

    test('своя таймзона валидна — используется без фолбэка', () {
      final shift = _orgShift(organizationTimezone: 'Europe/Moscow');

      final context = shift.timeContext(
        scopedOrganizationTimezone: 'Europe/Berlin',
      );

      expect(context, const AppTimeContext.organization('Europe/Moscow'));
    });

    test(
      'своя таймзона отсутствует (rolling deploy) — фолбэк на зону экрана',
      () {
        final shift = _orgShift();

        final context = shift.timeContext(
          scopedOrganizationTimezone: 'Europe/Berlin',
        );

        expect(context, const AppTimeContext.organization('Europe/Berlin'));
      },
    );

    test(
      'своя таймзона невалидна — фолбэк на валидную зону экрана, а не UTC',
      () {
        final shift = _orgShift(organizationTimezone: 'Not/AZone');

        final context = shift.timeContext(
          scopedOrganizationTimezone: 'Europe/Berlin',
        );

        expect(context, const AppTimeContext.organization('Europe/Berlin'));
      },
    );

    test(
      'обе зоны невалидны/отсутствуют — безопасный фолбэк на устройство',
      () {
        final shift = _orgShift(organizationTimezone: 'Not/AZone');

        final context = shift.timeContext(
          scopedOrganizationTimezone: 'Also/Invalid',
        );

        expect(context, const AppTimeContext.device());
      },
    );

    test('ни одной зоны вовсе — безопасный фолбэк на устройство', () {
      final shift = _orgShift();

      expect(shift.timeContext(), const AppTimeContext.device());
    });
  });
}
