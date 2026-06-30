import 'dart:ui';

import 'package:smenka_mobile/core/theme/colors/i_colors.dart';

/// Light theme color palette implementation.
///
/// Smenka Brand Kit v1.0: Smenka Blue primary (#4A90D9), Deep Blue accent,
/// neutral ink/muted/line/wash. Clean, minimal, soft surfaces.
class LightColors implements IColors {
  @override
  Color get primary => const Color(0xFF4A90D9); // Smenka Blue

  // Deep Blue (in-family accent / pressed)
  @override
  Color get secondary => const Color(0xFF1B4E7A);

  @override
  Color get background => const Color(0xFFFAFBFC);

  @override
  Color get surface => const Color(0xFFFFFFFF); // paper

  @override
  Color get ink => const Color(0xFF1D2530);

  @override
  Color get muted => const Color(0xFF6B7785);

  @override
  Color get line => const Color(0xFFE7EBF0);

  @override
  Color get wash => const Color(0xFFEAF2FB);

  @override
  Color get blueDeep => const Color(0xFF1B4E7A);

  @override
  Color get blueMid => const Color(0xFF2E6DB0);

  @override
  Color get bluePale => const Color(0xFF9CC4EA);

  @override
  Color get error => const Color(0xFFE53935);

  @override
  Color get success => const Color(0xFF4CAF50);

  @override
  Color get warning => const Color(0xFFFF9800);

  @override
  Color get info => const Color(0xFF2196F3);
}
