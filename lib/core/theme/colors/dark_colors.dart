import 'dart:ui';

import 'package:smenka_mobile/core/theme/colors/i_colors.dart';

/// Dark theme color palette implementation.
///
/// Lightened blue primary (#7AB5E8) for visibility on dark backgrounds.
/// TickTick-inspired: clean, minimal, dark surfaces.
class DarkColors implements IColors {
  @override
  Color get primary => const Color(0xFF7AB5E8);

  @override
  Color get secondary => const Color(0xFF8E99A4);

  @override
  Color get background => const Color(0xFF121212);

  @override
  Color get surface => const Color(0xFF1E1E1E);

  @override
  Color get error => const Color(0xFFEF5350);

  @override
  Color get success => const Color(0xFF66BB6A);

  @override
  Color get warning => const Color(0xFFFFA726);

  @override
  Color get info => const Color(0xFF42A5F5);
}
