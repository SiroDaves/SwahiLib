import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../repo/storage/local_storage.dart';
import '../../util/env/flavor_config.dart';
import '../util/constants/pref_constants.dart';

@singleton
class GlobalVm with ChangeNotifierEx {
  final LocalStorage localStorage;

  TargetPlatform? targetPlat;

  GlobalVm(this.localStorage);

  ThemeMode get themeMode => FlavorConfig.instance.themeMode;

  TargetPlatform? get targetPlatform => targetPlat;

  bool wakeLockStatus = false;
  bool slideHorizontal = false;
  bool get isDarkMode => localStorage.getPrefBool(PrefConstants.darkModeKey);

  Future<void> init(BuildContext context) async {
    FlavorConfig.instance.themeMode = localStorage.getThemeMode();
    notifyListeners();
    wakeLockStatus = localStorage.getPrefBool(PrefConstants.wakeLockCheckKey);
  }

  Future<void> setDarkMode(bool val) async {
    localStorage.setPrefBool(PrefConstants.darkModeKey, val);
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    FlavorConfig.instance.themeMode = themeMode;
    notifyListeners();
    await localStorage.updateThemeMode(themeMode);
  }

  Future<void> updateWakeLockStatus(bool wakeLock) async {
    wakeLockStatus = wakeLock;
    notifyListeners();
    localStorage.setPrefBool(PrefConstants.wakeLockCheckKey, wakeLock);
  }

  Future<void> updateSlideHorizontal(bool slideDirection) async {
    slideHorizontal = slideDirection;
    notifyListeners();
    localStorage.setPrefBool(PrefConstants.slideHorizontalKey, slideDirection);
  }

  String getCurrentPlatform() {
    if (targetPlatform == TargetPlatform.android) {
      return 'Android';
    } else if (targetPlatform == TargetPlatform.iOS) {
      return 'Ios';
    }
    return 'System Default';
  }

  String getAppearanceValue() {
    switch (FlavorConfig.instance.themeMode) {
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.light:
        return 'Light';
      default:
        return 'System';
    }
  }
}
