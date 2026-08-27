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
  String? trialEndsAt = '2026-08-30T00:00:00Z',
  String? currentPeriodEnd,
  String? graceEndsAt,
}) => {
  'plan_code': 'premium',
  'plan_name': 'Премиум',
  'status': status,
  'trial_ends_at': trialEndsAt,
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
        org.subscription?.trialEndsAt,
        DateTime.parse('2026-08-30T00:00:00Z'),
      );
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
      'past_due после истёкшего триала (current_period_end пуст, '
      'организация ни разу не платила) → банер держится на trial_ends_at',
      () {
        final dto = OrganizationDto.fromJson(
          _orgJson(
            subscription: _fullSubscriptionJson(
              status: 'past_due',
              daysLeft: null,
              trialEndsAt: '2026-08-20T00:00:00Z',
              graceEndsAt: '2026-08-27T00:00:00Z',
            ),
          ),
        );
        final org = dto.toDomain();

        expect(org.subscription?.currentPeriodEnd, isNull);
        expect(
          org.subscription?.trialEndsAt,
          DateTime.parse('2026-08-20T00:00:00Z'),
        );
        expect(
          org.subscription?.banner,
          SubscriptionBanner.pastDue(
            paidUntil: DateTime.parse('2026-08-20T00:00:00Z'),
            accessUntil: DateTime.parse('2026-08-27T00:00:00Z'),
          ),
        );
      },
    );

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

    test('trialing, daysLeft <= 5 → trialEnding с числом дней внутри', () {
      final sub = base.copyWith(
        status: SubscriptionStatus.trialing,
        daysLeft: 5,
      );
      expect(sub.banner, const SubscriptionBanner.trialEnding(5));
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

    test('past_due → pastDue с датами периода и grace', () {
      final paidUntil = DateTime.utc(2026, 9);
      final accessUntil = DateTime.utc(2026, 9, 8);
      final sub = base.copyWith(
        status: SubscriptionStatus.pastDue,
        currentPeriodEnd: paidUntil,
        graceEndsAt: accessUntil,
      );
      expect(
        sub.banner,
        SubscriptionBanner.pastDue(
          paidUntil: paidUntil,
          accessUntil: accessUntil,
        ),
      );
    });

    test('past_due, currentPeriodEnd = null (истёк триал, оплаты не было) → '
        'paidUntil берётся из trialEndsAt, а не остаётся null', () {
      final trialEndsAt = DateTime.utc(2026, 8, 20);
      final accessUntil = DateTime.utc(2026, 8, 27);
      final sub = base.copyWith(
        status: SubscriptionStatus.pastDue,
        trialEndsAt: trialEndsAt,
        graceEndsAt: accessUntil,
      );
      expect(
        sub.banner,
        SubscriptionBanner.pastDue(
          paidUntil: trialEndsAt,
          accessUntil: accessUntil,
        ),
      );
    });

    test('past_due, оба поля заполнены → paidUntil берёт currentPeriodEnd, '
        'trialEndsAt игнорируется', () {
      final paidUntil = DateTime.utc(2026, 9);
      final accessUntil = DateTime.utc(2026, 9, 8);
      final sub = base.copyWith(
        status: SubscriptionStatus.pastDue,
        trialEndsAt: DateTime.utc(2026, 8, 20),
        currentPeriodEnd: paidUntil,
        graceEndsAt: accessUntil,
      );
      expect(
        sub.banner,
        SubscriptionBanner.pastDue(
          paidUntil: paidUntil,
          accessUntil: accessUntil,
        ),
      );
    });

    test('suspended → readOnly', () {
      final sub = base.copyWith(status: SubscriptionStatus.suspended);
      expect(sub.banner, const SubscriptionBanner.readOnly());
    });

    test('canceled → readOnly', () {
      final sub = base.copyWith(status: SubscriptionStatus.canceled);
      expect(sub.banner, const SubscriptionBanner.readOnly());
    });

    test('status = null (не должно приходить с бэка) → нет баннера', () {
      final sub = base.copyWith(status: null);
      expect(sub.banner, isNull);
    });
  });
}
