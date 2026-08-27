import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_subscription.freezed.dart';

/// Эффективный статус подписки организации (`tariffs`, `subscriptions.status`
/// + производные `SubscriptionService.build_subscription_payload`).
///
/// Персонального режима не касается вовсе — там подписки нет.
enum SubscriptionStatus {
  trialing('trialing'),
  active('active'),
  pastDue('past_due'),
  suspended('suspended'),
  canceled('canceled');

  const SubscriptionStatus(this.value);

  /// Строковое значение для контракта API.
  final String value;

  /// Парсит значение из ответа бэка; незнакомое (будущий статус) → `null` —
  /// вызывающая сторона не показывает баннер вместо падения.
  static SubscriptionStatus? fromValue(String? value) =>
      values.where((status) => status.value == value).firstOrNull;
}

/// Состояние подписки организации — вложенный объект `subscription` в
/// `Organization` (см. `backend.md` фичи `tariffs`, `GET
/// /organizations/{org_id}`).
///
/// Заполняется бэком только для owner/admin/super_admin; для employee и на
/// списочных эндпоинтах `subscription` всегда `null` — модель хранит только
/// поля, нужные баннеру состояния на мобилке (гейтинг фич и лимиты — вне
/// scope мобильного трека, см. mobile.md).
@freezed
abstract class OrganizationSubscription with _$OrganizationSubscription {
  const factory OrganizationSubscription({
    SubscriptionStatus? status,
    int? daysLeft,
    DateTime? currentPeriodEnd,
    DateTime? graceEndsAt,
  }) = _OrganizationSubscription;
  const OrganizationSubscription._();

  /// Какой баннер показать owner/admin на карточке организации — `null`,
  /// если баннер не нужен (см. mobile.md, «Владелец/админ: баннер
  /// состояния»).
  ///
  /// Данные, нужные тексту баннера, уезжают в сам вариант: UI получает
  /// готовый `daysLeft`/даты и не перепроверяет `null` там, где эта функция
  /// уже гарантировала их наличие.
  SubscriptionBanner? get banner {
    // Локальная копия ради промоушена: `daysLeft` — геттер freezed-класса,
    // внутри guard он бы не промоутился до non-null.
    final left = daysLeft;
    return switch (status) {
      SubscriptionStatus.trialing when left != null && left <= 5 =>
        SubscriptionBanner.trialEnding(left),
      SubscriptionStatus.pastDue => SubscriptionBanner.pastDue(
        paidUntil: currentPeriodEnd,
        accessUntil: graceEndsAt,
      ),
      SubscriptionStatus.suspended ||
      SubscriptionStatus.canceled => const SubscriptionBanner.readOnly(),
      // `active`, триал вне порога и незнакомый (будущий) статус — молчим.
      SubscriptionStatus.trialing || SubscriptionStatus.active || null => null,
    };
  }
}

/// Баннер состояния подписки на карточке организации (owner/admin) вместе с
/// данными для его текста. Union, а не enum: так «есть `daysLeft`» и «есть
/// даты периода» — свойство типа, а не инвариант в комментарии, и UI не
/// содержит недостижимых веток на случай `null`.
@freezed
sealed class SubscriptionBanner with _$SubscriptionBanner {
  /// Триал заканчивается: `days_left ≤ 5`.
  const factory SubscriptionBanner.trialEnding(int daysLeft) =
      SubscriptionBannerTrialEnding;

  /// Период не оплачен, но доступ ещё жив до конца grace. Обе даты
  /// nullable: бэк отдаёт `null`, если считать не от чего.
  const factory SubscriptionBanner.pastDue({
    DateTime? paidUntil,
    DateTime? accessUntil,
  }) = SubscriptionBannerPastDue;

  /// `suspended`/`canceled` — организация в режиме только для чтения.
  const factory SubscriptionBanner.readOnly() = SubscriptionBannerReadOnly;
}
