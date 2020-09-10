import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kamusi/helpers/AppSettings.dart';
import 'package:kamusi/screens/BbSplash.dart';
import 'package:kamusi/screens/AppStart.dart';
import 'package:kamusi/utils/Themes.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) return BbSplash();

        return ChangeNotifierProvider<AppSettings>.value(
          value: AppSettings(snapshot.data),
          child: _MyApplication(),
        );
      },
    );
  }
}

class _MyApplication extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamusi',
      theme: Provider.of<AppSettings>(context).isDarkMode
          ? asDarkTheme
          : asLightTheme,
      home: new AppStart(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
