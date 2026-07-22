part of '../view/shift_detail_page.dart';

/// Блок переработки на завершённой смене (ТЗ п.3): статус текущей заявки
/// (если есть) + действие «Добавить переработку»/«Отменить заявку».
///
/// Видимость «Добавить переработку» считается в
/// `ShiftDetailState.canAddOvertime` (клиентское приближение серверного
/// `OVERTIME_NOT_APPLICABLE`, включая срок подачи `overtime_request_days`) —
/// виджет только читает готовый флаг.
class _OvertimeSection extends StatelessWidget {
  const _OvertimeSection({required this.state});

  final ShiftDetailState state;

  Future<void> _openForm(BuildContext context) async {
    final cubit = context.read<ShiftDetailCubit>();
    final result = await context.router.push<ShiftOvertimeRequest?>(
      OvertimeRequestRoute(shiftId: state.shift.id),
    );
    if (result != null && context.mounted) {
      cubit.applyOvertimeRequest(result);
    }
  }

  Future<void> _cancel(BuildContext context) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.overtimeCancelConfirmTitle),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    await context.read<ShiftDetailCubit>().cancelOvertimeRequest();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final overtime = state.shift.overtime;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.overtimeSectionTitle,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (overtime != null) ...[
              const SizedBox(height: 12),
              _OvertimeStatusCard(overtime: overtime),
            ],
            const SizedBox(height: 12),
            if (state.canAddOvertime)
              AppButton(
                label: l10n.overtimeAddButton,
                isOutlined: true,
                onPressed: () => _openForm(context),
              )
            else if (overtime?.status == OvertimeStatus.pending)
              AppButton(
                label: l10n.overtimeCancelButton,
                isOutlined: true,
                isLoading: state.isActionLoading,
                onPressed: () => _cancel(context),
              ),
          ],
        ),
      ),
    );
  }
}

class _OvertimeStatusCard extends StatelessWidget {
  const _OvertimeStatusCard({required this.overtime});

  final ShiftOvertimeRequest overtime;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final (label, color) = switch (overtime.status) {
      OvertimeStatus.pending => (
        l10n.overtimeStatusPending(overtime.minutes),
        colors.warning,
      ),
      OvertimeStatus.approved => (
        l10n.overtimeStatusApproved(overtime.minutes),
        colors.success,
      ),
      OvertimeStatus.rejected => (l10n.overtimeStatusRejected, colors.error),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (overtime.reviewComment case final comment?
                when comment.trim().isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                comment,
                style: textTheme.bodySmall?.copyWith(color: colors.secondary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
