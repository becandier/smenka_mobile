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
    required this.ink,
    required this.muted,
    required this.line,
    required this.wash,
    required this.blueDeep,
    required this.blueMid,
    required this.bluePale,
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
    ink: colors.ink,
    muted: colors.muted,
    line: colors.line,
    wash: colors.wash,
    blueDeep: colors.blueDeep,
    blueMid: colors.blueMid,
    bluePale: colors.bluePale,
    error: colors.error,
    success: colors.success,
    warning: colors.warning,
    info: colors.info,
  );

  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color ink;
  final Color muted;
  final Color line;
  final Color wash;
  final Color blueDeep;
  final Color blueMid;
  final Color bluePale;
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
    Color? ink,
    Color? muted,
    Color? line,
    Color? wash,
    Color? blueDeep,
    Color? blueMid,
    Color? bluePale,
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
      ink: ink ?? this.ink,
      muted: muted ?? this.muted,
      line: line ?? this.line,
      wash: wash ?? this.wash,
      blueDeep: blueDeep ?? this.blueDeep,
      blueMid: blueMid ?? this.blueMid,
      bluePale: bluePale ?? this.bluePale,
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
      ink: Color.lerp(ink, other.ink, t) ?? ink,
      muted: Color.lerp(muted, other.muted, t) ?? muted,
      line: Color.lerp(line, other.line, t) ?? line,
      wash: Color.lerp(wash, other.wash, t) ?? wash,
      blueDeep: Color.lerp(blueDeep, other.blueDeep, t) ?? blueDeep,
      blueMid: Color.lerp(blueMid, other.blueMid, t) ?? blueMid,
      bluePale: Color.lerp(bluePale, other.bluePale, t) ?? bluePale,
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
