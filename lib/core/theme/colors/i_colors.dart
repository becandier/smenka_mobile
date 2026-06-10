import 'dart:ui';

import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart'
    show AppColors;

import 'package:smenka_mobile/core/theme/colors/dark_colors.dart'
    show DarkColors;

import 'package:smenka_mobile/core/theme/colors/light_colors.dart'
    show LightColors;

/// Abstract interface for app color palette.
///
/// Implement this interface to create light/dark theme color sets.
/// Each implementation (e.g., [LightColors], [DarkColors]) provides
/// concrete color values for the respective theme.
///
/// See also:
/// - [LightColors] for light theme implementation
/// - [DarkColors] for dark theme implementation
/// - [AppColors] for ThemeExtension wrapper
abstract class IColors {
  /// Primary brand color used for key UI elements
  Color get primary;

  /// Secondary color for less prominent elements
  Color get secondary;

  /// Main background color for screens
  Color get background;

  /// Surface color for cards, sheets, and elevated surfaces
  Color get surface;

  /// Error color for validation and error states
  Color get error;

  /// Success color for completed/approved states
  Color get success;

  /// Warning color for pending/attention states
  Color get warning;

  /// Info color for informational messages
  Color get info;
}
