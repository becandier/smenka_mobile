part of '../view/pwa_install_modal.dart';

/// Короткий список пользы от установки — одинаков для всех браузеров.
class _PwaInstallBenefits extends StatelessWidget {
  const _PwaInstallBenefits();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final benefits = <({IconData icon, String text})>[
      (icon: Icons.grid_view_rounded, text: l10n.pwaInstallBenefitIcon),
      (icon: Icons.fullscreen, text: l10n.pwaInstallBenefitFullscreen),
      (icon: Icons.bolt_outlined, text: l10n.pwaInstallBenefitFast),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final benefit in benefits)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(benefit.icon, size: 20, color: appColors.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(benefit.text, style: textTheme.bodyMedium),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
