import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/l10n/applied_range_label.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/date_range_picker/_date_range_picker.dart';
import 'package:smenka_mobile/pages/payroll/cubit/payroll_cubit.dart';
import 'package:smenka_mobile/pages/payroll/cubit/payroll_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// «Зарплата» — отчёт «кому сколько заплатить» за период (admin/owner).
@RoutePage()
class PayrollPage extends StatelessWidget {
  const PayrollPage({@pathParam required this.orgId, super.key});

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PayrollCubit(
        orgId: orgId,
        payrollRepository: context.read<PayrollRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: const _PayrollView(),
    );
  }
}

class _PayrollView extends StatelessWidget {
  const _PayrollView();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<PayrollCubit>();
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
      appBar: AppBar(title: Text(l10n.payrollReportTitle), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: BlocBuilder<PayrollCubit, PayrollState>(
              buildWhen: (prev, curr) =>
                  prev.preset != curr.preset ||
                  prev.customFrom != curr.customFrom ||
                  prev.customTo != curr.customTo,
              builder: (context, state) {
                final cubit = context.read<PayrollCubit>();
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
          const _IncludePenaltiesToggle(),
          const SizedBox(height: 4),
          Expanded(
            child: SectionDataWrapper<PayrollCubit, PayrollState, Payroll>(
              selector: (state) => state.payroll,
              onRetry: () => context.read<PayrollCubit>().load(),
              contentBuilder: (payroll) {
                return RefreshIndicator.adaptive(
                  onRefresh: () => context.read<PayrollCubit>().load(),
                  child: payroll.items.isEmpty
                      ? ListView(
                          children: [
                            const SizedBox(height: 48),
                            AppEmptyState(
                              icon: Icons.payments_outlined,
                              title: l10n.payrollEmptyNoShifts,
                            ),
                          ],
                        )
                      : ListView(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 32,
                          ),
                          children: [
                            if (appliedRangeLabel(
                                  context,
                                  payroll.period.dateFrom,
                                  payroll.period.dateTo,
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
                            _TotalsCard(totals: payroll.totals),
                            const SizedBox(height: 16),
                            ...payroll.items.map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: _PayrollItemTile(item: item),
                              ),
                            ),
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

/// Тумблер «Учитывать штрафы» (фича fines) → query `include_penalties`.
class _IncludePenaltiesToggle extends StatelessWidget {
  const _IncludePenaltiesToggle();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PayrollCubit, PayrollState, bool>(
      selector: (state) => state.includePenalties,
      builder: (context, includePenalties) {
        return SwitchListTile.adaptive(
          value: includePenalties,
          onChanged: (value) =>
              context.read<PayrollCubit>().setIncludePenalties(value: value),
          title: Text(context.l10n.payrollIncludePenalties),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          dense: true,
        );
      },
    );
  }
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard({required this.totals});

  final PayrollTotals totals;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _TotalsItem(
                    value: formatMoneyMinor(totals.grossAmountMinor),
                    label: l10n.payrollAccrued,
                  ),
                ),
                Expanded(
                  child: _TotalsItem(
                    value: _formatWorkedDuration(context, totals.workedSeconds),
                    label: l10n.payrollWorked,
                  ),
                ),
                Expanded(
                  child: _TotalsItem(
                    value: totals.shiftsCount.toString(),
                    label: l10n.payrollShiftsCount,
                  ),
                ),
              ],
            ),
            if (totals.penaltyAmountMinor > 0) ...[
              const Divider(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _TotalsItem(
                      value: '−${formatMoneyMinor(totals.penaltyAmountMinor)}',
                      label:
                          '${l10n.finesAmount} · '
                          '${l10n.finesCount(totals.penaltiesCount)}',
                    ),
                  ),
                  Expanded(
                    child: _TotalsItem(
                      value: formatMoneyMinor(totals.netAmountMinor),
                      label: l10n.finesToPay,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TotalsItem extends StatelessWidget {
  const _TotalsItem({required this.value, required this.label});

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

class _PayrollItemTile extends StatelessWidget {
  const _PayrollItemTile({required this.item});

  final PayrollItem item;

  void _openMemberDetail(BuildContext context) {
    final cubit = context.read<PayrollCubit>();
    final member = cubit.state.membersByUserId[item.userId];
    if (member == null) {
      // Участники ещё не загрузились (или сотрудник исключён):
      // сообщаем и повторяем загрузку для следующего тапа.
      context.modals.showInfo(context.l10n.errorMemberNotFound);
      cubit.loadMembers();
      return;
    }
    context.router.push(MemberDetailRoute(orgId: cubit.orgId, member: member));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _openMemberDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.userName,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatMoneyMinor(item.netAmountMinor),
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: item.netAmountMinor < 0 ? colors.error : null,
                        ),
                      ),
                      Text(
                        l10n.payrollToPay,
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${_formatWorkedDuration(context, item.workedSeconds)} · '
                '${l10n.payrollShiftsCount}: ${item.shiftsCount}',
                style: textTheme.bodySmall?.copyWith(color: colors.secondary),
              ),
              if (item.penaltyAmountMinor > 0) ...[
                const SizedBox(height: 2),
                Text(
                  '${l10n.payrollAccrued}: '
                  '${formatMoneyMinor(item.grossAmountMinor)} · '
                  '${l10n.finesAmount}: '
                  '−${formatMoneyMinor(item.penaltyAmountMinor)}',
                  style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                ),
              ],
              if (item.hasMissingRate) ...[
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      size: 16,
                      color: colors.warning,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        l10n.payrollUnpaidHint(
                          item.unpaidShiftsCount,
                          _formatWorkedDuration(context, item.unpaidSeconds),
                        ),
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.warning,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// `worked_seconds` → «N ч M мин» (единый формат со статистикой).
String _formatWorkedDuration(BuildContext context, int totalSeconds) {
  final hours = totalSeconds ~/ 3600;
  final minutes = (totalSeconds % 3600) ~/ 60;
  return context.l10n.statsHours(hours, minutes);
}
