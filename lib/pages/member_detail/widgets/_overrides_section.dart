part of '../view/member_detail_page.dart';

class _OverridesSection extends StatelessWidget {
  const _OverridesSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MemberDetailCubit, MemberDetailState>(
      buildWhen: (p, c) =>
          p.overrides.data != c.overrides.data ||
          p.overrides.isLoading != c.overrides.isLoading ||
          p.pendingTemplateIds != c.pendingTemplateIds,
      builder: (context, state) {
        final items = state.overrides.data ?? const <MemberChecklistOverride>[];

        return Material(
          color: appColors.surface,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.memberDetailOverridesSection,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.memberDetailOverridesHint,
                  style: textTheme.bodySmall?.copyWith(
                    color: appColors.secondary,
                  ),
                ),
                const SizedBox(height: 12),
                if (state.overrides.isLoading && items.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  )
                else if (items.isEmpty)
                  Text(
                    l10n.memberDetailOverridesEmpty,
                    style: TextStyle(color: appColors.secondary),
                  )
                else
                  Column(
                    children: [
                      for (final item in items) ...[
                        _OverrideRow(
                          item: item,
                          isPending: state.pendingTemplateIds.contains(
                            item.templateId,
                          ),
                        ),
                        if (item != items.last)
                          Divider(
                            height: 1,
                            thickness: 0.5,
                            color: appColors.secondary.withValues(alpha: 0.15),
                          ),
                      ],
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OverrideRow extends StatelessWidget {
  const _OverrideRow({required this.item, required this.isPending});

  final MemberChecklistOverride item;
  final bool isPending;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final typeColor = item.type == ChecklistOverrideType.add
        ? appColors.primary
        : appColors.error;
    final typeLabel = item.type == ChecklistOverrideType.add
        ? l10n.memberDetailOverrideAdd
        : l10n.memberDetailOverrideRemove;
    final typeScopeLabel = item.templateType == ChecklistType.shiftStart
        ? l10n.checklistTemplatesShiftStart
        : l10n.checklistTemplatesShiftEnd;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Material(
            color: typeColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text(
                typeLabel,
                style: textTheme.labelSmall?.copyWith(
                  color: typeColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.templateName,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  typeScopeLabel,
                  style: textTheme.labelSmall?.copyWith(
                    color: appColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (isPending)
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator.adaptive(strokeWidth: 1.6),
            )
          else
            PopupMenuButton<_OverrideAction>(
              tooltip: l10n.memberDetailOverrideAction,
              onSelected: (action) => _handle(context, action),
              itemBuilder: (_) => [
                if (item.type != ChecklistOverrideType.add)
                  PopupMenuItem(
                    value: _OverrideAction.switchToAdd,
                    child: Text(l10n.memberDetailOverrideSwitchAdd),
                  ),
                if (item.type != ChecklistOverrideType.remove)
                  PopupMenuItem(
                    value: _OverrideAction.switchToRemove,
                    child: Text(l10n.memberDetailOverrideSwitchRemove),
                  ),
                PopupMenuItem(
                  value: _OverrideAction.clear,
                  child: Text(l10n.memberDetailOverrideClear),
                ),
              ],
              icon: const Icon(Icons.more_vert),
            ),
        ],
      ),
    );
  }

  Future<void> _handle(BuildContext context, _OverrideAction action) async {
    final cubit = context.read<MemberDetailCubit>();
    final ok = switch (action) {
      _OverrideAction.switchToAdd => await cubit.setOverride(
        item.templateId,
        ChecklistOverrideType.add,
      ),
      _OverrideAction.switchToRemove => await cubit.setOverride(
        item.templateId,
        ChecklistOverrideType.remove,
      ),
      _OverrideAction.clear => await cubit.clearOverride(item.templateId),
    };
    if (!ok && context.mounted) {
      final error = cubit.state.actionError;
      context.modals.showError(error ?? context.l10n.error);
    }
  }
}

enum _OverrideAction { switchToAdd, switchToRemove, clear }
