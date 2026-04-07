import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
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
          // Period selector
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: BlocSelector<OrgStatsCubit, OrgStatsState, String>(
              selector: (state) => state.period,
              builder: (context, selectedPeriod) {
                return SegmentedButton<String>(
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
                  selected: {selectedPeriod},
                  onSelectionChanged: (selection) {
                    context.read<OrgStatsCubit>().setPeriod(selection.first);
                  },
                  showSelectedIcon: false,
                  style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textStyle: WidgetStatePropertyAll(
                      textTheme.labelMedium,
                    ),
                  ),
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
