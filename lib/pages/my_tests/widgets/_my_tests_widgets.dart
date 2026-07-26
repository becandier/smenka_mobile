part of '../view/my_tests_page.dart';

class _MyTestCard extends StatelessWidget {
  const _MyTestCard({required this.assignment, required this.onTap});

  final TestAssignment assignment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;
    final statusLabel = _statusLabel(context, assignment.status);
    final statusColor = _statusColor(context, assignment.status);

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      assignment.template.title,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 2,
                        bottom: 2,
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
              const SizedBox(height: 8),
              Text(
                assignment.organizationName,
                style: textTheme.bodySmall?.copyWith(color: colors.secondary),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.myTestsAttemptsProgress(
                  assignment.attemptsUsed,
                  assignment.template.maxAttempts,
                ),
                style: textTheme.bodySmall?.copyWith(color: colors.secondary),
              ),
              if (assignment.bestPercent case final bestPercent?) ...[
                const SizedBox(height: 2),
                Text(
                  l10n.myTestsBestPercent(bestPercent),
                  style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                ),
              ],
              if (assignment.dueAt case final dueAt?) ...[
                const SizedBox(height: 2),
                Text(
                  l10n.myTestsDueDate(
                    DateFormat('dd.MM.yyyy').format(dueAt.toLocal()),
                  ),
                  style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _statusLabel(BuildContext context, TestAssignmentStatus status) {
    final l10n = context.l10n;
    return switch (status) {
      TestAssignmentStatus.assigned => l10n.myTestsStatusAssigned,
      TestAssignmentStatus.inProgress => l10n.myTestsStatusInProgress,
      TestAssignmentStatus.passed => l10n.myTestsStatusPassed,
      TestAssignmentStatus.failed => l10n.myTestsStatusFailed,
      TestAssignmentStatus.unknown => l10n.myTestsStatusAssigned,
    };
  }

  Color _statusColor(BuildContext context, TestAssignmentStatus status) {
    final colors = context.appColors;
    return switch (status) {
      TestAssignmentStatus.assigned => colors.info,
      TestAssignmentStatus.inProgress => colors.warning,
      TestAssignmentStatus.passed => colors.success,
      TestAssignmentStatus.failed => colors.error,
      TestAssignmentStatus.unknown => colors.secondary,
    };
  }
}

class _OrgFilterRow extends StatelessWidget {
  const _OrgFilterRow();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocSelector<
      MyTestsCubit,
      MyTestsState,
      ({List<Organization> organizations, String? filterOrganizationId})
    >(
      selector: (state) => (
        organizations: state.organizations,
        filterOrganizationId: state.filterOrganizationId,
      ),
      builder: (context, data) {
        // Фильтр не нужен, пока у пользователя одна организация или меньше.
        if (data.organizations.length <= 1) return const SizedBox.shrink();

        final cubit = context.read<MyTestsCubit>();

        return Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ChoiceChip(
                  label: Text(l10n.myTestsAllOrganizations),
                  selected: data.filterOrganizationId == null,
                  onSelected: (_) => cubit.setOrganizationFilter(null),
                ),
                for (final org in data.organizations) ...[
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: Text(org.name),
                    selected: data.filterOrganizationId == org.id,
                    onSelected: (_) => cubit.setOrganizationFilter(org.id),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
