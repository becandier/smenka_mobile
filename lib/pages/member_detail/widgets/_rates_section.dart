part of '../view/member_detail_page.dart';

/// Секция «Ставка» (фича payroll): текущая ставка + история.
/// Видна admin/owner; мутации (добавить/исправить/удалить) — только admin.
class _RatesSection extends StatelessWidget {
  const _RatesSection();

  Future<void> _openRateForm(BuildContext context, Rate? initialRate) async {
    final ratesCubit = context.read<MemberRatesCubit>();
    final changed = await context.router.push<bool?>(
      RateFormRoute(
        orgId: ratesCubit.orgId,
        memberId: ratesCubit.memberId,
        initialRate: initialRate,
      ),
    );
    if (changed ?? false) {
      await ratesCubit.loadRates();
    }
  }

  Future<void> _confirmDelete(BuildContext context, Rate rate) async {
    final l10n = context.l10n;
    final cubit = context.read<MemberRatesCubit>();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.payrollDeleteRate),
        content: Text(l10n.payrollDeleteRateConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed ?? false) {
      await cubit.deleteRate(rate.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    // Мутации ставок — только org_admin; owner видит секцию read-only.
    final isAdmin = context.select<MemberDetailCubit, bool>(
      (cubit) => cubit.state.viewerRole == OrgMembershipRole.admin,
    );

    return BlocListener<MemberRatesCubit, MemberRatesState>(
      listenWhen: (prev, curr) =>
          prev.actionStatus != curr.actionStatus &&
          curr.actionStatus == FeatureStatus.error,
      listener: (context, state) {
        context.modals.showError(
          localizedErrorMessage(
            context,
            code: state.actionErrorCode,
            fallback: state.actionError,
          ),
        );
      },
      child: Material(
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
                    child: Text(
                      l10n.payrollRateSectionTitle,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (isAdmin)
                    TextButton.icon(
                      onPressed: () => _openRateForm(context, null),
                      icon: const Icon(Icons.add, size: 18),
                      label: Text(l10n.payrollAddRate),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              SectionDataWrapper<MemberRatesCubit, MemberRatesState,
                  List<Rate>>(
                selector: (state) => state.rates,
                onRetry: () => context.read<MemberRatesCubit>().loadRates(),
                contentBuilder: (rates) {
                  if (rates.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        l10n.payrollRatesEmpty,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    );
                  }

                  final currentId =
                      context.read<MemberRatesCubit>().state.currentRate?.id;

                  return Column(
                    children: [
                      for (final rate in rates)
                        _RateRow(
                          rate: rate,
                          isCurrent: rate.id == currentId,
                          isAdmin: isAdmin,
                          onTap: isAdmin
                              ? () => _openRateForm(context, rate)
                              : null,
                          onDelete: isAdmin
                              ? () => _confirmDelete(context, rate)
                              : null,
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RateRow extends StatelessWidget {
  const _RateRow({
    required this.rate,
    required this.isCurrent,
    required this.isAdmin,
    this.onTap,
    this.onDelete,
  });

  final Rate rate;
  final bool isCurrent;
  final bool isAdmin;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final note = rate.note;

    final typeLabel = rate.rateType == RateType.hourly
        ? l10n.payrollRateHourly
        : l10n.payrollRatePerShift;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${formatMoneyMinor(rate.rateAmountMinor)} '
                          '$typeLabel',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (isCurrent) ...[
                          const SizedBox(width: 8),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: colors.success.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                right: 6,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Text(
                                l10n.payrollRateCurrent,
                                style: textTheme.labelSmall?.copyWith(
                                  color: colors.success,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.payrollRateEffectiveFrom(
                        DateFormat('dd.MM.yyyy').format(
                          rate.effectiveFrom.toLocal(),
                        ),
                      ),
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                    if (note != null && note.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        note,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isAdmin)
                IconButton(
                  tooltip: l10n.payrollDeleteRate,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: colors.error,
                  ),
                  onPressed: onDelete,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
