import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_detail_state.dart';

Member _member() => Member(
  id: 'm1',
  organizationId: 'org1',
  userId: 'u1',
  userName: 'Иван',
  userEmail: 'ivan@example.com',
  role: MemberRole.employee,
  joinedAt: DateTime.utc(2026),
);

void main() {
  group('MemberDetailState.timeContext', () {
    test('organizationTimezone ещё не подгружен (до getById) — нейтральный '
        'фолбэк на устройство, а не угаданная зона', () {
      final state = MemberDetailState(member: _member());

      expect(state.timeContext, const AppTimeContext.device());
    });

    test('зона подгружена — используется зона организации', () {
      final state = MemberDetailState(
        member: _member(),
        organizationTimezone: 'Asia/Vladivostok',
      );

      expect(
        state.timeContext,
        const AppTimeContext.organization('Asia/Vladivostok'),
      );
    });
  });
}
