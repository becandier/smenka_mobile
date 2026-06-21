part of '../view/shift_detail_page.dart';

class _DetailInfoSection extends StatelessWidget {
  const _DetailInfoSection({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _InfoRow(
              label: l10n.detailStarted,
              value: _formatDateTime(shift.startedAt),
            ),
            const Divider(),
            _InfoRow(
              label: l10n.detailFinished,
              value: switch (shift.finishedAt) {
                final dt? => _formatDateTime(dt),
                null => l10n.detailInProgress,
              },
            ),
            const Divider(),
            _InfoRow(
              label: l10n.detailDuration,
              value: _formatDuration(context, shift.workedSeconds),
            ),
            const Divider(),
            _InfoRow(
              label: l10n.detailStatus,
              trailing: _StatusBadge(status: shift.status),
            ),
            const Divider(),
            _InfoRow(
              label: l10n.detailOrganization,
              value: shift.organizationId != null
                  ? l10n.detailOrganization
                  : l10n.detailPersonal,
            ),
            if (shift.workLocation case final loc?) ...[
              const Divider(),
              _InfoRow(label: l10n.detailWorkLocation, value: loc.name),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, this.value, this.trailing});

  final String label;
  final String? value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(color: colors.secondary),
          ),
          if (trailing case final trailingWidget?)
            trailingWidget
          else
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  value ?? '',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final ShiftStatus status;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = _statusColor(context, status);
    final label = _statusLabel(context, status);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: const SizedBox(width: 8, height: 8),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: textTheme.labelMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatDateTime(DateTime dt) {
  return DateFormat('dd.MM.yyyy, HH:mm').format(dt);
}

String _formatDuration(BuildContext context, int totalSeconds) {
  final hours = totalSeconds ~/ 3600;
  final minutes = (totalSeconds % 3600) ~/ 60;
  return context.l10n.statsHours(hours, minutes);
}

String _statusLabel(BuildContext context, ShiftStatus status) {
  return switch (status) {
    ShiftStatus.active => context.l10n.statusActive,
    ShiftStatus.paused => context.l10n.statusPaused,
    ShiftStatus.finished => context.l10n.statusFinished,
  };
}

Color _statusColor(BuildContext context, ShiftStatus status) {
  return switch (status) {
    ShiftStatus.active => context.appColors.success,
    ShiftStatus.paused => context.appColors.warning,
    ShiftStatus.finished => context.appColors.info,
  };
}
