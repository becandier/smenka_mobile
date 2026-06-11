part of '../view/org_shifts_page.dart';

class _OrgShiftCard extends StatelessWidget {
  const _OrgShiftCard({required this.shift, required this.onTap});

  final Shift shift;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    final dateFormatted = DateFormat(
      'dd.MM.yyyy, HH:mm',
    ).format(shift.startedAt);
    final duration = _formatDuration(context, shift.workedSeconds);
    final statusLabel = _statusLabel(context, shift.status);
    final statusColor = _statusColor(context, shift.status);

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShiftAuthorBlock(
                userId: shift.userId,
                userName: shift.userName,
                userEmail: shift.userEmail,
                role: shift.role,
                customRoleName: shift.customRoleName,
                dense: true,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateFormatted,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          duration,
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (shift.hasIncompleteRequiredChecklists) ...[
                    Tooltip(
                      message: context.l10n.shiftIncompleteRequiredBadge,
                      child: Icon(
                        Icons.error_outline,
                        color: colors.error,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 2,
                        bottom: 2,
                      ),
                      child: Text(
                        statusLabel,
                        style: textTheme.labelSmall?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _statusLabel(BuildContext context, ShiftStatus status) {
    final l10n = context.l10n;
    return switch (status) {
      ShiftStatus.active => l10n.statusActive,
      ShiftStatus.paused => l10n.statusPaused,
      ShiftStatus.finished => l10n.statusFinished,
    };
  }

  Color _statusColor(BuildContext context, ShiftStatus status) {
    final colors = context.appColors;
    return switch (status) {
      ShiftStatus.active => colors.success,
      ShiftStatus.paused => colors.warning,
      ShiftStatus.finished => colors.info,
    };
  }

  String _formatDuration(BuildContext context, int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    return context.l10n.statsHours(hours, minutes);
  }
}
