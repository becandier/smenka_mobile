part of '../view/checklist_template_detail_page.dart';

class _ItemsSection extends StatelessWidget {
  const _ItemsSection({required this.detail});

  final ChecklistTemplateDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final sorted = [...detail.items]
      ..sort((a, b) => a.position.compareTo(b.position));

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.checklistTemplateItemsSection,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.add),
                    label: Text(l10n.checklistTemplateItemAdd),
                    onPressed: () => _openAdd(context),
                  ),
                ],
              ),
            ),
            if (sorted.isEmpty)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.checklistTemplateItemsEmpty,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: appColors.secondary),
                ),
              )
            else
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                buildDefaultDragHandles: false,
                itemCount: sorted.length,
                onReorder: (oldIndex, newIndex) => context
                    .read<ChecklistTemplateDetailCubit>()
                    .reorderItems(oldIndex, newIndex),
                itemBuilder: (context, index) {
                  final item = sorted[index];
                  return _ItemTile(
                    key: ValueKey(item.id),
                    item: item,
                    index: index,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _openAdd(BuildContext context) async {
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const _ItemEditorSheet(item: null),
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item, required this.index, super.key});

  final ChecklistTemplateItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Material(
        color: appColors.background,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => _openEdit(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                ReorderableDragStartListener(
                  index: index,
                  child: Icon(
                    Icons.drag_handle,
                    color: appColors.secondary.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.text, style: textTheme.bodyMedium),
                      if (item.isRequired)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            l10n.checklistTemplateItemRequiredLabel,
                            style: textTheme.labelSmall?.copyWith(
                              color: appColors.primary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, color: appColors.error),
                  onPressed: () => _confirmDelete(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openEdit(BuildContext context) async {
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _ItemEditorSheet(item: item),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.checklistTemplateItemDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final cubit = context.read<ChecklistTemplateDetailCubit>();
    final ok = await cubit.deleteItem(item.id);
    if (ok && context.mounted) {
      context.modals.showSuccess(l10n.checklistTemplateItemDeleted);
    }
  }
}
