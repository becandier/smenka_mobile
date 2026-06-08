part of '../view/shift_checklists_page.dart';

class _InstanceTile extends StatelessWidget {
  const _InstanceTile({required this.instance});

  final ChecklistInstance instance;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final statusColor = switch (instance.status) {
      ChecklistInstanceStatus.pending => appColors.primary,
      ChecklistInstanceStatus.completed => appColors.primary,
      ChecklistInstanceStatus.incomplete => appColors.error,
    };

    final statusLabel = switch (instance.status) {
      ChecklistInstanceStatus.pending => l10n.shiftChecklistStatusPending,
      ChecklistInstanceStatus.completed => l10n.shiftChecklistStatusCompleted,
      ChecklistInstanceStatus.incomplete => l10n.shiftChecklistStatusIncomplete,
    };

    final progress = instance.itemsSummary.total == 0
        ? 0.0
        : instance.itemsSummary.completed / instance.itemsSummary.total;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: appColors.surface,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            final cubit = context.read<ShiftChecklistsCubit>();
            await context.router.push(
              ChecklistFillRoute(
                shiftId: cubit.shiftId,
                instanceId: instance.id,
              ),
            );
            await cubit.loadChecklists();
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        instance.name,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (instance.isRequired) ...[
                      const SizedBox(width: 6),
                      _Chip(
                        text: l10n.shiftChecklistRequiredBadge,
                        color: appColors.error,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      instance.status == ChecklistInstanceStatus.completed
                          ? Icons.check_circle
                          : instance.status ==
                                  ChecklistInstanceStatus.incomplete
                              ? Icons.error_outline
                              : Icons.pending_outlined,
                      color: statusColor,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      statusLabel,
                      style: textTheme.bodySmall?.copyWith(color: statusColor),
                    ),
                    const Spacer(),
                    Text(
                      l10n.shiftChecklistProgress(
                        instance.itemsSummary.completed,
                        instance.itemsSummary.total,
                      ),
                      style: textTheme.bodySmall?.copyWith(
                        color: appColors.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 4,
                    backgroundColor: appColors.secondary.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation(statusColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
