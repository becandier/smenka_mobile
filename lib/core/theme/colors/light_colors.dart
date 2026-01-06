import 'dart:ui';

import 'package:templatecmd/core/theme/colors/i_colors.dart';

/// Light theme color palette implementation.
///
/// Provides color values optimized for light mode following Material Design 3 guidelines.
/// To customize colors, modify the hex values below.
///
/// Usage:
/// ```dart
/// final colors = LightColors();
/// final primary = colors.primary; // #6750A4
/// ```
class LightColors implements IColors {
  /// White background for main screens
  @override
  Color get background => const Color(0xFFFFFFFF);

  /// Red error color for validation states
  @override
  Color get error => const Color(0xFFB3261E);

  /// Purple primary color - main brand accent
  @override
  Color get primary => const Color(0xFF6750A4);

  /// Gray-purple secondary color for supporting elements
  @override
  Color get secondary => const Color(0xFF625B71);

  /// Near-white surface color for cards and sheets
  @override
  Color get surface => const Color(0xFFFFFBFE);
}
