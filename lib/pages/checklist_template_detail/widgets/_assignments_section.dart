part of '../view/checklist_template_detail_page.dart';

enum _OverrideChoice { defaults, add, remove }

class _AssignmentsSection extends StatelessWidget {
  const _AssignmentsSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ChecklistTemplateDetailCubit,
        ChecklistTemplateDetailState>(
      buildWhen: (p, c) =>
          p.assignments.data != c.assignments.data ||
          p.members.data != c.members.data ||
          p.members.isLoading != c.members.isLoading ||
          p.pendingMemberIds != c.pendingMemberIds,
      builder: (context, state) {
        final members = state.members.data ?? const <Member>[];

        return Material(
          color: appColors.surface,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.checklistTemplatePersonalSection,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.checklistTemplatePersonalHint,
                  style: textTheme.bodySmall?.copyWith(
                    color: appColors.secondary,
                  ),
                ),
                const SizedBox(height: 12),
                if (state.members.isLoading && members.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  )
                else if (members.isEmpty)
                  Text(
                    l10n.membersEmpty,
                    style: TextStyle(color: appColors.secondary),
                  )
                else
                  Column(
                    children: [
                      for (final member in members) ...[
                        _MemberOverrideRow(member: member),
                        if (member != members.last)
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

class _MemberOverrideRow extends StatelessWidget {
  const _MemberOverrideRow({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocSelector<
        ChecklistTemplateDetailCubit,
        ChecklistTemplateDetailState,
        ({_OverrideChoice choice, bool isPending})>(
      selector: (state) {
        final assignments = state.assignments.data;
        final isAdded =
            assignments?.personalAdd.any((u) => u.userId == member.userId) ??
                false;
        final isRemoved =
            assignments?.personalRemove.any((u) => u.userId == member.userId) ??
                false;
        final choice = isAdded
            ? _OverrideChoice.add
            : isRemoved
                ? _OverrideChoice.remove
                : _OverrideChoice.defaults;
        return (
          choice: choice,
          isPending: state.pendingMemberIds.contains(member.userId),
        );
      },
      builder: (context, data) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: appColors.primary.withValues(alpha: 0.1),
                child: Text(
                  member.userName.isNotEmpty
                      ? member.userName[0].toUpperCase()
                      : '?',
                  style:
                      textTheme.labelMedium?.copyWith(color: appColors.primary),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.userName,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (member.customRole != null)
                      Text(
                        member.customRole!.name,
                        style: textTheme.labelSmall?.copyWith(
                          color: appColors.secondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _OverrideSwitcher(
                member: member,
                choice: data.choice,
                isPending: data.isPending,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OverrideSwitcher extends StatelessWidget {
  const _OverrideSwitcher({
    required this.member,
    required this.choice,
    required this.isPending,
  });

  final Member member;
  final _OverrideChoice choice;
  final bool isPending;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    final buttons = <Widget>[
      _OverrideChip(
        label: l10n.checklistOverrideDefault,
        color: appColors.secondary,
        selected: choice == _OverrideChoice.defaults,
        isPending: isPending && choice == _OverrideChoice.defaults,
        onTap: () => _onTap(context, _OverrideChoice.defaults),
      ),
      const SizedBox(width: 4),
      _OverrideChip(
        label: l10n.checklistOverrideAdd,
        color: appColors.primary,
        selected: choice == _OverrideChoice.add,
        isPending: isPending && choice == _OverrideChoice.add,
        onTap: () => _onTap(context, _OverrideChoice.add),
      ),
      const SizedBox(width: 4),
      _OverrideChip(
        label: l10n.checklistOverrideRemove,
        color: appColors.error,
        selected: choice == _OverrideChoice.remove,
        isPending: isPending && choice == _OverrideChoice.remove,
        onTap: () => _onTap(context, _OverrideChoice.remove),
      ),
    ];

    return Row(mainAxisSize: MainAxisSize.min, children: buttons);
  }

  Future<void> _onTap(BuildContext context, _OverrideChoice target) async {
    if (target == choice || isPending) return;

    final cubit = context.read<ChecklistTemplateDetailCubit>();
    final l10n = context.l10n;
    final detail = cubit.state.template.data;

    if (detail != null &&
        detail.isArchived &&
        target != _OverrideChoice.defaults) {
      context.modals.showError(l10n.checklistTemplateArchiveEditError);
      return;
    }

    final ok = switch (target) {
      _OverrideChoice.defaults =>
        await cubit.clearPersonalOverride(member.userId),
      _OverrideChoice.add => await cubit.setPersonalOverride(
          member.userId,
          ChecklistOverrideType.add,
        ),
      _OverrideChoice.remove => await cubit.setPersonalOverride(
          member.userId,
          ChecklistOverrideType.remove,
        ),
    };

    if (!ok && context.mounted) {
      final error = cubit.state.actionError;
      context.modals.showError(error ?? l10n.error);
    }
  }
}

class _OverrideChip extends StatelessWidget {
  const _OverrideChip({
    required this.label,
    required this.color,
    required this.selected,
    required this.isPending,
    required this.onTap,
  });

  final String label;
  final Color color;
  final bool selected;
  final bool isPending;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final background =
        selected ? color.withValues(alpha: 0.15) : Colors.transparent;
    final borderColor = selected ? color : color.withValues(alpha: 0.35);
    final textColor = selected ? color : color.withValues(alpha: 0.7);

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: 36, minHeight: 28),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          alignment: Alignment.center,
          child: isPending
              ? SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.6,
                    valueColor: AlwaysStoppedAnimation(textColor),
                  ),
                )
              : Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
        ),
      ),
    );
  }
}
