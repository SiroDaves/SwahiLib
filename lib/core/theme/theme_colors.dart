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

  static const Color midGray = Color.fromARGB(255, 198, 198, 198);
  static const Color darkGray = Color.fromARGB(255, 157, 161, 174);
  static const Color textGray = Color.fromARGB(255, 134, 139, 155);
  static const Color lightGray = Color.fromARGB(255, 242, 249, 253);
  static const Color blackText = Color.fromARGB(255, 36, 40, 45);
  static const Color trafficAmber = Color.fromARGB(255, 241, 175, 58);
  static const Color trafficRed = Color.fromARGB(255, 246, 0, 1);
  static const Color trafficGreen = Color.fromARGB(255, 0, 247, 0);

  // Theme Colors
  static const primary = Color(0xFF003297);
  static const primary1 = Color(0xFF00287A);
  static const primary2 = Color(0xFF001F5C);
  static const primaryDark = Color(0xFF001A66);
  static const primaryDark1 = Color(0xFF000F40);
  static const primaryDark2 = Color(0xFF000A33);
  static const accent = Color(0xFFBBDEFB);
  static const accent1 = Color(0xFF64B5F6);
  static const accent2 = Color(0xFF1E88E5);

  static bool isLightTheme(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.light;
  }

  static Color foreColorPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : ThemeColors.primary2;
  }

  static Color foreColorPrimary1(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primaryDark1
        : ThemeColors.accent1;
  }

  static Color foreColorPrimary2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent1
        : ThemeColors.primaryDark1;
  }

  static Color foreColorBW(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  static Color foreColorWB(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
  }

  static Color bgColorPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.primaryDark1;
  }

  static Color bgColorPrimary2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.accent;
  }

  static Color bgColorPrimary3(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary2
        : ThemeColors.accent;
  }

  static Color bgColorPrimary4(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primaryDark
        : Colors.white;
  }

  static Color bgColorPrimary5(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : ThemeColors.primaryDark;
  }

  static Color bgColorAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent
        : ThemeColors.primary2;
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

  static Color bgColorShadow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent2
        : Colors.grey;
  }
}
