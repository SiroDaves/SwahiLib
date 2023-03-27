import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import 'theme/theme_data.dart';
import 'util/i10n/app_localizations.dart';

L _getLocale<L>(BuildContext context) => AppLocalizations.of(context) as L;

T _getTheme<T>(BuildContext context) => AppTheme.of(context) as T;

Future<void> initArchitecture() async {
  await OsInfo.init();
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}
