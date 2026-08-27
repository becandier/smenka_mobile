part of '../view/pwa_install_modal.dart';

/// Ручная инструкция по установке: пошаговый список с пиктограммами системных
/// иконок (iOS Safari) либо один универсальный шаг про меню браузера.
class _PwaInstallSteps extends StatelessWidget {
  const _PwaInstallSteps({required this.title, required this.steps});

  final String title;
  final List<({IconData icon, String text})> steps;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: appColors.wash,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            for (final step in steps)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(step.icon, size: 20, color: appColors.ink),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(step.text, style: textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
