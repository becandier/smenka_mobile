# Theme Configuration Guide

This guide explains how to configure themes, customize colors, and add custom ThemeExtensions.

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Quick Start](#quick-start)
- [Customizing Colors](#customizing-colors)
- [Adding New Colors](#adding-new-colors)
- [Adding Custom ThemeExtensions](#adding-custom-themeextensions)
- [Theme Persistence](#theme-persistence)
- [File Reference](#file-reference)

---

## Architecture Overview

The theme system follows a layered architecture:

```
┌─────────────────────────────────────────────────────────┐
│                    MaterialApp                          │
│  theme: AppTheme.lightTheme                             │
│  darkTheme: AppTheme.darkTheme                          │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                     AppTheme                            │
│  Builds ThemeData with extensions                       │
│  → app_theme.dart                                       │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│              ThemeExtensions                            │
│  AppColors (+ future: AppTextStyles, AppSpacing, etc.)  │
│  → colors/app_colors.dart.dart                          │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│              Color Implementations                      │
│  LightColors / DarkColors                               │
│  → colors/light_colors.dart, colors/dark_colors.dart    │
└─────────────────────────────────────────────────────────┘
```

---

## Quick Start

### Using colors in widgets

```dart
@override
Widget build(BuildContext context) {
  final appColors = context.appColors;
  
  return Container(
    color: appColors.surface,
    child: Text(
      'Hello',
      style: TextStyle(color: appColors.primary),
    ),
  );
}
```

### Applying theme to MaterialApp

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system, // or ThemeMode.light / ThemeMode.dark
)
```

---

## Customizing Colors

### Step 1: Edit color values

Open the color implementation files and modify hex values:

**Light Theme** → [`colors/light_colors.dart`](colors/light_colors.dart)

```dart
class LightColors implements IColors {
  @override
  Color get primary => const Color(0xFF6750A4);  // Change this hex value
  
  @override
  Color get secondary => const Color(0xFF625B71);
  
  // ... other colors
}
```

**Dark Theme** → [`colors/dark_colors.dart`](colors/dark_colors.dart)

```dart
class DarkColors implements IColors {
  @override
  Color get primary => const Color(0xFFD0BCFF);  // Change this hex value
  
  // ... other colors
}
```

### Step 2: Hot reload

Changes take effect immediately with hot reload.

---

## Adding New Colors

### Step 1: Update the interface

Edit [`colors/i_colors.dart`](colors/i_colors.dart):

```dart
abstract class IColors {
  Color get primary;
  Color get secondary;
  Color get background;
  Color get surface;
  Color get error;
  
  // Add new color
  Color get accent;
  Color get warning;
}
```

### Step 2: Implement in both themes

**Light Theme** → [`colors/light_colors.dart`](colors/light_colors.dart):

```dart
@override
Color get accent => const Color(0xFFFF5722);

@override
Color get warning => const Color(0xFFFFC107);
```

**Dark Theme** → [`colors/dark_colors.dart`](colors/dark_colors.dart):

```dart
@override
Color get accent => const Color(0xFFFF8A65);

@override
Color get warning => const Color(0xFFFFD54F);
```

### Step 3: Update AppColors extension

Edit [`colors/app_colors.dart.dart`](colors/app_colors.dart.dart):

```dart
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
    // Add new fields
    required this.accent,
    required this.warning,
  });

  final Color accent;
  final Color warning;

  // Update copyWith
  @override
  AppColors copyWith({
    // ... existing params
    Color? accent,
    Color? warning,
  }) {
    return AppColors(
      // ... existing assignments
      accent: accent ?? this.accent,
      warning: warning ?? this.warning,
    );
  }

  // Update lerp
  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      // ... existing lerps
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
    );
  }
}
```

### Step 4: Update AppTheme

Edit [`app_theme.dart`](app_theme.dart) to include new colors:

```dart
final appColors = AppColors(
  // ... existing colors
  accent: colors.accent,
  warning: colors.warning,
);
```

---

## Adding Custom ThemeExtensions

### Example: Adding AppTextStyles

#### Step 1: Create the extension class

Create `lib/core/theme/text_styles/app_text_styles.dart`:

```dart
import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.headline1,
    required this.headline2,
    required this.body1,
    required this.body2,
    required this.caption,
  });

  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle caption;

  @override
  AppTextStyles copyWith({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? caption,
  }) {
    return AppTextStyles(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      caption: caption ?? this.caption,
    );
  }

  @override
  AppTextStyles lerp(covariant AppTextStyles? other, double t) {
    if (other == null) return this;
    return AppTextStyles(
      headline1: TextStyle.lerp(headline1, other.headline1, t)!,
      headline2: TextStyle.lerp(headline2, other.headline2, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
    );
  }

  /// Light theme text styles
  static AppTextStyles get light => const AppTextStyles(
    headline1: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1E1E1E),
    ),
    headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1E1E1E),
    ),
    body1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF1E1E1E),
    ),
    body2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF625B71),
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xFF625B71),
    ),
  );

  /// Dark theme text styles
  static AppTextStyles get dark => const AppTextStyles(
    headline1: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
    ),
    headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
    ),
    body1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFFFFFFF),
    ),
    body2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFFCCC2DC),
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xFFCCC2DC),
    ),
  );
}

