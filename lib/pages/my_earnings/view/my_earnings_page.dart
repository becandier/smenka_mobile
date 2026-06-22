import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/l10n/applied_range_label.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/date_range_picker/_date_range_picker.dart';
import 'package:smenka_mobile/pages/my_earnings/cubit/my_earnings_cubit.dart';
import 'package:smenka_mobile/pages/my_earnings/cubit/my_earnings_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// «Мой заработок» — личный заработок сотрудника за период (org_member).
@RoutePage()
class MyEarningsPage extends StatelessWidget {
  const MyEarningsPage({@pathParam required this.orgId, super.key});

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyEarningsCubit(
        orgId: orgId,
        payrollRepository: context.read<PayrollRepository>(),
      ),
      child: const _MyEarningsView(),
    );
  }
}

class _MyEarningsView extends StatelessWidget {
  const _MyEarningsView();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<MyEarningsCubit>();
    final result = await context.router.push<DateRangePickerResult?>(
      DateRangePickerRoute(
        initialFrom: cubit.state.customFrom?.toLocal(),
        initialTo: cubit.state.customTo?.toLocal(),
      ),
    );
    if (result != null) {
      cubit.setCustomRange(result.fromUtc, result.toUtc);
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
                          _SummaryCard(earnings: earnings),
                          const SizedBox(height: 16),
                          _PenaltiesEarningsCard(
                            earnings: earnings,
                            orgId: context.read<MyEarningsCubit>().orgId,
                          ),
                          const SizedBox(height: 16),
                          _CurrentRateCard(currentRate: earnings.currentRate),
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

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.earnings});

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
                value: formatMoneyMinor(earnings.grossAmountMinor),
                label: l10n.payrollAccrued,
              ),
            ),
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
  const _SummaryItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
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

/// Блок штрафов на «Мой заработок» (фича fines): штрафы за период, «К выплате»
/// (net = начислено − штрафы; может быть отрицательным) и переход на список
/// «Мои штрафы». Для self штрафы учитываются всегда (флага нет).
class _PenaltiesEarningsCard extends StatelessWidget {
  const _PenaltiesEarningsCard({required this.earnings, required this.orgId});

  final MyEarnings earnings;
  final String orgId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final hasPenalties = earnings.penaltyAmountMinor > 0;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasPenalties) ...[
              Row(
                children: [
                  Expanded(
                    child: _SummaryItem(
                      value:
                          '−${formatMoneyMinor(earnings.penaltyAmountMinor)}',
                      label:
                          '${l10n.finesAmount} · '
                          '${l10n.finesCount(earnings.penaltiesCount)}',
                    ),
                  ),
                  Expanded(
                    child: _SummaryItem(
                      value: formatMoneyMinor(earnings.netAmountMinor),
                      label: l10n.finesToPay,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () =>
                    context.router.push(MyPenaltiesRoute(orgId: orgId)),
                icon: const Icon(Icons.gavel_outlined, size: 18),
                label: Text(l10n.finesMyTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentRateCard extends StatelessWidget {
  const _CurrentRateCard({required this.currentRate});

  final CurrentRate? currentRate;

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
                  DateFormat('dd.MM.yyyy').format(rate.effectiveFrom.toLocal()),
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
