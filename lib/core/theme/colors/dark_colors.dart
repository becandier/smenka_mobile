import 'dart:ui';

import 'package:smenka_mobile/core/theme/colors/i_colors.dart';

/// Dark theme color palette implementation.
///
/// Smenka Brand Kit v1.0 (dark variant): lightened blue primary (#7AB5E8) for
/// contrast on dark surfaces. Accents stay in the cold-blue brand family;
/// neutrals are darkened analogues of the light tokens.
class DarkColors implements IColors {
  @override
  Color get primary => const Color(0xFF7AB5E8);

  @override
  Color get secondary => const Color(0xFF9CC4EA); // bluePale accent

  @override
  Color get background => const Color(0xFF121212);

  @override
  Color get surface => const Color(0xFF1E1E1E);

  @override
  Color get ink => const Color(0xFFECEFF3); // primary text on dark

  @override
  Color get muted => const Color(0xFF9AA4B0);

  @override
  Color get line => const Color(0xFF2A2F37);

  @override
  Color get wash => const Color(0xFF18222E); // blue-tinted subtle fill

  @override
  Color get blueDeep => const Color(0xFF2E6DB0); // deeper accent / pressed

  @override
  Color get blueMid => const Color(0xFF89B7E6);

  @override
  Color get bluePale => const Color(0xFF9CC4EA);

  @override
  Color get error => const Color(0xFFEF5350);

  @override
  Color get success => const Color(0xFF66BB6A);

  @override
  Color get warning => const Color(0xFFFFA726);

  @override
  Color get info => const Color(0xFF42A5F5);
}
