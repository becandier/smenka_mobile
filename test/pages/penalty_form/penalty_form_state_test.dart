import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/pages/penalty_form/cubit/penalty_form_state.dart';

void main() {
  group('PenaltyFormState.timeContext', () {
    test('organizationTimezone ещё не подгружен (до getById) — нейтральный '
        'фолбэк на устройство, а не угаданная зона', () {
      const state = PenaltyFormState();

      expect(state.timeContext, const AppTimeContext.device());
    });

    test('зона подгружена — используется зона организации', () {
      const state = PenaltyFormState(organizationTimezone: 'Asia/Vladivostok');

      expect(
        state.timeContext,
        const AppTimeContext.organization('Asia/Vladivostok'),
      );
    });
  });
}
