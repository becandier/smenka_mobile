part of '../view/shift_tracker_page.dart';

/// Пассивная плашка офлайна. Смена при этом продолжает идти: таймер считает
/// время локально, активная смена из UI не пропадает (см. ShiftTrackerCubit).
class _OfflineBanner extends StatelessWidget {
  const _OfflineBanner();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colors.warning.withValues(alpha: 0.15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.cloud_off_outlined, size: 18, color: colors.warning),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                l10n.shiftOfflineBanner,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.warning,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Плашка сетевой ошибки последнего действия (start/pause/resume/finish)
/// с кнопкой «Повторить». В отличие от тоста — не исчезает, пока операцию
/// не повторят успешно, поэтому пользователь не теряет возможность ретрая.
class _ShiftActionErrorBar extends StatelessWidget {
  const _ShiftActionErrorBar({required this.state});

  final ShiftTrackerState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final message = localizedErrorMessage(
      context,
      code: state.actionErrorCode,
      fallback: state.actionError,
    );

    return Material(
      color: colors.error.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
        child: Row(
          children: [
            Icon(Icons.wifi_off_outlined, size: 18, color: colors.error),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: textTheme.bodyMedium?.copyWith(color: colors.error),
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: state.isActionLoading
                  ? null
                  : () => context.read<ShiftTrackerCubit>().retryLastAction(),
              child: Text(l10n.commonRetry),
            ),
          ],
        ),
      ),
    );
  }
}
