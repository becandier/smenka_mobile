import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_state.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/stats_section.dart';
part '../widgets/shift_filters.dart';
part '../widgets/shift_card.dart';

@RoutePage()
class ShiftHistoryPage extends StatelessWidget {
  const ShiftHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ShiftHistoryCubit(
            shiftRepository: context.read<ShiftRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) => ShiftStatsCubit(
            shiftRepository: context.read<ShiftRepository>(),
          ),
        ),
      ],
      child: const _ShiftHistoryView(),
    );
  }
}

class _ShiftHistoryView extends StatelessWidget {
  const _ShiftHistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.historyTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const _StatsSection(),
          const _ShiftFilters(),
          Expanded(
            child: PaginatedSectionDataList<ShiftHistoryCubit,
                ShiftHistoryState, Shift>(
              selector: (state) => state.shifts,
              itemBuilder: (context, shift, index) => _ShiftCard(
                shift: shift,
                onTap: () =>
                    context.router.push(ShiftDetailRoute(shift: shift)),
              ),
              onLoadMore: () => context
                  .read<ShiftHistoryCubit>()
                  .loadShifts(isRefresh: false),
              onRefresh: () => context.read<ShiftHistoryCubit>().loadShifts(),
              emptyBuilder: () => AppEmptyState(
                icon: Icons.history_outlined,
                title: context.l10n.historyEmpty,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
