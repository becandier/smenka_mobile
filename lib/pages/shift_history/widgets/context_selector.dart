part of '../view/shift_history_page.dart';

/// Заголовок AppBar таба «История смен» (`shift_history_ui_polish`):
/// вместо отдельной строки-селектора над карточкой статистики —
/// кликабельный заголовок с текущим контекстом. Тап открывает тот же
/// список вариантов, что и раньше: каждая доступная организация
/// (`myRole != owner`) по названию → «Персональные» → «Все смены»
/// (`shift_history_scope`, «Селектор контекста»).
///
/// Нет доступных организаций — заголовок остаётся обычным неинтерактивным
/// текстом «История смен»: `scope` на бэк не уходит вовсе, экран работает
/// как персональный трекер, как и до этой доработки.
class _ContextTitle extends StatelessWidget {
  const _ContextTitle();

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
        final l10n = context.l10n;

        if (!state.hasOrganizations) {
          return Text(l10n.historyTitle, overflow: TextOverflow.ellipsis);
        }

        final cubit = context.read<ShiftHistoryContextCubit>();

        return PopupMenuButton<String>(
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  _currentLabel(context, state),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        );
      },
    );
  }
}
