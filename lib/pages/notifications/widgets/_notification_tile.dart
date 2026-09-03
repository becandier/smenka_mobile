part of '../view/notifications_page.dart';

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.notification, required this.onTap});

  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;
    final isUnread = !notification.isRead;

    return Material(
      color: isUnread ? colors.primary.withValues(alpha: 0.06) : colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isUnread) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox(width: 8, height: 8),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: isUnread
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                    if (notification.body case final body?
                        when body.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        body,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                    const SizedBox(height: 6),
                    Text(
                      // Платформенное уведомление без org-контекста —
                      // таймзона устройства (design.md).
                      const AppTime().formatDateTime(
                        notification.createdAt,
                        const AppTimeContext.device(),
                      ),
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary.withValues(alpha: 0.7),
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
