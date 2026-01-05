import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templatecmd/core/theme/colors/app_colors.dart.dart';
import 'package:templatecmd/l10n/localization_extension.dart';
import 'package:templatecmd/pages/theme/cubit/theme_cubit.dart';

/// Theme selector button widget with popup menu.
///
/// Displays current theme mode with icon and label.
/// Shows dropdown menu with all available theme options.
/// Requires [ThemeCubit] to be provided in the widget tree.
///
/// Features:
/// - Automatic theme switching via [ThemeCubit]
/// - Localized labels for theme modes
/// - Visual indicator for selected theme
/// - Smooth animations and modern styling
class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({
    super.key,
  });

  /// Returns appropriate icon for each theme mode
  IconData _getThemeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode_rounded,
      ThemeMode.dark => Icons.dark_mode_rounded,
      ThemeMode.system => Icons.brightness_auto_rounded,
    };
  }

  String _getThemeLabel(BuildContext context, ThemeMode mode) {
    final l10n = context.l10n;
    return switch (mode) {
      ThemeMode.light => l10n.light,
      ThemeMode.dark => l10n.dark,
      ThemeMode.system => l10n.system,
    };
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return PopupMenuButton<ThemeMode>(
          initialValue: state,
          onSelected: (value) => context.read<ThemeCubit>().toggleTheme(value),
          elevation: 8,
          color: appColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          offset: const Offset(0, 12),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: ThemeMode.system,
              child: _buildMenuItem(
                context,
                ThemeMode.system,
                state == ThemeMode.system,
                appColors,
              ),
            ),
            PopupMenuItem(
              value: ThemeMode.light,
              child: _buildMenuItem(
                context,
                ThemeMode.light,
                state == ThemeMode.light,
                appColors,
              ),
            ),
            PopupMenuItem(
              value: ThemeMode.dark,
              child: _buildMenuItem(
                context,
                ThemeMode.dark,
                state == ThemeMode.dark,
                appColors,
              ),
            ),
          ],
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: appColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: appColors.primary.withValues(alpha: 0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: appColors.primary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getThemeIcon(state),
                  size: 20,
                  color: appColors.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  _getThemeLabel(context, state),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: appColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: appColors.primary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    ThemeMode mode,
    bool isSelected,
    AppColors appColors,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? appColors.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getThemeIcon(mode),
            size: 20,
            color: isSelected ? appColors.primary : appColors.secondary,
          ),
          const SizedBox(width: 12),
          Text(
            _getThemeLabel(context, mode),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected ? appColors.primary : appColors.secondary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
          ),
          if (isSelected) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.check_circle_rounded,
              size: 18,
              color: appColors.primary,
            ),
          ],
        ],
      ),
    );
  }
}
