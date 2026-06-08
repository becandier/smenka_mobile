part of '../view/shift_detail_page.dart';

class _DetailChecklistsSection extends StatefulWidget {
  const _DetailChecklistsSection({required this.shift});

  final Shift shift;

  @override
  State<_DetailChecklistsSection> createState() =>
      _DetailChecklistsSectionState();
}

class _DetailChecklistsSectionState extends State<_DetailChecklistsSection> {
  late Future<List<ChecklistInstance>> _future;

  @override
  void initState() {
    super.initState();
    _future = _fetch();
  }

  Future<List<ChecklistInstance>> _fetch() async {
    final repo = context.read<ChecklistRepository>();
    final task = await repo.getShiftChecklists(widget.shift.id);
    return task.fold(
      onSuccess: (list) => list,
      onFailure: (_) => const <ChecklistInstance>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<List<ChecklistInstance>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        }

        final items = snapshot.data ?? const <ChecklistInstance>[];
        if (items.isEmpty) return const SizedBox.shrink();

        return Material(
          color: appColors.surface,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    l10n.shiftChecklistsTitle,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                ...items.map((i) => _InstanceRow(shift: widget.shift, item: i)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InstanceRow extends StatelessWidget {
  const _InstanceRow({required this.shift, required this.item});

  final Shift shift;
  final ChecklistInstance item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final statusColor = switch (item.status) {
      ChecklistInstanceStatus.pending => appColors.primary,
      ChecklistInstanceStatus.completed => appColors.primary,
      ChecklistInstanceStatus.incomplete => appColors.error,
    };

    final statusLabel = switch (item.status) {
      ChecklistInstanceStatus.pending => l10n.shiftChecklistStatusPending,
      ChecklistInstanceStatus.completed => l10n.shiftChecklistStatusCompleted,
      ChecklistInstanceStatus.incomplete =>
        l10n.shiftChecklistStatusIncomplete,
    };

    return InkWell(
      onTap: () => context.router.push(
        ChecklistFillRoute(shiftId: shift.id, instanceId: item.id),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(
              item.status == ChecklistInstanceStatus.completed
                  ? Icons.check_circle
                  : item.status == ChecklistInstanceStatus.incomplete
                      ? Icons.error_outline
                      : Icons.pending_outlined,
              color: statusColor,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '$statusLabel · ${l10n.shiftChecklistProgress(
                      item.itemsSummary.completed,
                      item.itemsSummary.total,
                    )}',
                    style: textTheme.bodySmall?.copyWith(
                      color: appColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: appColors.secondary.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
