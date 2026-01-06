import 'package:flutter/material.dart';

import 'package:templatecmd/core/theme/colors/i_colors.dart';

/// ThemeExtension wrapper for app colors.
///
/// Provides type-safe access to custom colors through BuildContext.
/// Supports smooth color transitions during theme changes via [lerp].
///
/// Usage in widgets:
/// ```dart
/// final appColors = context.appColors;
/// Container(color: appColors.primary);
/// ```
///
/// See also:
/// - [IColors] for color interface definition
/// - [LightColors] and [DarkColors] for implementations
/// - [AppTheme] for theme configuration
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
  });

  /// Creates AppColors from an [IColors] implementation
  factory AppColors.fromColors(IColors colors) => AppColors(
        primary: colors.primary,
        secondary: colors.secondary,
        background: colors.background,
        surface: colors.surface,
        error: colors.error,
      );

  /// Primary brand color for key UI elements (buttons, links, accents)
  final Color primary;

  /// Secondary color for less prominent elements
  final Color secondary;

  /// Main background color for screens
  final Color background;

  /// Surface color for cards, sheets, and elevated components
  final Color surface;

  /// Error color for validation and error states
  final Color error;

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      error: Color.lerp(error, other.error, t) ?? error,
    );
  }
}

extension AppColorExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
