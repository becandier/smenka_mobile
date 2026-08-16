part of '../view/shift_history_page.dart';

class _ShiftCard extends StatelessWidget {
  const _ShiftCard({required this.shift, required this.onTap});

  final Shift shift;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;
    final l10n = context.l10n;

    final statusLabel = _statusLabel(context, shift.status);
    final statusColor = _statusColor(context, shift.status);
    final dateFormatted = DateFormat(
      'dd.MM.yyyy, HH:mm',
    ).format(shift.startedAt);
    final duration = _formatDuration(context, shift.workedSeconds);
    final orgLabel = shift.organizationId != null
        ? l10n.detailOrganization
        : l10n.detailPersonal;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Left: date + org
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
                      orgLabel,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                    if (shift.workLocation case final loc?) ...[
                      const SizedBox(height: 2),
                      WorkLocationLine(name: loc.name),
                    ],
                    if (_manualBadgeLabel(context, shift)
                        case final label?) ...[
                      const SizedBox(height: 4),
                      _ManualBadge(label: label),
                    ],
                  ],
                ),
              ),

              // Right: duration + status
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    duration,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
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

/// Пометка «Добавлена/Изменена администратором» (`manual_time_entry`,
/// прозрачность ручных правок для сотрудника). `isManual` (заведена целиком)
/// приоритетнее `isEdited` (только правилась) — это первичный факт
/// происхождения смены. `null` — обычная смена, без пометки.
String? _manualBadgeLabel(BuildContext context, Shift shift) {
  final l10n = context.l10n;
  if (shift.isManual) return l10n.shiftManualAddedBadge;
  if (shift.isEdited) return l10n.shiftManualEditedBadge;
  return null;
}

class _ManualBadge extends StatelessWidget {
  const _ManualBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.info.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colors.info,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
