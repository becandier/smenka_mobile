import 'dart:ui';

import 'package:smenka_mobile/core/theme/colors/i_colors.dart';

/// Light theme color palette implementation.
///
/// Calm blue primary (#4A90D9) with neutral gray-blue secondary.
/// TickTick-inspired: clean, minimal, soft surfaces.
class LightColors implements IColors {
  @override
  Color get primary => const Color(0xFF4A90D9);

  @override
  Color get secondary => const Color(0xFF5C6B7A);

  @override
  Color get background => const Color(0xFFFAFBFC);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get error => const Color(0xFFE53935);

  @override
  Color get success => const Color(0xFF4CAF50);

  @override
  Color get warning => const Color(0xFFFF9800);

  @override
  Color get info => const Color(0xFF2196F3);
}
