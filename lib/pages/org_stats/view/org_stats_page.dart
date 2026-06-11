import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/applied_range_label.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/date_range_picker/_date_range_picker.dart';
import 'package:smenka_mobile/pages/org_stats/cubit/org_stats_cubit.dart';
import 'package:smenka_mobile/pages/org_stats/cubit/org_stats_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_stats_cards.dart';
part '../widgets/_stats_chart.dart';
part '../widgets/_stats_table.dart';

@RoutePage()
class OrgStatsPage extends StatelessWidget {
  const OrgStatsPage({
    @pathParam required this.orgId,
    super.key,
  });

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrgStatsCubit(
        orgId: orgId,
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: const _OrgStatsView(),
    );
  }
}

class _OrgStatsView extends StatelessWidget {
  const _OrgStatsView();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<OrgStatsCubit>();
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.orgStatsTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Источник окна: пресет ЛИБО произвольный диапазон
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: BlocBuilder<OrgStatsCubit, OrgStatsState>(
              buildWhen: (prev, curr) =>
                  prev.period != curr.period ||
                  prev.customFrom != curr.customFrom ||
                  prev.customTo != curr.customTo,
              builder: (context, state) {
                final selectedPeriod = state.period;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SegmentedButton<String>(
                      segments: [
                        ButtonSegment(
                          value: 'day',
                          label: Text(l10n.statsPeriodDay),
                        ),
                        ButtonSegment(
                          value: 'week',
                          label: Text(l10n.statsPeriodWeek),
                        ),
                        ButtonSegment(
                          value: 'month',
                          label: Text(l10n.statsPeriodMonth),
                        ),
                      ],
                      selected: selectedPeriod == null
                          ? const <String>{}
                          : {selectedPeriod},
                      emptySelectionAllowed: true,
                      onSelectionChanged: (selection) {
                        final period = selection.firstOrNull;
                        if (period == null) return;
                        context.read<OrgStatsCubit>().setPeriod(period);
                      },
                      showSelectedIcon: false,
                      style: ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        textStyle: WidgetStatePropertyAll(
                          textTheme.labelMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: DateRangeFilterChip(
                        from: state.customFrom,
                        to: state.customTo,
                        label: l10n.statsModeCustom,
                        onTap: () => _openDateRangePicker(context),
                        onClear: () => context
                            .read<OrgStatsCubit>()
                            .setCustomRange(null, null),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Content
          Expanded(
            child: SectionDataWrapper<OrgStatsCubit, OrgStatsState, OrgStats>(
              selector: (state) => state.stats,
              onRetry: () => context.read<OrgStatsCubit>().loadStats(),
              contentBuilder: (stats) {
                return RefreshIndicator.adaptive(
                  onRefresh: () => context.read<OrgStatsCubit>().loadStats(),
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 32),
                    children: [
                      if (appliedRangeLabel(
                        context,
                        stats.rangeFrom,
                        stats.rangeTo,
                      )
                          case final rangeLabel?)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 8,
                          ),
                          child: Text(
                            rangeLabel,
                            style: textTheme.bodySmall?.copyWith(
                              color: context.appColors.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      _StatsCards(stats: stats),
                      if (stats.perEmployee.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        _StatsChart(employees: stats.perEmployee),
                        const SizedBox(height: 24),
                        _StatsTable(employees: stats.perEmployee),
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
