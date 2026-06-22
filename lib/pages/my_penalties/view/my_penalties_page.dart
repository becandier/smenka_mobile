import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/date_range_picker/_date_range_picker.dart';
import 'package:smenka_mobile/pages/my_penalties/cubit/my_penalties_cubit.dart';
import 'package:smenka_mobile/pages/my_penalties/cubit/my_penalties_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// «Мои штрафы» — свои штрафы за период (org_member, только чтение).
@RoutePage()
class MyPenaltiesPage extends StatelessWidget {
  const MyPenaltiesPage({@pathParam required this.orgId, super.key});

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyPenaltiesCubit(
        orgId: orgId,
        penaltyRepository: context.read<PenaltyRepository>(),
      ),
      child: const _MyPenaltiesView(),
    );
  }
}

class _MyPenaltiesView extends StatelessWidget {
  const _MyPenaltiesView();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<MyPenaltiesCubit>();
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
      appBar: AppBar(title: Text(l10n.finesMyTitle), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: BlocBuilder<MyPenaltiesCubit, MyPenaltiesState>(
              buildWhen: (prev, curr) =>
                  prev.preset != curr.preset ||
                  prev.customFrom != curr.customFrom ||
                  prev.customTo != curr.customTo,
              builder: (context, state) {
                final cubit = context.read<MyPenaltiesCubit>();
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
                PaginatedSectionDataList<
                  MyPenaltiesCubit,
                  MyPenaltiesState,
                  MyPenalty
                >(
                  selector: (state) => state.penalties,
                  onLoadMore: () => context.read<MyPenaltiesCubit>().loadMore(),
                  onRefresh: () =>
                      context.read<MyPenaltiesCubit>().loadPenalties(),
                  emptyBuilder: () => AppEmptyState(
                    icon: Icons.gavel_outlined,
                    title: l10n.finesMyEmpty,
                  ),
                  itemBuilder: (context, penalty, index) =>
                      _MyPenaltyTile(penalty: penalty),
                ),
          ),
        ],
      ),
    );
  }
}

class _MyPenaltyTile extends StatelessWidget {
  const _MyPenaltyTile({required this.penalty});

  final MyPenalty penalty;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final comment = penalty.comment;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    penalty.reason,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '−${formatMoneyMinor(penalty.amountMinor)}',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.error,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  DateFormat(
                    'dd.MM.yyyy HH:mm',
                  ).format(penalty.occurredAt.toLocal()),
                  style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                ),
                if (penalty.shiftId != null) ...[
                  const SizedBox(width: 8),
                  Icon(Icons.link, size: 14, color: colors.secondary),
                  const SizedBox(width: 2),
                  Text(
                    l10n.finesAttachedToShift,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.secondary,
                    ),
                  ),
                ],
              ],
            ),
            if (comment != null && comment.isNotEmpty) ...[
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
