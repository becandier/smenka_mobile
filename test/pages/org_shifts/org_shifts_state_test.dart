import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/pages/org_shifts/cubit/org_shifts_state.dart';

void main() {
  group('OrgShiftsState.timeContext', () {
    test('organizationTimezone ещё не подгружен (до getById) — нейтральный '
        'фолбэк на устройство, а не угаданная зона', () {
      const state = OrgShiftsState();

      expect(state.timeContext, const AppTimeContext.device());
    });

    test('зона подгружена — используется зона организации', () {
      const state = OrgShiftsState(organizationTimezone: 'Asia/Vladivostok');

      expect(
        state.timeContext,
        const AppTimeContext.organization('Asia/Vladivostok'),
      );
    });
  });
}
