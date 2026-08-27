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
  SubscriptionBanner? get banner {
    final effectiveStatus = status;
    if (effectiveStatus == null) return null;
    switch (effectiveStatus) {
      case SubscriptionStatus.trialing:
        final left = daysLeft;
        if (left != null && left <= 5) {
          return SubscriptionBanner.trialEnding;
        }
        return null;
      case SubscriptionStatus.pastDue:
        return SubscriptionBanner.pastDue;
      case SubscriptionStatus.suspended:
      case SubscriptionStatus.canceled:
        return SubscriptionBanner.readOnly;
      case SubscriptionStatus.active:
        return null;
    }
  }
}

/// Вид баннера состояния подписки на карточке организации (owner/admin).
enum SubscriptionBanner { trialEnding, pastDue, readOnly }
