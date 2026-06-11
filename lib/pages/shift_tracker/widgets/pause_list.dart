part of '../view/shift_tracker_page.dart';

class _PauseList extends StatelessWidget {
  const _PauseList({required this.pauses});

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
          l10n.shiftPauses,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
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
            final pause = pauses[index];
            return _PauseCard(pause: pause, index: index + 1);
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
    final duration = _pauseDuration(pause);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                isActive ? Icons.pause_circle : Icons.pause_circle_outlined,
                color: isActive ? colors.warning : colors.secondary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.shiftPauseNumber(index),
                  style: textTheme.bodyMedium,
                ),
              ),
              Text(
                duration,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isActive ? colors.warning : colors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _pauseDuration(Pause pause) {
    final end = pause.finishedAt ?? DateTime.now();
    final seconds = end.difference(pause.startedAt).inSeconds;
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}
