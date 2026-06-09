part of '../view/org_shift_detail_page.dart';

/// Блок чек-листов на детали чужой смены. Грузится ОТДЕЛЬНЫМ запросом
/// `GET /shifts/{shift_id}/checklists` (переиспользуем [ShiftChecklistsCubit]).
/// Тап по экземпляру → деталь чек-листа в режиме только чтение
/// (`ChecklistFillRoute(readOnly: true)`).
class _OrgShiftDetailChecklists extends StatelessWidget {
  const _OrgShiftDetailChecklists({required this.orgId, required this.shiftId});

  final String orgId;
  final String shiftId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShiftChecklistsCubit(
        shiftId: shiftId,
        checklistRepository: context.read<ChecklistRepository>(),
      ),
      child: const _OrgShiftChecklistsBody(),
    );
  }
}

class _OrgShiftChecklistsBody extends StatelessWidget {
  const _OrgShiftChecklistsBody();

  Future<void> _open(BuildContext context, ChecklistInstance instance) async {
    final cubit = context.read<ShiftChecklistsCubit>();
    await context.router.push(
      ChecklistFillRoute(
        shiftId: cubit.shiftId,
        instanceId: instance.id,
        readOnly: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.shiftChecklistsSection,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        BlocBuilder<ShiftChecklistsCubit, ShiftChecklistsState>(
          builder: (context, state) {
            final section = state.instances;

            if (section.isLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator.adaptive()),
              );
            }

            if (section.error case final message?) {
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      message,
                      style: textTheme.bodySmall?.copyWith(color: colors.error),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        context.read<ShiftChecklistsCubit>().loadChecklists(),
                    child: Text(l10n.retry),
                  ),
                ],
              );
            }

            final items = section.data ?? const <ChecklistInstance>[];
            if (items.isEmpty) {
              return Text(
                l10n.shiftChecklistsEmpty,
                style: textTheme.bodyMedium?.copyWith(color: colors.secondary),
              );
            }

            final start =
                items.where((i) => i.type == ChecklistType.shiftStart).toList();
            final end =
                items.where((i) => i.type == ChecklistType.shiftEnd).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (start.isNotEmpty) ...[
                  _GroupHeader(text: l10n.shiftChecklistsStartGroup),
                  ...start.map(
                    (i) => ChecklistInstanceTile(
                      instance: i,
                      onTap: () => _open(context, i),
                    ),
                  ),
                  if (end.isNotEmpty) const SizedBox(height: 12),
                ],
                if (end.isNotEmpty) ...[
                  _GroupHeader(text: l10n.shiftChecklistsEndGroup),
                  ...end.map(
                    (i) => ChecklistInstanceTile(
                      instance: i,
                      onTap: () => _open(context, i),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.appColors.secondary,
            ),
      ),
    );
  }
}
