import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/l10n/applied_range_label.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/date_range_picker/_date_range_picker.dart';
import 'package:smenka_mobile/pages/my_earnings/cubit/my_earnings_cubit.dart';
import 'package:smenka_mobile/pages/my_earnings/cubit/my_earnings_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// «Мой заработок» — личный заработок сотрудника за период (org_member).
///
/// [initialDateFrom]/[initialDateTo] — необязательные границы периода
/// (`earnings_drilldown/mobile.md`, «A»): открыт из истории смен — экран
/// стартует на том же окне, что было выбрано там; открыт обычным путём
/// (навигация по организации) — оба `null`, экран работает как раньше
/// (свой пресет, по умолчанию текущий месяц). Не query-параметры URL — оба
/// поля передаются программно через `context.router.push`, как уже сделано
/// для `ChecklistFillPage.organizationId`.
@RoutePage()
class MyEarningsPage extends StatelessWidget {
  const MyEarningsPage({
    @pathParam required this.orgId,
    this.initialDateFrom,
    this.initialDateTo,
    super.key,
  });

  final String orgId;
  final DateTime? initialDateFrom;
  final DateTime? initialDateTo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyEarningsCubit(
        orgId: orgId,
        payrollRepository: context.read<PayrollRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
        initialDateFrom: initialDateFrom,
        initialDateTo: initialDateTo,
      ),
      child: const _MyEarningsView(),
    );
  }
}

