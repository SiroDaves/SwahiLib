import 'package:flutter/material.dart';

import 'theme_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      //fontFamily: ThemeFonts.lato,
      scaffoldBackgroundColor: ThemeColors.kLightTeal,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ThemeColors.kPrimaryRed,
        primaryContainer: ThemeColors.kPrimaryRed,
        onPrimary: Colors.white,
        secondary: ThemeColors.kComplementaryRed,
        secondaryContainer: ThemeColors.kComplementaryRed,
        onSecondary: ThemeColors.kDarkGrayBlack,
        surface: ThemeColors.kLightTeal,
        onSurface: Colors.black,
        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.kPrimaryDeepRed,
        foregroundColor: ThemeColors.accent,
        shadowColor: Colors.black,
        elevation: 3,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: ThemeColors.accent,
        elevation: 3,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      //fontFamily: ThemeFonts.lato,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        primaryContainer: Colors.white,
        onPrimary: Colors.white,
        secondary: ThemeColors.kLightGrayDarkMode,
        secondaryContainer: ThemeColors.kLightGrayDarkMode,
        onSecondary: ThemeColors.kDarkTealGreen,
        surface: Colors.grey,
        onSurface: Colors.white,
        error: Colors.red,
        onError: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.black,
        indicatorColor: ThemeColors.accent,
      ),
    );
  }
}
