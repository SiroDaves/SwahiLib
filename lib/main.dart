import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/screens/splash_screen.dart';
import 'package:kamusi/screens/start_screen.dart';
import 'package:kamusi/utils/themes.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

/// The genesis of this great app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) return SplashScreen();

        return ChangeNotifierProvider<AppSettings>.value(
          value: AppSettings(snapshot.data),
          child: _MyApp(),
        );
      },
    );
  }
}

class _MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamusi',
      theme: Provider.of<AppSettings>(context).isDarkMode ? asDarkTheme : asLightTheme,
      home: new StartScreen(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
