import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../util/env/flavor_config.dart';
import 'theme_colors.dart';
import 'theme_styles.dart';

class AppThemeData {
  AppThemeData._();

  static final darkThemeData = ThemeData(
    fontFamily: ThemeFonts.lato,
    primaryColor: ThemeColors.primary,
    colorScheme: const ColorScheme(
      primary: ThemeColors.primary,
      primaryContainer: ThemeColors.primaryDark,
      onPrimary: ThemeColors.white,
      secondary: ThemeColors.accent,
      secondaryContainer: ThemeColors.accent,
      onSecondary: ThemeColors.white,
      surface: ThemeColors.backgroundGrey,
      onBackground: ThemeColors.primary,
      onSurface: ThemeColors.primary,
      background: ThemeColors.backgroundGrey,
      onError: ThemeColors.primaryDark,
      brightness: Brightness.light,
      error: ThemeColors.error,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeColors.accent,
      selectionHandleColor: ThemeColors.accent,
      selectionColor: ThemeColors.accent.withOpacity(0.4),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: isInTest
            ? const FadeUpwardsPageTransitionsBuilder()
            : BaseThemeData.getCorrectPageTransitionBuilder(OsInfo.instance),
      },
    ),
  );

  static final lightThemeData = darkThemeData.copyWith();

  static ThemeData darkTheme(TargetPlatform? targetPlatform) {
    return darkThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData lightTheme(TargetPlatform? targetPlatform) {
    return lightThemeData.copyWith(platform: targetPlatform);
  }
}

class AppTextTheme {
  final TextStyle titleHuge;
  final TextStyle titleBig;
  final TextStyle titleNormal;
  final TextStyle titleSmall;

  final TextStyle titleListItem;

  final TextStyle labelButtonBig;
  final TextStyle labelButtonBigDisabled;
  final TextStyle labelButtonSmall;
  final TextStyle labelButtonSmallDisabled;

  final TextStyle bodyNormal;
  final TextStyle bodySmall;
  final TextStyle bodyUltraSmall;
  final TextStyle infoBodySubHeader;
  final TextStyle bodyBig;

  const AppTextTheme({
    required this.titleHuge,
    required this.titleBig,
    required this.titleNormal,
    required this.titleSmall,
    required this.titleListItem,
    required this.labelButtonBig,
    required this.labelButtonBigDisabled,
    required this.labelButtonSmall,
    required this.labelButtonSmallDisabled,
    required this.bodyNormal,
    required this.bodySmall,
    required this.bodyUltraSmall,
    required this.infoBodySubHeader,
    required this.bodyBig,
  });
}

class AppTextThemeExceptions {
  const AppTextThemeExceptions();
}

class AppColorsTheme {
  final Color text;
  final Color inverseText;
  final Color disabledButtonText;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color inverseBackground;
  final Color inputFieldFill;
  final Color disabled;
  final Color icon;
  final Color inverseIcon;
  final Color inverseProgressIndicator;
  final Color progressIndicator;

  const AppColorsTheme({
    required this.text,
    required this.inverseText,
    required this.disabledButtonText,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.inverseBackground,
    required this.inputFieldFill,
    required this.disabled,
    required this.icon,
    required this.inverseIcon,
    required this.inverseProgressIndicator,
    required this.progressIndicator,
  });
}

class AppTheme {
  final AppTextTheme coreTextTheme;
  final AppTextTheme inverseCoreTextTheme;
  final AppTextTheme accentTextTheme;
  final AppTextThemeExceptions exceptionsTextTheme;
  final AppColorsTheme colorsTheme;

  static final instanceDark = fromColorTheme(
    colorTheme: const AppColorsTheme(
      text: ThemeColors.white,
      inverseText: ThemeColors.black,
      disabledButtonText: ThemeColors.lightGrey,
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      secondary: ThemeColors.white,
      background: ThemeColors.primary,
      inverseBackground: ThemeColors.white,
      inputFieldFill: ThemeColors.white,
      disabled: ThemeColors.disabledGrey,
      icon: ThemeColors.white,
      inverseIcon: ThemeColors.black,
      progressIndicator: ThemeColors.primary,
      inverseProgressIndicator: ThemeColors.white,
    ),
  );

  static final instanceLight = instanceDark;

