import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kamusi/helpers/AppSettings.dart';
import 'package:kamusi/screens/BbSplash.dart';
import 'package:kamusi/screens/AppStart.dart';
import 'package:kamusi/utils/Themes.dart';

void main() => runApp(new MyApplication());

class MyApplication extends StatelessWidget {
  const MyApplication({Key key}) : super(key: key);

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
  const _MyApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamusi',
      theme: Provider.of<AppSettings>(context).isDarkMode ? asDarkTheme : asLightTheme,
      home: new AppStart(),
    );
  }
}
