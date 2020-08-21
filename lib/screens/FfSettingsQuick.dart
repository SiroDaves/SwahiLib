import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/helpers/AppSettings.dart';

class FfSettingsQuick extends StatelessWidget {
  const FfSettingsQuick({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.build),
          title: Text("Quick Settings"),
          subtitle: Text("Manage your preferences"),
        ),
        Consumer<AppSettings>(builder: (context, AppSettings settings, _) {
          return ListTile(
            onTap: () {},
            leading: Icon( settings.isDarkMode ? Icons.brightness_4 : Icons.brightness_7),
            title: Text('Dark mode'),
            trailing: Switch(
              onChanged: (bool value) => settings.setDarkMode(value),
              value: settings.isDarkMode,
            ),
          );
        }),
      ],
    );
  }
}
