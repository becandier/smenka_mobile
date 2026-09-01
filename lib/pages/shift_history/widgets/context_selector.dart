part of '../view/shift_history_page.dart';

/// Селектор контекста истории смен (`shift_history_scope`): каждая
/// доступная организация (`myRole != owner`) по названию → «Персональные» →
/// «Все смены», в этом порядке (mobile.md, «Селектор контекста»). Выбран
/// всегда ровно один пункт, подпись видна без раскрытия списка.
///
/// Скрыт целиком, если доступных организаций нет — тогда `scope` на бэк не
/// уходит вовсе, экран работает как персональный трекер до этой фичи.
class _ContextSelector extends StatelessWidget {
  const _ContextSelector();

  String _currentLabel(BuildContext context, ShiftHistoryContextState state) {
    final l10n = context.l10n;
    return switch (state.scope) {
      ShiftScope.organization =>
        state.selectedOrganization?.name ?? l10n.historyContextAll,
      ShiftScope.personal => l10n.historyContextPersonal,
      ShiftScope.all || null => l10n.historyContextAll,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftHistoryContextCubit, ShiftHistoryContextState>(
      buildWhen: (prev, curr) =>
          prev.hasOrganizations != curr.hasOrganizations ||
          prev.scope != curr.scope ||
          prev.organizationId != curr.organizationId,
      builder: (context, state) {
        if (!state.hasOrganizations) return const SizedBox.shrink();

        final l10n = context.l10n;
        final colors = context.appColors;
        final textTheme = Theme.of(context).textTheme;
        final cubit = context.read<ShiftHistoryContextCubit>();

        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: PopupMenuButton<String>(
              tooltip: l10n.historyContextLabel,
              onSelected: (value) {
                if (value == ShiftScope.personal.value) {
                  cubit.selectPersonal();
                } else if (value == ShiftScope.all.value) {
                  cubit.selectAll();
                } else {
                  cubit.selectOrganization(value);
                }
              },
              itemBuilder: (context) => [
                for (final org in state.availableOrganizations)
                  PopupMenuItem(value: org.id, child: Text(org.name)),
                PopupMenuItem(
                  value: ShiftScope.personal.value,
                  child: Text(l10n.historyContextPersonal),
                ),
                PopupMenuItem(
                  value: ShiftScope.all.value,
                  child: Text(l10n.historyContextAll),
                ),
              ],
              child: Material(
                color: colors.surface,
                shape: StadiumBorder(side: BorderSide(color: colors.line)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.filter_list,
                        size: 18,
                        color: colors.secondary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _currentLabel(context, state),
                        style: textTheme.labelLarge,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                        color: colors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