/// BuildContext extension for easy access
extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => Theme.of(this).extension<AppTextStyles>()!;
}
```

#### Step 2: Register in AppTheme

Edit [`app_theme.dart`](app_theme.dart):

```dart
import 'package:smenka_mobile/core/theme/text_styles/app_text_styles.dart';

static ThemeData _buildTheme(IColors colors, Brightness brightness) {
  final appColors = AppColors(...);
  
  // Add text styles based on brightness
  final appTextStyles = brightness == Brightness.light
      ? AppTextStyles.light
      : AppTextStyles.dark;

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: appColors.primary,
      brightness: brightness,
    ),
    extensions: [
      appColors,
      appTextStyles,  // Add here
    ],
  );
}
```

#### Step 3: Use in widgets

```dart
@override
Widget build(BuildContext context) {
  final appTextStyles = context.appTextStyles;
  
  return Text(
    'Hello World',
    style: appTextStyles.headline1,
  );
}
```

---

## Theme Persistence

Theme preference is automatically persisted using SharedPreferences.

### Key files:

- **Storage API** → [`lib/data/api/local/theme_local_storage_api.dart`](../../data/api/local/theme_local_storage_api.dart)
- **Service Initializer** → [`lib/app/main_app/locator/services/theme_local_storage_service.dart`](../../app/main_app/locator/services/theme_local_storage_service.dart)
- **State Management** → [`lib/pages/theme/cubit/theme_cubit.dart`](../../pages/theme/cubit/theme_cubit.dart)
- **UI Widget** → [`lib/pages/theme/widgets/theme_button_widget.dart`](../../pages/theme/widgets/theme_button_widget.dart)

### How it works:

1. On app startup, `ThemeLocalStorageServiceInitializer` reads saved theme from storage
2. `ThemeCubit` manages runtime theme state
3. `ThemeButtonWidget` provides UI for theme selection
4. Changes are automatically persisted via `ThemeLocalStorageApi`

---

## File Reference

| File | Description |
|------|-------------|
| [`app_theme.dart`](app_theme.dart) | Main theme configuration |
| [`colors/i_colors.dart`](colors/i_colors.dart) | Color interface definition |
| [`colors/app_colors.dart.dart`](colors/app_colors.dart.dart) | ThemeExtension for colors |
| [`colors/light_colors.dart`](colors/light_colors.dart) | Light theme colors |
| [`colors/dark_colors.dart`](colors/dark_colors.dart) | Dark theme colors |
| [`../../pages/theme/cubit/theme_cubit.dart`](../../pages/theme/cubit/theme_cubit.dart) | Theme state management |
| [`../../pages/theme/widgets/theme_button_widget.dart`](../../pages/theme/widgets/theme_button_widget.dart) | Theme selector widget |
| [`../../data/api/local/theme_local_storage_api.dart`](../../data/api/local/theme_local_storage_api.dart) | Theme persistence API |
| [`../../app/main_app/locator/services/theme_local_storage_service.dart`](../../app/main_app/locator/services/theme_local_storage_service.dart) | Theme service initializer |

---

## Tips

1. **Use semantic color names** - Prefer `primary`, `surface`, `error` over `blue`, `white`, `red`
2. **Test both themes** - Always verify changes look good in both light and dark modes
3. **Use lerp for animations** - Implement `lerp` method for smooth theme transitions
4. **Keep extensions focused** - One extension per concern (colors, typography, spacing)
5. **Document color usage** - Add comments explaining where each color should be used
