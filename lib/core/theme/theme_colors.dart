import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._();
  // General colors
  static const black2 = Color(0xFF202124);
  static const grey = Color(0xB3000000); //black 70%
  static const mediumGrey = Color(0x80000000); //black 50%
  static const lightGrey = Color(0x33000000); //black 20%
  static const backgroundGrey = Color(0xFFF1F2F3);
  static const disabledGrey = Color(0xFFE6E6E6);
  static const shadow = Color(0x1e000000); //black 12%
  static const error = Color(0xFFE30000);

  static const whiteGrey = Color(0xFF868B9B);
  static const gray = Color(0xFFEEEEEE);
  static const success = Color(0xff116d5a);
  static const error1 = Color(0xFFfadcd3);
  static const green = Color(0xFF1A821A);
  static const yellow = Color(0xFFF1AF3A);

  static const Color midGray = Color.fromARGB(255, 198, 198, 198);
  static const Color darkGray = Color.fromARGB(255, 157, 161, 174);
  static const Color textGray = Color.fromARGB(255, 134, 139, 155);
  static const Color lightGray = Color.fromARGB(255, 242, 249, 253);
  static const Color blackText = Color.fromARGB(255, 36, 40, 45);
  static const Color trafficAmber = Color.fromARGB(255, 241, 175, 58);
  static const Color trafficRed = Color.fromARGB(255, 246, 0, 1);
  static const Color trafficGreen = Color.fromARGB(255, 0, 247, 0);

  // Supportive theme
  static const primary = Color(0xFF002548); // Blue
  static const primaryDark = Color(0xFF001A33); // Dark Blue
  static const accent = Color(0xFF1565C0); // Blue
  static const accent1 = Color(0xFF42A5F5); // Light Blue

// Light Mode Colors
  /// Main color for the app, used in branding and key elements
  static const Color kPrimaryBlue = Color(0xFF002548); // Blue

  /// Used for headers and prominent UI elements
  static const Color kDarkBlue = Color(0xFF001A33); // Dark Blue

  /// Background color for sections like chats
  static const Color kLightBlue = Color(0xFFBBDEFB); // Light Blue

  /// Provides variation and depth in the color scheme
  static const Color kComplementaryBlue = Color(0xFF64B5F6); // Light Blue

// Dark Mode Colors
  /// Primary background color in dark mode
  static const Color kDarkGrayBlack = Color(0xFF121212); // Dark Gray

  /// Used for headers and prominent UI elements in dark mode
  static const Color kPrimaryDeepBlue = Color(0xFF002244); // Deep Blue

  /// Used for headers and prominent UI elements in dark mode
  static const Color kDeepBlue = Color(0xFF001A33); // Dark Blue

  /// Complementary dark color for various UI elements in dark mode
  static const Color kDarkBlueShade = Color(0xFF0D47A1); // Dark Blue

  /// Background color for message bubbles and other elements in dark mode
  static const Color kMediumGray = Color(0xFF303030); // Medium Gray

  /// Text color for readability against dark background
  static const Color kLightGrayDarkMode = Color(0xFFAEBAC1); // Light Gray

  /// Used for icons and action buttons in dark mode
  static const Color kAccentBlue = Color(0xFF64B5F6); // Lighter Blue

  static Color bgColorPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.accent1;
  }

  static Color bgColorPrimary2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.accent;
  }

  static Color bgColorPrimary3(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent1
        : ThemeColors.primary;
  }

  static Color bgColorPrimary4(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.accent;
  }

  static Color bgColorPrimary5(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : Colors.black;
  }

  static Color bgColorAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent
        : ThemeColors.kDarkBlueShade;
  }

  static Color bgColorBW(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
  }

  static Color bgColorWB(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
