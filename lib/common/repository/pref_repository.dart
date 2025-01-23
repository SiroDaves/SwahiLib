import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/word.dart';
import '../utils/constants/pref_constants.dart';

@singleton
abstract class PrefRepository {
  @factoryMethod
  factory PrefRepository(SharedPreferences prefRepo) = PrefRepositoryImp;

  ThemeMode getThemeMode();

  List<Word>? words = [];

  Future<void> updateThemeMode(ThemeMode themeMode);

  bool getPrefBool(String settingsKey);
  int getPrefInt(String settingsKey);
  String getPrefString(String settingsKey);

  void setPrefBool(String settingsKey, bool settingsValue);
  void setPrefInt(String settingsKey, int settingsValue);
  void setPrefString(String settingsKey, String settingsValue);

  void clearData();
  void removeKeyPair(String settingsKey);
  bool keyExists(String settingsKey);
}

class PrefRepositoryImp implements PrefRepository {
  final SharedPreferences sharedPrefs;

  PrefRepositoryImp(this.sharedPrefs);

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await sharedPrefs.setString(
      PrefConstants.appThemeKey,
      themeMode.toString(),
    );
  }

  @override
  ThemeMode getThemeMode() {
    switch (sharedPrefs.getString(PrefConstants.appThemeKey)) {
      case 'ThemeMode.light':
        return ThemeMode.light;

      case 'ThemeMode.dark':
        return ThemeMode.dark;

      default:
        return ThemeMode.system;
    }
  }

  @override
  void clearData() {
    sharedPrefs.remove(PrefConstants.appThemeKey);
    sharedPrefs.remove(PrefConstants.darkModeKey);
  }

  @override
  void removeKeyPair(String key) {
    sharedPrefs.remove(key);
  }

  @override
  bool keyExists(String key) {
    return sharedPrefs.containsKey(key);
  }

  @override
  bool getPrefBool(String settingsKey) {
    return sharedPrefs.getBool(settingsKey) ?? false;
  }

  @override
  int getPrefInt(String settingsKey) {
    return sharedPrefs.getInt(settingsKey) ?? 0;
  }

  @override
  String getPrefString(String settingsKey) {
    return sharedPrefs.getString(settingsKey) ?? '';
  }

  @override
  void setPrefBool(String settingsKey, bool settingsValue) {
    if (!settingsValue) {
      sharedPrefs.remove(settingsKey);
      return;
    }
    sharedPrefs.setBool(settingsKey, settingsValue);
  }

  @override
  void setPrefInt(String settingsKey, int settingsValue) {
    if (settingsValue.isNegative) {
      sharedPrefs.remove(settingsKey);
      return;
    }
    sharedPrefs.setInt(settingsKey, settingsValue);
  }

  @override
  void setPrefString(String settingsKey, String settingsValue) {
    if (settingsValue.isEmpty) {
      sharedPrefs.remove(settingsKey);
      return;
    }
    sharedPrefs.setString(settingsKey, settingsValue);
  }

  @override
  List<Word>? words = [];
}
