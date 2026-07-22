import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Результат выбора графика в модалке. Закрытие свайпом/тапом по фону
/// возвращает `null` целиком — вызывающая сторона выбор не меняет.
class WorkSchedulePickerResult {
  const WorkSchedulePickerResult(this.schedule);

  final WorkSchedule schedule;
}

/// Модалка выбора графика при старте смены (`work_schedules`). Список уже
/// загружен вызывающей стороной (`ShiftTrackerCubit`) — здесь только выбор
/// карточкой, без собственного сетевого запроса (см. решение в mobile.md:
/// повторный фетч дал бы рассинхрон с уже показанной компактной строкой на
/// idle-экране).
@RoutePage()
class WorkSchedulePickerPage extends StatelessWidget {
  const WorkSchedulePickerPage({
    required this.schedules,
    this.selectedScheduleId,
    this.organizationTimezone = 'Europe/Moscow',
    super.key,
  });

  final List<WorkSchedule> schedules;
  final String? selectedScheduleId;
  final String organizationTimezone;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.workSchedulePickerTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final schedule in schedules) ...[
            _ScheduleCard(
              schedule: schedule,
              isSelected: schedule.id == selectedScheduleId,
              organizationTimezone: organizationTimezone,
              onTap: () =>
                  context.router.maybePop(WorkSchedulePickerResult(schedule)),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({
    required this.schedule,
    required this.isSelected,
    required this.organizationTimezone,
    required this.onTap,
  });

  final WorkSchedule schedule;
  final bool isSelected;
  final String organizationTimezone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final hours = schedule.durationMinutes ~/ 60;
    final minutes = schedule.durationMinutes % 60;

    return Material(
      color: isSelected
          ? colors.primary.withValues(alpha: 0.08)
          : colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${schedule.startTime} — ${schedule.endTime}',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (schedule.crossesMidnight) ...[
                          const SizedBox(width: 6),
                          Text(
                            l10n.workScheduleCrossesMidnight,
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.secondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${schedule.name} · ${l10n.statsHours(hours, minutes)}',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _ScheduleStatus(
                      schedule: schedule,
                      organizationTimezone: organizationTimezone,
                    ),
                  ],
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Icon(Icons.check_circle, color: colors.primary),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Статус-бейдж карточки — правила из ТЗ (mobile.md, п.1):
/// `is_current && starts_in_minutes <= 0` → «Идёт сейчас» + «начался N мин
/// назад»; `starts_in_minutes > 0` → «Начнётся через N мин/ч»; иначе —
/// плановая дата начала в таймзоне организации.
class _ScheduleStatus extends StatelessWidget {
  const _ScheduleStatus({
    required this.schedule,
    required this.organizationTimezone,
  });

  final WorkSchedule schedule;
  final String organizationTimezone;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final startsIn = schedule.startsInMinutes;

    if (schedule.isCurrent && startsIn <= 0) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 4,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.success.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                l10n.workScheduleBadgeCurrent,
                style: textTheme.labelSmall?.copyWith(
                  color: colors.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (startsIn < 0)
            Text(
              l10n.workScheduleStartedMinutesAgo(-startsIn),
              style: textTheme.bodySmall?.copyWith(color: colors.secondary),
            ),
        ],
      );
    }

    if (startsIn > 0) {
      final label = startsIn < 60
          ? l10n.workScheduleStartsInMinutes(startsIn)
          : l10n.workScheduleStartsInHours(startsIn ~/ 60);
      return Text(
        label,
        style: textTheme.bodySmall?.copyWith(
          color: colors.primary,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return Text(
      _plannedDateLabel(context, schedule, organizationTimezone),
      style: textTheme.bodySmall?.copyWith(color: colors.secondary),
    );
  }

  String _plannedDateLabel(
    BuildContext context,
    WorkSchedule schedule,
    String timezone,
  ) {
    final l10n = context.l10n;
    final localStart = toOrgLocal(schedule.nextStartAt, timezone);
    final localNow = toOrgLocal(DateTime.now().toUtc(), timezone);
    final startDate = DateTime(
      localStart.year,
      localStart.month,
      localStart.day,
    );
    final nowDate = DateTime(localNow.year, localNow.month, localNow.day);
    final diffDays = startDate.difference(nowDate).inDays;

    if (diffDays == 0) {
      return l10n.workScheduleStartsTodayAt(schedule.startTime);
    }
    if (diffDays == 1) {
      return l10n.workScheduleStartsTomorrowAt(schedule.startTime);
    }
    final dateLabel = DateFormat('dd.MM').format(localStart);
    return l10n.workScheduleStartsOnDateAt(dateLabel, schedule.startTime);
  }
}
