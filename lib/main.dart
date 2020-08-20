import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kamusi/helpers/MyAppSettings.dart';
import 'package:kamusi/screens/AppSplash.dart';
import 'package:kamusi/screens/AppStart.dart';
import 'package:kamusi/utils/Themes.dart';

void main() => runApp(new Songbook());

class Songbook extends StatelessWidget {
  const Songbook({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) {
          return AppSplash();
        }
        return ChangeNotifierProvider<MyAppSettings>.value(
          value: MyAppSettings(snapshot.data),
          child: _Songbook(),
        );
      },
    );
  }
}

class _Songbook extends StatelessWidget {
  const _Songbook({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamusi',
      theme: Provider.of<MyAppSettings>(context).isDarkMode ? asDarkTheme : asLightTheme,
      home: new AppStart(),
    );
  }
}
