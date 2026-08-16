import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/core/utils/shift_lookup.dart';
import 'package:smenka_mobile/data/domain/adjustment/_adjustment.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/date_range_picker/_date_range_picker.dart';
import 'package:smenka_mobile/pages/my_adjustments/cubit/my_adjustments_cubit.dart';
import 'package:smenka_mobile/pages/my_adjustments/cubit/my_adjustments_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// «Мои начисления» — свои ручные начисления/удержания за период
/// (org_member, только чтение; `manual_time_entry`). Верстка — по образцу
/// `MyPenaltiesPage`.
@RoutePage()
class MyAdjustmentsPage extends StatelessWidget {
  const MyAdjustmentsPage({@pathParam required this.orgId, super.key});

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyAdjustmentsCubit(
        orgId: orgId,
        adjustmentRepository: context.read<AdjustmentRepository>(),
      ),
      child: const _MyAdjustmentsView(),
    );
  }
}

class _MyAdjustmentsView extends StatelessWidget {
  const _MyAdjustmentsView();

  Future<void> _openDateRangePicker(BuildContext context) async {
    final cubit = context.read<MyAdjustmentsCubit>();
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
      appBar: AppBar(title: Text(l10n.myAdjustmentsTitle), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: BlocBuilder<MyAdjustmentsCubit, MyAdjustmentsState>(
              buildWhen: (prev, curr) =>
                  prev.preset != curr.preset ||
                  prev.customFrom != curr.customFrom ||
                  prev.customTo != curr.customTo,
              builder: (context, state) {
                final cubit = context.read<MyAdjustmentsCubit>();
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
                  MyAdjustmentsCubit,
                  MyAdjustmentsState,
                  MyAdjustment
                >(
                  selector: (state) => state.adjustments,
                  onLoadMore: () =>
                      context.read<MyAdjustmentsCubit>().loadMore(),
                  onRefresh: () =>
                      context.read<MyAdjustmentsCubit>().loadAdjustments(),
                  emptyBuilder: () => AppEmptyState(
                    icon: Icons.request_quote_outlined,
                    title: l10n.myAdjustmentsEmpty,
                  ),
                  itemBuilder: (context, adjustment, index) =>
                      _MyAdjustmentTile(adjustment: adjustment),
                ),
          ),
        ],
      ),
    );
  }
}

class _MyAdjustmentTile extends StatelessWidget {
  const _MyAdjustmentTile({required this.adjustment});

  final MyAdjustment adjustment;

  /// Смена не хранит собственный `started_at` в модели начисления — ищем по
  /// `occurred_at` (по умолчанию бэк выставляет его равным `started_at`
  /// привязанной смены, backend.md B1). Если админ переопределил дату или
  /// смену затем удалили — смена не найдётся, показываем ошибку.
  Future<void> _openShift(BuildContext context, String shiftId) async {
    final shift = await findShiftByExactStart(
      context.read<ShiftRepository>(),
      shiftId: shiftId,
      startedAt: adjustment.occurredAt,
    );
    if (!context.mounted) return;
    if (shift == null) {
      context.modals.showError(context.l10n.notificationShiftUnavailable);
      return;
    }
    unawaited(context.router.root.push(ShiftDetailRoute(shift: shift)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final comment = adjustment.comment;
    final shiftId = adjustment.shiftId;
    final isCredit = adjustment.amountMinor > 0;
    final signedAmount = isCredit
        ? '+${formatMoneyMinor(adjustment.amountMinor)}'
        : formatMoneyMinor(adjustment.amountMinor);

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: shiftId != null ? () => _openShift(context, shiftId) : null,
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
                      adjustment.reason,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    signedAmount,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isCredit ? colors.success : colors.error,
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
                    ).format(adjustment.occurredAt.toLocal()),
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.secondary,
                    ),
                  ),
                  if (adjustment.shiftId != null) ...[
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
      ),
    );
  }
}
