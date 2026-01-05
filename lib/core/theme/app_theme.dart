import 'package:flutter/material.dart';
import 'package:templatecmd/core/theme/colors/app_colors.dart.dart';
import 'package:templatecmd/core/theme/colors/dark_colors.dart';
import 'package:templatecmd/core/theme/colors/i_colors.dart';
import 'package:templatecmd/core/theme/colors/light_colors.dart';

/// Application theme configuration.
///
/// Provides light and dark [ThemeData] with custom [AppColors] extension.
/// Uses Material Design 3 with [ColorScheme.fromSeed] for consistent theming.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   darkTheme: AppTheme.darkTheme,
///   themeMode: ThemeMode.system,
/// )
/// ```
///
/// To add custom ThemeExtensions (e.g., AppTextStyles):
/// 1. Create your extension class extending ThemeExtension<T>
/// 2. Add it to the extensions list in [_buildTheme]
///
/// See also:
/// - [AppColors] for color extension
/// - [LightColors] and [DarkColors] for color palettes
class AppTheme {
  const AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme => _buildTheme(
        LightColors(),
        Brightness.light,
      );

  /// Dark theme configuration
  static ThemeData get darkTheme => _buildTheme(
        DarkColors(),
        Brightness.dark,
      );

  /// Builds ThemeData with custom extensions
  ///
  /// [colors] - Color palette implementing [IColors]
  /// [brightness] - Theme brightness (light/dark)
  static ThemeData _buildTheme(IColors colors, Brightness brightness) {
    final appColors = AppColors(
      primary: colors.primary,
      secondary: colors.secondary,
      background: colors.background,
      surface: colors.surface,
      error: colors.error,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: appColors.primary,
        brightness: brightness,
      ),
      extensions: [appColors],
    );
  }
}
