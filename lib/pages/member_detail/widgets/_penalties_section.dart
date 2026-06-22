part of '../view/member_detail_page.dart';

/// Секция «Штрафы» (фича fines) на деталях участника. Видна admin/owner;
/// для штрафов оба могут писать — это первое пишущее действие мобильного
/// admin над сотрудником (исключение из read-only, одобрено заказчиком).
class _PenaltiesSection extends StatefulWidget {
  const _PenaltiesSection();

  @override
  State<_PenaltiesSection> createState() => _PenaltiesSectionState();
}

class _PenaltiesSectionState extends State<_PenaltiesSection> {
  @override
  void initState() {
    super.initState();
    // Секция рендерится только при canManage — грузим список отсюда.
    final cubit = context.read<MemberPenaltiesCubit>();
    if (cubit.state.penalties.status == FeatureStatus.initial) {
      cubit.loadPenalties();
    }
  }

  Future<void> _openForm({Penalty? penalty}) async {
    final penaltiesCubit = context.read<MemberPenaltiesCubit>();
    final member = context.read<MemberDetailCubit>().state.member;

    final created = await context.router.push<bool>(
      PenaltyFormRoute(
        orgId: penaltiesCubit.orgId,
        memberId: member.id,
        userId: member.userId,
        userName: member.userName,
        penalty: penalty,
      ),
    );
    if (created ?? false) {
      await penaltiesCubit.loadPenalties();
    }
  }

  Future<void> _confirmRemove(Penalty penalty) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.finesRemove),
        content: Text(l10n.finesRemoveConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.finesRemove),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    final error = await context.read<MemberPenaltiesCubit>().removePenalty(
      penalty.id,
    );
    if (error != null && mounted) {
      context.modals.showError(
        localizedErrorMessage(
          context,
          code: error.code,
          fallback: error.message,
        ),
      );
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.finesMemberSectionTitle,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _openForm,
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(l10n.finesAssign),
                ),
              ],
            ),
            const SizedBox(height: 4),
            BlocBuilder<MemberPenaltiesCubit, MemberPenaltiesState>(
              builder: (context, state) {
                final section = state.penalties;

                if (section.isLoading && section.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  );
                }

                if (section.hasError && section.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizedErrorMessage(
                            context,
                            code: section.errorCode,
                            fallback: section.error,
                          ),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.secondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        AppButton(
                          label: l10n.retry,
                          isOutlined: true,
                          onPressed: context
                              .read<MemberPenaltiesCubit>()
                              .loadPenalties,
                        ),
                      ],
                    ),
                  );
                }

                if (section.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      l10n.finesMemberEmpty,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    for (final penalty in section.data)
                      _PenaltyRow(
                        penalty: penalty,
                        onEdit: () => _openForm(penalty: penalty),
                        onRemove: () => _confirmRemove(penalty),
                      ),
                    if (section.hasMore) ...[
                      const SizedBox(height: 8),
                      AppButton(
                        label: l10n.showMore,
                        isOutlined: true,
                        onPressed: () =>
                            context.read<MemberPenaltiesCubit>().loadMore(),
                      ),
                    ],
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

class _PenaltyRow extends StatelessWidget {
  const _PenaltyRow({
    required this.penalty,
    required this.onEdit,
    required this.onRemove,
  });

  final Penalty penalty;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final comment = penalty.comment;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onEdit,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    penalty.reason,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        DateFormat(
                          'dd.MM.yyyy HH:mm',
                        ).format(penalty.occurredAt.toLocal()),
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.secondary,
                        ),
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
                    const SizedBox(height: 2),
                    Text(
                      comment,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  ],
                ],
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
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, size: 20, color: colors.secondary),
              onSelected: (value) {
                if (value == 'edit') onEdit();
                if (value == 'remove') onRemove();
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'edit', child: Text(l10n.finesEdit)),
                PopupMenuItem(value: 'remove', child: Text(l10n.finesRemove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
