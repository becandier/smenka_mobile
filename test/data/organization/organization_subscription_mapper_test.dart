import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/organization/mappers/_mappers.dart';

Map<String, dynamic> _orgJson({Map<String, dynamic>? subscription}) => {
  'id': 'org1',
  'name': 'Кофейня на Ленина',
  'owner_id': 'u1',
  'invite_code': 'ABCD1234',
  'is_deleted': false,
  'created_at': '2026-01-01T00:00:00Z',
  'subscription': subscription,
};

/// Полный ответ бэка (`SubscriptionResponse.model_dump()`) — мобилка
/// парсит только подмножество полей, остальные должны молча игнорироваться.
Map<String, dynamic> _fullSubscriptionJson({
  String status = 'trialing',
  int? daysLeft = 3,
  String? currentPeriodEnd,
  String? graceEndsAt,
}) => {
  'plan_code': 'premium',
  'plan_name': 'Премиум',
  'status': status,
  'trial_ends_at': '2026-08-30T00:00:00Z',
  'current_period_start': null,
  'current_period_end': currentPeriodEnd,
  'grace_ends_at': graceEndsAt,
  'days_left': daysLeft,
  'is_read_only': false,
  'limits': {'max_employees': null, 'max_locations': null},
  'usage': {'employees': 5, 'locations': 1},
  'features': {'fines': true, 'test_import': true},
  'price_minor': 1000000,
  'currency': 'RUB',
};

void main() {
  group('OrganizationDto → toDomain: subscription (tariffs, additive)', () {
    test('subscription отсутствует (employee/список) → null в домене', () {
      final dto = OrganizationDto.fromJson(_orgJson());
      final org = dto.toDomain();

      expect(org.subscription, isNull);
    });

    test('subscription пришёл (owner/admin) → парсится подмножество полей', () {
      final dto = OrganizationDto.fromJson(
        _orgJson(
          subscription: _fullSubscriptionJson(
            status: 'past_due',
            daysLeft: null,
            currentPeriodEnd: '2026-09-01T00:00:00Z',
            graceEndsAt: '2026-09-08T00:00:00Z',
          ),
        ),
      );
      final org = dto.toDomain();

      expect(org.subscription, isNotNull);
      expect(org.subscription?.status, SubscriptionStatus.pastDue);
      expect(org.subscription?.daysLeft, isNull);
      expect(
        org.subscription?.currentPeriodEnd,
        DateTime.parse('2026-09-01T00:00:00Z'),
      );
      expect(
        org.subscription?.graceEndsAt,
        DateTime.parse('2026-09-08T00:00:00Z'),
      );
    });

    test(
      'незнакомый (будущий) статус → SubscriptionStatus null, не падает',
      () {
        final subscription = _fullSubscriptionJson(status: 'future_status');
        final dto = OrganizationDto.fromJson(
          _orgJson(subscription: subscription),
        );
        final org = dto.toDomain();

        expect(org.subscription, isNotNull);
        expect(org.subscription?.status, isNull);
        expect(org.subscription?.banner, isNull);
      },
    );
  });

  group('OrganizationSubscription.banner', () {
    const base = OrganizationSubscription(status: SubscriptionStatus.active);

    test('active → нет баннера', () {
      expect(base.banner, isNull);
    });

    test('trialing, daysLeft <= 5 → trialEnding', () {
      final sub = base.copyWith(
        status: SubscriptionStatus.trialing,
        daysLeft: 5,
      );
      expect(sub.banner, SubscriptionBanner.trialEnding);
    });

    test('trialing, daysLeft > 5 → нет баннера', () {
      final sub = base.copyWith(
        status: SubscriptionStatus.trialing,
        daysLeft: 6,
      );
      expect(sub.banner, isNull);
    });

    test('trialing, daysLeft = null (не должно приходить) → нет баннера', () {
      final sub = base.copyWith(status: SubscriptionStatus.trialing);
      expect(sub.banner, isNull);
    });

    test('past_due → pastDue', () {
      final sub = base.copyWith(status: SubscriptionStatus.pastDue);
      expect(sub.banner, SubscriptionBanner.pastDue);
    });

    test('suspended → readOnly', () {
      final sub = base.copyWith(status: SubscriptionStatus.suspended);
      expect(sub.banner, SubscriptionBanner.readOnly);
    });

    test('canceled → readOnly', () {
      final sub = base.copyWith(status: SubscriptionStatus.canceled);
      expect(sub.banner, SubscriptionBanner.readOnly);
    });

    test('status = null (не должно приходить с бэка) → нет баннера', () {
      final sub = base.copyWith(status: null);
      expect(sub.banner, isNull);
    });
  });
}
