part of '../view/shift_tracker_page.dart';

/// Поле выбора графика на idle-экране (только для организационной смены).
///
/// Загрузка/пусто/ошибка — состояния из ТЗ (mobile.md, «Состояния экранов»).
/// 1 доступный график — компактная строка, старт активен сразу (не ломает
/// `shift_quick_start`); >1 — выбор обязателен, строка-плейсхолдер до выбора.
class _WorkScheduleSelector extends StatelessWidget {
  const _WorkScheduleSelector({required this.state});

  final ShiftTrackerState state;

  Future<void> _openPicker(BuildContext context) async {
    final cubit = context.read<ShiftTrackerCubit>();
    final result = await _pushWorkSchedulePicker(context, state);
    if (result != null) cubit.selectWorkSchedule(result.schedule);
  }

  @override
  Widget build(BuildContext context) {
    if (state.schedulesLoading) {
      return const AppShimmerLoader(itemCount: 1, padding: EdgeInsets.zero);
    }

    if (state.schedules.error case final message?) {
      return _ScheduleErrorRow(
        message: localizedErrorMessage(
          context,
          code: state.schedules.errorCode,
          fallback: message,
        ),
        onRetry: () => context.read<ShiftTrackerCubit>().reloadSchedules(),
      );
    }

    // Данных ещё нет (org только что выбрана, запрос не отправлен) — пусто.
    if (state.schedules.data == null) return const SizedBox.shrink();

    final schedules = state.availableSchedules;

    if (schedules.isEmpty) {
      if (!state.requireSchedule) return const SizedBox.shrink();
      return _ScheduleBlockedMessage(
        text: context.l10n.workScheduleRequiredEmpty,
      );
    }

    if (schedules.length == 1) {
      return _ScheduleRow(
        schedule: schedules.first,
        placeholder: false,
        onTap: () => _openPicker(context),
      );
    }

    final selected = state.selectedWorkSchedule;
    return _ScheduleRow(
      schedule: selected,
      placeholder: selected == null,
      onTap: () => _openPicker(context),
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow({
    required this.schedule,
    required this.placeholder,
    required this.onTap,
  });

  final WorkSchedule? schedule;
  final bool placeholder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final schedule = this.schedule;
    final label = schedule == null
        ? l10n.workScheduleSelectPlaceholder
        : '${schedule.name} · ${schedule.startTime} — ${schedule.endTime}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.workScheduleFieldLabel, style: textTheme.titleSmall),
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    size: 20,
                    color: colors.secondary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge?.copyWith(
                        color: placeholder ? colors.secondary : null,
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: colors.secondary),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScheduleBlockedMessage extends StatelessWidget {
  const _ScheduleBlockedMessage({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colors.warning.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: colors.warning, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: textTheme.bodyMedium?.copyWith(color: colors.warning),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleErrorRow extends StatelessWidget {
  const _ScheduleErrorRow({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(Icons.error_outline, color: colors.error, size: 18),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            message,
            style: textTheme.bodySmall?.copyWith(color: colors.error),
          ),
        ),
        TextButton(onPressed: onRetry, child: Text(context.l10n.retry)),
      ],
    );
  }
}
