part of '../view/member_detail_page.dart';

/// Секция «Ставка» (фича payroll, read-only): текущая ставка + история.
/// Видна admin/owner. Управление ставками — в веб-админке.
class _RatesSection extends StatefulWidget {
  const _RatesSection();

  @override
  State<_RatesSection> createState() => _RatesSectionState();
}

class _RatesSectionState extends State<_RatesSection> {
  @override
  void initState() {
    super.initState();
    // Секция рендерится только при canManage — историю грузим отсюда,
    // а не из конструктора кубита (см. комментарий в MemberRatesCubit).
    final cubit = context.read<MemberRatesCubit>();
    if (cubit.state.rates.status == FeatureStatus.initial) {
      cubit.loadRates();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.payrollRateSectionTitle,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            SectionDataWrapper<MemberRatesCubit, MemberRatesState, List<Rate>>(
              selector: (state) => state.rates,
              onRetry: () => context.read<MemberRatesCubit>().loadRates(),
              contentBuilder: (rates) {
                final current = context
                    .read<MemberRatesCubit>()
                    .state
                    .currentRate;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CurrentRateBlock(current: current),
                    const SizedBox(height: 12),
                    if (rates.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          l10n.payrollRatesEmpty,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.secondary,
                          ),
                        ),
                      )
                    else
                      for (final rate in rates)
                        _RateRow(rate: rate, isCurrent: rate.id == current?.id),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Блок «Текущая ставка»: действующая на «сейчас» запись истории
/// либо «Ставка не задана» (в т.ч. когда все ставки начинаются в будущем).
class _CurrentRateBlock extends StatelessWidget {
  const _CurrentRateBlock({required this.current});

  final Rate? current;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final rate = current;

    String? rateLabel;
    if (rate != null) {
      final type = rate.rateType == RateType.hourly
          ? l10n.payrollRateHourly
          : l10n.payrollRatePerShift;
      final since = l10n.payrollRateEffectiveFrom(
        DateFormat('dd.MM.yyyy').format(rate.effectiveFrom.toLocal()),
      );
      rateLabel = '${formatMoneyMinor(rate.rateAmountMinor)} $type · $since';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.payrollCurrentRateTitle,
          style: textTheme.bodySmall?.copyWith(color: colors.secondary),
        ),
        const SizedBox(height: 4),
        if (rateLabel == null)
          Text(
            l10n.payrollRateNotSet,
            style: textTheme.bodyMedium?.copyWith(color: colors.secondary),
          )
        else
          Text(
            rateLabel,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}

class _RateRow extends StatelessWidget {
  const _RateRow({required this.rate, required this.isCurrent});

  final Rate rate;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final note = rate.note;

    final typeLabel = rate.rateType == RateType.hourly
        ? l10n.payrollRateHourly
        : l10n.payrollRatePerShift;

    return Padding(
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
                    DateFormat(
                      'dd.MM.yyyy',
                    ).format(rate.effectiveFrom.toLocal()),
                  ),
                  style: textTheme.bodySmall?.copyWith(color: colors.secondary),
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
        ],
      ),
    );
  }
}
