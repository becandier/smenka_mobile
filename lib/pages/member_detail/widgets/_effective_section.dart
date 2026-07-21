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
          p.effective.isLoading != c.effective.isLoading ||
          p.workLocations != c.workLocations,
      builder: (context, state) {
        final items =
            state.effective.data ?? const <EffectiveChecklistTemplate>[];
        final start = items
            .where((t) => t.type == ChecklistType.shiftStart)
            .toList();
        final end = items
            .where((t) => t.type == ChecklistType.shiftEnd)
            .toList();
        final locationNames = {
          for (final location in state.workLocations)
            location.id: location.name,
        };

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
                    _GroupHeader(text: l10n.checklistTemplatesShiftStart),
                    ...start.map(
                      (t) => _EffectiveRow(
                        template: t,
                        locationNames: locationNames,
                      ),
                    ),
                  ],
                  if (start.isNotEmpty && end.isNotEmpty)
                    const SizedBox(height: 8),
                  if (end.isNotEmpty) ...[
                    _GroupHeader(text: l10n.checklistTemplatesShiftEnd),
                    ...end.map(
                      (t) => _EffectiveRow(
                        template: t,
                        locationNames: locationNames,
                      ),
                    ),
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
        style: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(color: context.appColors.secondary),
      ),
    );
  }
}

class _EffectiveRow extends StatelessWidget {
  const _EffectiveRow({required this.template, required this.locationNames});

  final EffectiveChecklistTemplate template;

  /// id точки → название. Заполнена, только если точки организации успели
  /// загрузиться; иначе охват для привязанных шаблонов уйдёт в нейтральный
  /// фолбэк (см. [_locationsCoverageLabel]).
  final Map<String, String> locationNames;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final sourceLabel = switch (template.source) {
      ChecklistTemplateSource.role => context.l10n.memberDetailSourceRole,
      ChecklistTemplateSource.personalAdd =>
        context.l10n.memberDetailSourcePersonal,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 2),
            child: Text(
              _locationsCoverageLabel(
                context,
                template.locationIds,
                locationNames,
              ),
              style: textTheme.labelSmall?.copyWith(color: appColors.secondary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Охват чек-листа точками: пусто → «на всех точках», иначе — названия
/// (первые 2 + «+N»). Если id не резолвится в имя (точки ещё не
/// загрузились/удалены) — нейтральный текст без перечисления.
String _locationsCoverageLabel(
  BuildContext context,
  List<String> locationIds,
  Map<String, String> locationNames,
) {
  final l10n = context.l10n;
  if (locationIds.isEmpty) return l10n.memberDetailEffectiveAllLocations;

  final names = [
    for (final id in locationIds)
      if (locationNames[id] case final name?) name,
  ];
  if (names.isEmpty) return l10n.memberDetailEffectiveLocationsUnnamed;

  final shown = names.take(2).join(', ');
  final extra = names.length - 2;
  return extra > 0
      ? '$shown ${l10n.memberDetailEffectiveLocationsExtra(extra)}'
      : shown;
}
