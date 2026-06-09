import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Список пауз смены: заголовок + карточки пауз с длительностью.
/// Переиспользуется на экране детали персональной и чужой (орг) смены.
class ShiftPauseList extends StatelessWidget {
  const ShiftPauseList({required this.pauses, super.key});

  final List<Pause> pauses;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.detailPauses,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        if (pauses.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              l10n.shiftNoPauses,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.secondary.withValues(alpha: 0.7),
              ),
            ),
          )
        else
          ...List.generate(pauses.length, (index) {
            return _PauseCard(pause: pauses[index], index: index + 1);
          }),
      ],
    );
  }
}

class _PauseCard extends StatelessWidget {
  const _PauseCard({required this.pause, required this.index});

  final Pause pause;
  final int index;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    final isActive = pause.finishedAt == null;
    final end = pause.finishedAt ?? DateTime.now();
    final duration = end.difference(pause.startedAt);
    final durationMinutes = duration.inMinutes;
    final durationSeconds = duration.inSeconds % 60;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    isActive ? Icons.pause_circle : Icons.pause_circle_outlined,
                    color: isActive ? colors.warning : colors.secondary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.shiftPauseNumber(index),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${durationMinutes.toString().padLeft(2, '0')}:'
                    '${durationSeconds.toString().padLeft(2, '0')}',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isActive ? colors.warning : colors.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${l10n.detailStarted}: ${_formatDateTime(pause.startedAt)}',
                style: textTheme.bodySmall?.copyWith(color: colors.secondary),
              ),
              const SizedBox(height: 4),
              Text(
                '${l10n.detailFinished}: ${switch (pause.finishedAt) {
                  final dt? => _formatDateTime(dt),
                  null => l10n.detailInProgress,
                }}',
                style: textTheme.bodySmall?.copyWith(
                  color: isActive ? colors.warning : colors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _formatDateTime(DateTime dt) {
  return DateFormat('dd.MM.yyyy, HH:mm').format(dt);
}
