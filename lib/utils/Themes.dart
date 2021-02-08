//This files manages the themes of the app

import 'package:flutter/material.dart';
import 'colors.dart';

final asLightTheme = _buildLightTheme();
final asDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = ColorUtils.primaryColor;
  const Color secondaryColor = ColorUtils.secondaryColor;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: secondaryColor,
    indicatorColor: ColorUtils.white,
    toggleableActiveColor: ColorUtils.activeColor,
    splashColor: ColorUtils.white2,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: ColorUtils.white,
    scaffoldBackgroundColor: ColorUtils.white,
    backgroundColor: ColorUtils.white,
    errorColor: ColorUtils.errorColor,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = ColorUtils.grey;
  const Color secondaryColor = ColorUtils.black;
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    buttonColor: primaryColor,
    indicatorColor: ColorUtils.white,
    toggleableActiveColor: ColorUtils.activeColor2,
    accentColor: secondaryColor,
    canvasColor: ColorUtils.baseColor2,
    scaffoldBackgroundColor: ColorUtils.baseColor2,
    backgroundColor: ColorUtils.baseColor2,
    errorColor: ColorUtils.errorColor,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}
