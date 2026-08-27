part of '../view/organization_detail_page.dart';

/// Некликабельный баннер состояния подписки (`tariffs`) — виден только
/// owner/admin (бэк заполняет `subscription` только для них, см.
/// `Organization.subscription`). В `active` не рисуется вовсе — вызывающая
/// сторона не создаёт виджет, если `OrganizationSubscription.banner == null`.
class _SubscriptionBanner extends StatelessWidget {
  const _SubscriptionBanner({required this.subscription});

  final OrganizationSubscription subscription;

  @override
  Widget build(BuildContext context) {
    final banner = subscription.banner;
    if (banner == null) return const SizedBox.shrink();

    final l10n = context.l10n;
    final appColors = context.appColors;

    return switch (banner) {
      SubscriptionBanner.trialEnding => _buildTrialEnding(context, l10n),
      SubscriptionBanner.pastDue => _buildPastDue(context, l10n),
      SubscriptionBanner.readOnly => _bannerCard(
        context,
        icon: Icons.lock_outline,
        color: appColors.error,
        title: l10n.subscriptionBannerReadOnly,
      ),
    };
  }

  Widget _buildTrialEnding(BuildContext context, AppLocalizations l10n) {
    final daysLeft = subscription.daysLeft;
    // Инвариант `OrganizationSubscription.banner`: trialEnding возвращается
    // только при daysLeft != null. Явная проверка вместо `!`.
    if (daysLeft == null) return const SizedBox.shrink();

    return _bannerCard(
      context,
      icon: Icons.access_time_outlined,
      color: context.appColors.warning,
      title: l10n.subscriptionBannerTrialEnding(daysLeft),
    );
  }

  Widget _buildPastDue(BuildContext context, AppLocalizations l10n) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final paidUntil = subscription.currentPeriodEnd;
    final accessUntil = subscription.graceEndsAt;

    return _bannerCard(
      context,
      icon: Icons.warning_amber_outlined,
      color: context.appColors.warning,
      title: l10n.subscriptionBannerPastDue(
        paidUntil == null ? '—' : dateFormat.format(paidUntil.toLocal()),
        accessUntil == null ? '—' : dateFormat.format(accessUntil.toLocal()),
      ),
    );
  }

  Widget _bannerCard(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String title,
  }) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

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
}
