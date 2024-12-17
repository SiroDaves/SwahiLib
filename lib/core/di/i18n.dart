import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations get tr => _tr!; // helper function to avoid typing '!' all the time
AppLocalizations? _tr; // global variable 

class AppTranslations {
  static void init(BuildContext context) {
    _tr = AppLocalizations.of(context);
  }
}