import 'dart:ui';

import 'package:templatecmd/core/theme/colors/i_colors.dart';

/// Dark theme color palette implementation.
///
/// Provides color values optimized for dark mode following Material Design 3 guidelines.
/// To customize colors, modify the hex values below.
///
/// Usage:
/// ```dart
/// final colors = DarkColors();
/// final primary = colors.primary; // #D0BCFF
/// ```
class DarkColors implements IColors {
  /// Dark background for main screens
  @override
  Color get background => const Color(0xFF1E1E1E);

  /// Red error color for validation states
  @override
  Color get error => const Color(0xFFB3261E);

  /// Light purple primary color - visible on dark backgrounds
  @override
  Color get primary => const Color(0xFFD0BCFF);

  /// Light gray-purple secondary color for supporting elements
  @override
  Color get secondary => const Color(0xFFCCC2DC);

  /// Dark surface color for cards and sheets
  @override
  Color get surface => const Color(0xFF1C1B1F);
}
