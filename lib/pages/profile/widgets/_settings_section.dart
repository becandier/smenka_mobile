part of '../view/profile_page.dart';

class _SettingsSection extends StatelessWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.settings,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Material(
            color: appColors.surface,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.palette_outlined,
                        size: 20,
                        color: appColors.secondary,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        l10n.theme,
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const ThemeButtonWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