  static AppTheme fromColorTheme(
          {required AppColorsTheme colorTheme}) =>
      AppTheme._(
        colorsTheme: colorTheme,
        coreTextTheme: AppTextTheme(
          titleHuge: TextStyle(
              fontSize: 40,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato,
              height: 1.2),
          titleBig: TextStyle(
              fontSize: 30,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato,
              height: 1.2),
          titleNormal: TextStyle(
              fontSize: 24,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato),
          titleSmall: TextStyle(
              fontSize: 18,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato),
          titleListItem: TextStyle(
              fontSize: 18,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonBig: TextStyle(
              fontSize: 16,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(
              fontSize: 16,
              color: colorTheme.disabledButtonText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(
              fontSize: 14,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(
              fontSize: 14,
              color: colorTheme.disabledButtonText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          bodyBig: TextStyle(
              fontSize: 18,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato),
          bodyNormal: TextStyle(
              fontSize: 16,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato),
          bodySmall: TextStyle(
              fontSize: 14,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato),
          bodyUltraSmall: TextStyle(
              fontSize: 12,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato),
          infoBodySubHeader: TextStyle(
              fontSize: 14,
              color: colorTheme.text,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.w600),
        ),
        inverseCoreTextTheme: AppTextTheme(
          titleHuge: TextStyle(
              fontSize: 40,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato,
              height: 1.2),
          titleBig: TextStyle(
              fontSize: 30,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato,
              height: 1.2),
          titleNormal: TextStyle(
              fontSize: 24,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato),
          titleSmall: TextStyle(
              fontSize: 18,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato),
          titleListItem: TextStyle(
              fontSize: 18,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonBig: TextStyle(
              fontSize: 16,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(
              fontSize: 16,
              color: colorTheme.disabledButtonText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(
              fontSize: 14,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(
              fontSize: 14,
              color: colorTheme.disabledButtonText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          bodyBig: TextStyle(
              fontSize: 18,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato),
          bodyNormal: TextStyle(
              fontSize: 16,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato),
          bodySmall: TextStyle(
              fontSize: 14,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato),
          bodyUltraSmall: TextStyle(
              fontSize: 12,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato),
          infoBodySubHeader: TextStyle(
              fontSize: 14,
              color: colorTheme.inverseText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.w600),
        ),
        accentTextTheme: AppTextTheme(
          titleHuge: TextStyle(
              fontSize: 40,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato,
              height: 1.2),
          titleBig: TextStyle(
              fontSize: 30,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato,
              height: 1.2),
          titleNormal: TextStyle(
              fontSize: 24,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato),
          titleSmall: TextStyle(
              fontSize: 18,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato),
          titleListItem: TextStyle(
              fontSize: 18,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonBig: TextStyle(
              fontSize: 16,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(
              fontSize: 16,
              color: colorTheme.disabledButtonText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(
              fontSize: 14,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(
              fontSize: 14,
              color: colorTheme.disabledButtonText,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.bold),
          bodyBig: TextStyle(
              fontSize: 18,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato),
          bodyNormal: TextStyle(
              fontSize: 16,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato),
          bodySmall: TextStyle(
              fontSize: 14,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato),
          bodyUltraSmall: TextStyle(
              fontSize: 12,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato),
          infoBodySubHeader: TextStyle(
              fontSize: 14,
              color: colorTheme.accent,
              fontFamily: ThemeFonts.lato,
              fontWeight: FontWeight.w600),
        ),
        exceptionsTextTheme: const AppTextThemeExceptions(),
      );

  const AppTheme._({
    required this.coreTextTheme,
    required this.inverseCoreTextTheme,
    required this.accentTextTheme,
    required this.exceptionsTextTheme,
    required this.colorsTheme,
  });

  static AppTheme of(BuildContext context,
      {bool forceDark = false, bool forceLight = false}) {
    if (forceDark) return instanceDark;
    if (forceLight) return instanceLight;

    final theme = FlavorConfig.instance.themeMode;
    if (theme == ThemeMode.dark) {
      return instanceDark;
    } else if (theme == ThemeMode.light) {
      return instanceLight;
    }
    final brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) return instanceDark;

    return instanceLight;
  }
}
