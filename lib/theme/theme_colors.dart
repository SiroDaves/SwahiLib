import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._();
  static const primary = Color(0xFF002548);
  static const primaryDark = Color(0xFF001223);
  static const accent = Color(0xFF009AC7);
  static const accentDark = Color(0xFF0080A8);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const blue = Colors.blue;
  static const green = Colors.green;
  static const greenAccent = Colors.greenAccent;
  static const greenDark = Color(0xff116d5a);
  static const red = Color(0xFFE30000);
  static const maroon = Color.fromARGB(255, 145, 32, 32);
  static const grey = Color(0xB3000000);
  static const mediumGrey = Color(0x80000000);
  static const lightGrey = Color(0x33000000);
  static const backgroundGrey = Color(0xFFF1F2F3);
  static const disabledGrey = Color(0xFFE6E6E6);
  static const shadow = Color(0x1e000000);
  static const success = Color(0xff116d5a);
  static const error = Color(0xFFE30000);
  
  static Color shiftHsl(Color c, [double amt = 0]) {
    var hslc = HSLColor.fromColor(c);
    return hslc.withLightness((hslc.lightness + amt).clamp(0.0, 1.0)).toColor();
  }

  static Color parseHex(String value) =>
      Color(int.parse(value.substring(1, 7), radix: 16) + 0xFF000000);

  static Color blend(Color dst, Color src, double opacity) {
    return Color.fromARGB(
      255,
      (dst.red.toDouble() * (1.0 - opacity) + src.red.toDouble() * opacity)
          .toInt(),
      (dst.green.toDouble() * (1.0 - opacity) + src.green.toDouble() * opacity)
          .toInt(),
      (dst.blue.toDouble() * (1.0 - opacity) + src.blue.toDouble() * opacity)
          .toInt(),
    );
  }
}
