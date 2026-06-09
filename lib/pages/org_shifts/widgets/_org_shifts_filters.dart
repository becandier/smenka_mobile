part of '../view/org_shifts_page.dart';

class _OrgShiftsFilters extends StatelessWidget {
  const _OrgShiftsFilters();

  Future<void> _openEmployeePicker(BuildContext context) async {
    final cubit = context.read<OrgShiftsCubit>();
    final result = await context.router.push<EmployeePickerResult?>(
      EmployeePickerRoute(
        orgId: cubit.orgId,
        selectedUserId: cubit.state.filterUserId,
      ),
    );
    if (result != null) {
      cubit.setEmployeeFilter(result.member);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<OrgShiftsCubit, OrgShiftsState>(
      buildWhen: (prev, curr) =>
          prev.filterStatus != curr.filterStatus ||
          prev.filterUserId != curr.filterUserId ||
          prev.filterUserName != curr.filterUserName ||
          prev.hasFilters != curr.hasFilters,
      builder: (context, state) {
        final cubit = context.read<OrgShiftsCubit>();

        return Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _EmployeeFilterChip(
                  label: state.filterUserName ?? l10n.shiftFilterByEmployee,
                  isSelected: state.hasEmployeeFilter,
                  onTap: () => _openEmployeePicker(context),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: l10n.historyFilterAll,
                  isSelected: state.filterStatus == null,
                  onSelected: () => cubit.setStatusFilter(null),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: l10n.historyFilterActive,
                  isSelected: state.filterStatus == ShiftStatus.active,
                  onSelected: () => cubit.setStatusFilter(ShiftStatus.active),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: l10n.historyFilterPaused,
                  isSelected: state.filterStatus == ShiftStatus.paused,
                  onSelected: () => cubit.setStatusFilter(ShiftStatus.paused),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: l10n.historyFilterFinished,
                  isSelected: state.filterStatus == ShiftStatus.finished,
                  onSelected: () => cubit.setStatusFilter(ShiftStatus.finished),
                ),
                if (state.hasFilters) ...[
                  const SizedBox(width: 8),
                  ActionChip(
                    label: Text(l10n.shiftFilterReset),
                    onPressed: cubit.resetFilters,
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

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
    );
  }
}

class _EmployeeFilterChip extends StatelessWidget {
  const _EmployeeFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: Icon(
        Icons.person_outline,
        size: 18,
        color: isSelected ? context.appColors.primary : null,
      ),
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}
