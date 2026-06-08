part of '../view/member_detail_page.dart';

class _EffectiveSection extends StatelessWidget {
  const _EffectiveSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MemberDetailCubit, MemberDetailState>(
      buildWhen: (p, c) =>
          p.effective.data != c.effective.data ||
          p.effective.isLoading != c.effective.isLoading,
      builder: (context, state) {
        final items =
            state.effective.data ?? const <EffectiveChecklistTemplate>[];
        final start = items
            .where((t) => t.type == ChecklistType.shiftStart)
            .toList();
        final end = items
            .where((t) => t.type == ChecklistType.shiftEnd)
            .toList();

        return Material(
          color: appColors.surface,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.memberDetailEffectiveSection,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.memberDetailEffectiveHint,
                  style: textTheme.bodySmall?.copyWith(
                    color: appColors.secondary,
                  ),
                ),
                const SizedBox(height: 12),
                if (state.effective.isLoading && items.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  )
                else if (items.isEmpty)
                  Text(
                    l10n.memberDetailEffectiveEmpty,
                    style: TextStyle(color: appColors.secondary),
                  )
                else ...[
                  if (start.isNotEmpty) ...[
                    _GroupHeader(
                      text: l10n.checklistTemplatesShiftStart,
                    ),
                    ...start.map((t) => _EffectiveRow(template: t)),
                  ],
                  if (start.isNotEmpty && end.isNotEmpty)
                    const SizedBox(height: 8),
                  if (end.isNotEmpty) ...[
                    _GroupHeader(text: l10n.checklistTemplatesShiftEnd),
                    ...end.map((t) => _EffectiveRow(template: t)),
                  ],
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: context.appColors.secondary,
            ),
      ),
    );
  }
}

class _EffectiveRow extends StatelessWidget {
  const _EffectiveRow({required this.template});

  final EffectiveChecklistTemplate template;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final sourceLabel = switch (template.source) {
      ChecklistTemplateSource.role =>
        context.l10n.memberDetailSourceRole,
      ChecklistTemplateSource.personalAdd =>
        context.l10n.memberDetailSourcePersonal,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(
            template.isRequired ? Icons.star : Icons.check_circle_outline,
            size: 18,
            color: template.isRequired
                ? appColors.error
                : appColors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              template.name,
              style: textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            sourceLabel,
            style: textTheme.labelSmall?.copyWith(
              color: appColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
