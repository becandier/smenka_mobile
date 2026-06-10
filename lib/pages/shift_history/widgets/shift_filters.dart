part of '../view/shift_history_page.dart';

class _ShiftFilters extends StatelessWidget {
  const _ShiftFilters();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<ShiftHistoryCubit>();
    final result = await context.router.push<DateRangePickerResult?>(
      DateRangePickerRoute(
        initialFrom: cubit.state.filterDateFrom?.toLocal(),
        initialTo: cubit.state.filterDateTo?.toLocal(),
      ),
    );
    if (result != null) {
      cubit.setDateRange(result.fromUtc, result.toUtc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftHistoryCubit, ShiftHistoryState>(
      buildWhen: (prev, curr) =>
          prev.filterStatus != curr.filterStatus ||
          prev.filterDateFrom != curr.filterDateFrom ||
          prev.filterDateTo != curr.filterDateTo,
      builder: (context, state) {
        final filterStatus = state.filterStatus;

        return Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                DateRangeFilterChip(
                  from: state.filterDateFrom,
                  to: state.filterDateTo,
                  label: context.l10n.dateRangeFilterTitle,
                  onTap: () => _openDateRangePicker(context),
                  onClear: () => context
                      .read<ShiftHistoryCubit>()
                      .setDateRange(null, null),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: context.l10n.historyFilterAll,
                  isSelected: filterStatus == null,
                  onSelected: () =>
                      context.read<ShiftHistoryCubit>().setStatusFilter(null),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: context.l10n.historyFilterActive,
                  isSelected: filterStatus == ShiftStatus.active,
                  onSelected: () => context
                      .read<ShiftHistoryCubit>()
                      .setStatusFilter(ShiftStatus.active),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: context.l10n.historyFilterPaused,
                  isSelected: filterStatus == ShiftStatus.paused,
                  onSelected: () => context
                      .read<ShiftHistoryCubit>()
                      .setStatusFilter(ShiftStatus.paused),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: context.l10n.historyFilterFinished,
                  isSelected: filterStatus == ShiftStatus.finished,
                  onSelected: () => context
                      .read<ShiftHistoryCubit>()
                      .setStatusFilter(ShiftStatus.finished),
                ),
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
