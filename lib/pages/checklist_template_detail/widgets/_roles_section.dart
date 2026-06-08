part of '../view/checklist_template_detail_page.dart';

class _RolesSection extends StatelessWidget {
  const _RolesSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ChecklistTemplateDetailCubit,
        ChecklistTemplateDetailState>(
      buildWhen: (p, c) =>
          p.assignments.data != c.assignments.data ||
          p.roles.data != c.roles.data,
      builder: (context, state) {
        final assignments = state.assignments.data;
        final allRoles = state.roles.data ?? const <OrganizationRole>[];
        final assignedIds = assignments?.roleIds.toSet() ?? const <String>{};
        final assignedRoles =
            allRoles.where((r) => assignedIds.contains(r.id)).toList();

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
                        l10n.checklistTemplateRolesSection,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _openAssign(context, assignedIds),
                      child: Text(l10n.checklistTemplateAssignRoles),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (assignedRoles.isEmpty)
                  Text(
                    l10n.checklistTemplateRolesEmpty,
                    style: TextStyle(color: appColors.secondary),
                  )
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: assignedRoles
                        .map(
                          (r) => Chip(
                            label: Text(r.name),
                            backgroundColor:
                                appColors.primary.withValues(alpha: 0.1),
                            labelStyle: TextStyle(color: appColors.primary),
                            side: BorderSide.none,
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _openAssign(
    BuildContext context,
    Set<String> initialSelected,
  ) async {
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _AssignRolesSheet(initialSelected: initialSelected),
      ),
    );
  }
}
