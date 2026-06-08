part of '../view/checklist_template_detail_page.dart';

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.detail});

  final ChecklistTemplateDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    detail.name,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () => _openRename(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(l10n.checklistTemplateTypeLabel, style: textTheme.labelLarge),
            const SizedBox(height: 6),
            SegmentedButton<ChecklistType>(
              segments: [
                ButtonSegment(
                  value: ChecklistType.shiftStart,
                  label: Text(l10n.checklistTemplatesShiftStart),
                ),
                ButtonSegment(
                  value: ChecklistType.shiftEnd,
                  label: Text(l10n.checklistTemplatesShiftEnd),
                ),
              ],
              selected: {detail.type},
              onSelectionChanged: (s) =>
                  _updateType(context, s.first),
            ),
            SwitchListTile.adaptive(
              value: detail.isRequired,
              onChanged: (v) => _updateRequired(context, v),
              title: Text(l10n.checklistTemplateIsRequiredLabel),
              subtitle: Text(l10n.checklistTemplateIsRequiredDesc),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openRename(BuildContext context) async {
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _RenameTemplateSheet(initial: detail.name),
      ),
    );
  }

  Future<void> _updateType(BuildContext context, ChecklistType type) async {
    if (type == detail.type) return;
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    final ok = await cubit.updateMeta(type: type);
    if (ok && context.mounted) {
      context.modals.showSuccess(context.l10n.checklistTemplateUpdated);
    }
  }

  Future<void> _updateRequired(BuildContext context, bool value) async {
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    final ok = await cubit.updateMeta(isRequired: value);
    if (ok && context.mounted) {
      context.modals.showSuccess(context.l10n.checklistTemplateUpdated);
    }
  }
}
