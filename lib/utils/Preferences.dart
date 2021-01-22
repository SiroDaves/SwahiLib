//This files manages shared preferences of the app

import 'dart:async';

import 'package:kamusi/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<String> getSharedPreferenceStr(String prefKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(prefKey);
  }

  static Future<bool> isKamusidbLoaded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferenceKeys.AppDb_loaded);
  }

  static Future<void> setKamusidbLoaded(bool isKamusidbLoaded) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(
        SharedPreferenceKeys.AppDb_loaded, isKamusidbLoaded);
  }
}
