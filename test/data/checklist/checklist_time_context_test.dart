import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';

ChecklistInstanceDetail _detail({String? organizationTimezone}) =>
    ChecklistInstanceDetail(
      id: 'c1',
      name: 'Чек-лист',
      type: ChecklistType.shiftStart,
      isRequired: true,
      status: ChecklistInstanceStatus.pending,
      createdAt: DateTime.utc(2026, 8, 12, 6),
      items: const [],
      organizationTimezone: organizationTimezone,
    );

void main() {
  group('ChecklistTimeContext.timeContext', () {
    test('валидная self-contained зона — используется', () {
      final detail = _detail(organizationTimezone: 'Europe/Moscow');

      expect(
        detail.timeContext(),
        const AppTimeContext.organization('Europe/Moscow'),
      );
    });

    test('зона отсутствует (rolling deploy) — фолбэк на устройство', () {
      final detail = _detail();

      expect(detail.timeContext(), const AppTimeContext.device());
    });

    test(
      'невалидное IANA-имя — безопасный фолбэк на устройство, а не тихий UTC',
      () {
        final detail = _detail(organizationTimezone: 'Not/AZone');

        expect(detail.timeContext(), const AppTimeContext.device());
      },
    );
  });
}
