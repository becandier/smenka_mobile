part of '../view/organization_detail_page.dart';

/// Некликабельный баннер состояния подписки (`tariffs`) — виден только
/// owner/admin (бэк заполняет `subscription` только для них, см.
/// `Organization.subscription`). В `active` не рисуется вовсе — вызывающая
/// сторона не создаёт виджет, если `OrganizationSubscription.banner == null`.
class _SubscriptionBanner extends StatelessWidget {
  const _SubscriptionBanner({required this.banner});

  static final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  final SubscriptionBanner banner;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final (IconData icon, Color color, String title) = switch (banner) {
      SubscriptionBannerTrialEnding(:final daysLeft) => (
        Icons.access_time_outlined,
        appColors.warning,
        l10n.subscriptionBannerTrialEnding(daysLeft),
      ),
      SubscriptionBannerPastDue(:final paidUntil, :final accessUntil) => (
        Icons.warning_amber_outlined,
        appColors.warning,
        l10n.subscriptionBannerPastDue(_date(paidUntil), _date(accessUntil)),
      ),
      SubscriptionBannerReadOnly() => (
        Icons.lock_outline,
        appColors.error,
        l10n.subscriptionBannerReadOnly,
      ),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.bodyMedium?.copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.subscriptionBannerAction,
                      style: textTheme.bodySmall?.copyWith(
                        color: color.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Бэк отдаёт `null`, если дату считать не от чего — прочерк вместо
  /// пустоты в середине фразы.
  static String _date(DateTime? value) =>
      value == null ? '—' : _dateFormat.format(value.toLocal());
}