class _MyEarningsView extends StatelessWidget {
  const _MyEarningsView();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<MyEarningsCubit>();
    final timeContext = cubit.state.timeContext;
    final customFrom = cubit.state.customFrom;
    final customTo = cubit.state.customTo;
    final result = await context.router.push<DateRangePickerResult?>(
      DateRangePickerRoute(
        initialFrom: customFrom == null
            ? null
            : appTimeCalendarDay(customFrom, timeContext),
        initialTo: customTo == null
            ? null
            : appTimeCalendarDay(customTo, timeContext),
      ),
    );
    if (result != null) {
      cubit.setCustomRange(
        result.fromUtc(timeContext),
        result.toUtc(timeContext),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.payrollMyEarningsTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: BlocBuilder<MyEarningsCubit, MyEarningsState>(
              buildWhen: (prev, curr) =>
                  prev.preset != curr.preset ||
                  prev.customFrom != curr.customFrom ||
                  prev.customTo != curr.customTo,
              builder: (context, state) {
                final cubit = context.read<MyEarningsCubit>();
                return PeriodPresetSelector(
                  preset: state.preset,
                  customFrom: state.customFrom,
                  customTo: state.customTo,
                  timeContext: state.timeContext,
                  onPresetChanged: cubit.setPreset,
                  onCustomTap: () => _openDateRangePicker(context),
                  onCustomClear: () => cubit.setCustomRange(null, null),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child:
                SectionDataWrapper<
                  MyEarningsCubit,
                  MyEarningsState,
                  MyEarnings
                >(
                  selector: (state) => state.earnings,
                  onRetry: () => context.read<MyEarningsCubit>().load(),
                  contentBuilder: (earnings) {
                    final timeContext = context
                        .read<MyEarningsCubit>()
                        .state
                        .timeContext;
                    return RefreshIndicator.adaptive(
                      onRefresh: () => context.read<MyEarningsCubit>().load(),
                      child: ListView(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 32,
                        ),
                        children: [
                          if (appliedRangeLabel(
                                context,
                                earnings.period.dateFrom,
                                earnings.period.dateTo,
                                timeContext,
                              )
                              case final label?)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                label,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: context.appColors.secondary,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          _EarnedCard(earnings: earnings),
                          const SizedBox(height: 16),
                          _BreakdownCard(
                            earnings: earnings,
                            orgId: context.read<MyEarningsCubit>().orgId,
                          ),
                          const SizedBox(height: 16),
                          _PotentialEarningsCard(earnings: earnings),
                          const SizedBox(height: 16),
                          _WorkedStatsCard(earnings: earnings),
                          const SizedBox(height: 16),
                          _CurrentRateCard(
                            currentRate: earnings.currentRate,
                            timeContext: timeContext,
                          ),
                          if (earnings.hasMissingRate) ...[
                            const SizedBox(height: 16),
                            const _MissingRateBanner(),
                          ],
                        ],
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

/// «Заработано за период» — крупно, это ответ на главный вопрос экрана,
/// читается первым (`earnings_drilldown/mobile.md`, «B», п.1). Тот же
/// термин («Заработано», `net_amount_minor`), что и в истории смен.
class _EarnedCard extends StatelessWidget {
  const _EarnedCard({required this.earnings});

  final MyEarnings earnings;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final net = earnings.netAmountMinor;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.historyEarned,
              style: textTheme.bodyMedium?.copyWith(color: colors.secondary),
            ),
            const SizedBox(height: 6),
            Text(
              formatMoneyMinor(net),
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: net < 0 ? colors.error : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// «Отработано / смен» (`earnings_drilldown/mobile.md`, «B», п.4) — как
/// сейчас, только без «По ставке»: та цифра переехала в [_BreakdownCard]
/// первым звеном цепочки «из чего сложилось».
class _WorkedStatsCard extends StatelessWidget {
  const _WorkedStatsCard({required this.earnings});

  final MyEarnings earnings;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _SummaryItem(
                value: _formatDuration(context, earnings.workedSeconds),
                label: l10n.payrollWorked,
              ),
            ),
            Expanded(
              child: _SummaryItem(
                value: earnings.shiftsCount.toString(),
                label: l10n.payrollShiftsCount,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(BuildContext context, int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    return context.l10n.statsHours(hours, minutes);
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.value,
    required this.label,
    this.valueColor,
  });

  final String value;
  final String label;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: context.appColors.secondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// «Из чего сложилось» (`earnings_drilldown/mobile.md`, «B», п.2): по
/// ставке (`gross_amount_minor`) → −штрафы → +доплаты → «Заработано»
/// (`net_amount_minor` — тот же термин, что и в [_EarnedCard] сверху,
/// цепочка замыкается на нём). Штрафы/доплаты (фичи fines +
/// `manual_time_entry`) — строками, только если они есть за период; ссылки
/// на «Мои штрафы» / «Мои начисления» — всегда, независимо от того, есть
/// ли что показывать (можно провалиться и увидеть пустой список).
class _BreakdownCard extends StatelessWidget {
  const _BreakdownCard({required this.earnings, required this.orgId});

  final MyEarnings earnings;
  final String orgId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final hasPenalties = earnings.penaltyAmountMinor > 0;
    final hasAdjustments = earnings.adjustmentsCount > 0;
    final adjustmentAmountMinor = earnings.adjustmentAmountMinor;
    final isAdjustmentCredit = adjustmentAmountMinor >= 0;
    final net = earnings.netAmountMinor;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _SummaryItem(
                    value: formatMoneyMinor(earnings.grossAmountMinor),
                    label: l10n.historyByRate,
                  ),
                ),
                Expanded(
                  child: _SummaryItem(
                    value: formatMoneyMinor(net),
                    label: l10n.historyEarned,
                    valueColor: net < 0 ? colors.error : null,
                  ),
                ),
              ],
            ),
            if (hasPenalties || hasAdjustments) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  if (hasPenalties)
                    Expanded(
                      child: _SummaryItem(
                        value:
                            '−${formatMoneyMinor(earnings.penaltyAmountMinor)}',
                        label:
                            '${l10n.finesAmount} · '
                            '${l10n.finesCount(earnings.penaltiesCount)}',
                        valueColor: colors.error,
                      ),
                    ),
                  if (hasAdjustments)
                    Expanded(
                      child: _SummaryItem(
                        value: isAdjustmentCredit
                            ? '+${formatMoneyMinor(adjustmentAmountMinor)}'
                            : formatMoneyMinor(adjustmentAmountMinor),
                        label: l10n.myEarningsAdjustments,
                        valueColor: isAdjustmentCredit
                            ? colors.success
                            : colors.error,
                      ),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                TextButton.icon(
                  onPressed: () =>
                      context.router.push(MyPenaltiesRoute(orgId: orgId)),
                  icon: const Icon(Icons.gavel_outlined, size: 18),
                  label: Text(l10n.finesMyTitle),
                ),
                TextButton.icon(
                  onPressed: () =>
                      context.router.push(MyAdjustmentsRoute(orgId: orgId)),
                  icon: const Icon(Icons.request_quote_outlined, size: 18),
                  label: Text(l10n.myAdjustmentsTitle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// «Сколько можно было заработать» (`earnings_drilldown/mobile.md`, «B»,
/// п.3): «По графику» (`planned_amount_minor`) + разница с фактом
/// (`delta_amount_minor`, знак уже в значении) + опоздания (`late_count`/
/// `late_seconds_total`) + согласованная переработка — с пояснением, что
/// она уже учтена в заработке. Формулировки мягкие («Меньше плана на
/// 1 200 ₽», не «Вы недоработали») — см. mobile.md п.4.
///
/// Опоздание уменьшает фактическое отработанное время, а значит и
/// заработок — поэтому показывается рядом с дельтой, а не отдельной
/// статистикой в другом месте.
///
/// Скрыт, если организация не использует графики и опозданий не было
/// ([MyEarnings.hasScheduleSignal] == `false`; план для смен без графика
/// равен факту, R8 backend.md) — карточка не добавляет информации,
/// показывать её незачем.
class _PotentialEarningsCard extends StatelessWidget {
  const _PotentialEarningsCard({required this.earnings});

  final MyEarnings earnings;

  @override
  Widget build(BuildContext context) {
    if (!earnings.hasScheduleSignal) {
      return const SizedBox.shrink();
    }

    final l10n = context.l10n;
    final colors = context.appColors;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _SummaryItem(
                    value: formatMoneyMinor(earnings.plannedAmountMinor),
                    label: l10n.myEarningsPlanned,
                  ),
                ),
                Expanded(
                  child: _SummaryItem(
                    value: _deltaLabel(context),
                    label: l10n.myEarningsDelta,
                  ),
                ),
              ],
            ),
            if (earnings.lateCount > 0) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _SummaryItem(
                      value: earnings.lateCount.toString(),
                      label: l10n.myEarningsLateCount,
                    ),
                  ),
                  Expanded(
                    child: _SummaryItem(
                      value: _formatDuration(
                        context,
                        earnings.lateSecondsTotal,
                      ),
                      label: l10n.myEarningsLateDuration,
                    ),
                  ),
                ],
              ),
            ],
            if (earnings.overtimeSeconds > 0) ...[
              const SizedBox(height: 8),
              Text(
                l10n.myEarningsApprovedOvertime(
                  _formatDuration(context, earnings.overtimeSeconds),
                ),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: colors.secondary),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _deltaLabel(BuildContext context) {
    final l10n = context.l10n;
    final delta = earnings.deltaAmountMinor;
    if (delta == 0) return l10n.myEarningsDeltaEven;
    final amount = formatMoneyMinor(delta.abs());
    return delta < 0
        ? l10n.myEarningsDeltaLess(amount)
        : l10n.myEarningsDeltaMore(amount);
  }

  String _formatDuration(BuildContext context, int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    return context.l10n.statsHours(hours, minutes);
  }
}

class _CurrentRateCard extends StatelessWidget {
  const _CurrentRateCard({
    required this.currentRate,
    required this.timeContext,
  });

  final CurrentRate? currentRate;
  final AppTimeContext timeContext;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final rate = currentRate;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.payrollCurrentRateTitle,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            if (rate == null)
              Text(
                l10n.myEarningsNoRate,
                style: textTheme.bodyMedium?.copyWith(color: colors.secondary),
              )
            else ...[
              Text(
                '${formatMoneyMinor(rate.rateAmountMinor)} '
                '${_rateTypeLabel(context, rate.rateType)}',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.payrollRateEffectiveFrom(
                  const AppTime().formatDate(rate.effectiveFrom, timeContext),
                ),
                style: textTheme.bodySmall?.copyWith(color: colors.secondary),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _rateTypeLabel(BuildContext context, RateType type) {
    final l10n = context.l10n;
    return type == RateType.hourly
        ? l10n.payrollRateHourly
        : l10n.payrollRatePerShift;
  }
}

class _MissingRateBanner extends StatelessWidget {
  const _MissingRateBanner();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
            Icon(Icons.warning_amber_outlined, color: colors.warning),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.payrollMissingRateBadge,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.myEarningsMissingRateHint,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
