part of '../view/shift_tracker_page.dart';

class _ShiftChecklistsTile extends StatefulWidget {
  const _ShiftChecklistsTile({required this.shiftId});

  final String shiftId;

  @override
  State<_ShiftChecklistsTile> createState() => _ShiftChecklistsTileState();
}

class _ShiftChecklistsTileState extends State<_ShiftChecklistsTile> {
  late Future<List<ChecklistInstance>> _future;

  @override
  void initState() {
    super.initState();
    _future = _fetch();
  }

  Future<List<ChecklistInstance>> _fetch() async {
    final repo = context.read<ChecklistRepository>();
    final task = await repo.getShiftChecklists(widget.shiftId);
    return task.fold(
      onSuccess: (list) => list,
      onFailure: (_) => const <ChecklistInstance>[],
    );
  }

  Future<void> _open() async {
    await context.router.push(ShiftChecklistsRoute(shiftId: widget.shiftId));
    if (!mounted) return;
    setState(() => _future = _fetch());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<List<ChecklistInstance>>(
      future: _future,
      builder: (context, snapshot) {
        final items = snapshot.data ?? const <ChecklistInstance>[];
        if (snapshot.connectionState != ConnectionState.done && items.isEmpty) {
          return const SizedBox.shrink();
        }
        if (items.isEmpty) return const SizedBox.shrink();

        final incompleteRequired = items
            .where(
              (i) =>
                  i.isRequired && i.status != ChecklistInstanceStatus.completed,
            )
            .length;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Material(
            color: appColors.surface,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: _open,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Icon(Icons.checklist, color: appColors.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.shiftChecklistsTitle,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (incompleteRequired > 0)
                      Material(
                        color: appColors.error,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: Text(
                            '$incompleteRequired',
                            style: textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.chevron_right,
                      color: appColors.secondary.withValues(alpha: 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
