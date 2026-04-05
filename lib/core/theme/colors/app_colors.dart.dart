import 'package:flutter/material.dart';

import 'package:smenka_mobile/core/theme/colors/i_colors.dart';

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
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
    required this.success,
    required this.warning,
    required this.info,
  });

  /// Creates AppColors from an [IColors] implementation
  factory AppColors.fromColors(IColors colors) => AppColors(
        primary: colors.primary,
        secondary: colors.secondary,
        background: colors.background,
        surface: colors.surface,
        error: colors.error,
        success: colors.success,
        warning: colors.warning,
        info: colors.info,
      );

  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color error;
  final Color success;
  final Color warning;
  final Color info;

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
    Color? success,
    Color? warning,
    Color? info,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      error: Color.lerp(error, other.error, t) ?? error,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      info: Color.lerp(info, other.info, t) ?? info,
    );
  }
}

extension AppColorExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
