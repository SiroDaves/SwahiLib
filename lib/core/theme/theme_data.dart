import 'package:flutter/material.dart';

import 'theme_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      //fontFamily: ThemeFonts.lato,
      scaffoldBackgroundColor: ThemeColors.kLightBlue,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ThemeColors.primaryDark,
        primaryContainer: ThemeColors.primaryDark,
        onPrimary: Colors.white,
        secondary: ThemeColors.kComplementaryBlue,
        secondaryContainer: ThemeColors.kComplementaryBlue,
        onSecondary: ThemeColors.kDarkGrayBlack,
        surface: ThemeColors.kLightBlue,
        onSurface: Colors.black,
        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.kPrimaryDeepBlue,
        foregroundColor: Colors.white,
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
        onSecondary: ThemeColors.kDarkBlueShade,
        surface: Colors.grey,
        onSurface: Colors.white,
        error: Colors.red,
        onError: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.primaryDark,
        foregroundColor: Colors.white,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: ThemeColors.primaryDark,
        indicatorColor: ThemeColors.accent,
      ),
    );
  }
}
