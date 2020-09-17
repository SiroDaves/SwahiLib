import 'package:flutter/material.dart';
import 'package:kamusi/screens/GgDonate.dart';
import 'package:kamusi/screens/GgHelpDesk.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/helpers/AppSettings.dart';

class MoreView extends StatefulWidget {
  @override
  _MoreViewState createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kamusi ya Kiswahili'),
      ),
      body: ListView(
        children: <Widget>[
          Consumer<AppSettings>(builder: (context, AppSettings settings, _) {
            return ListTile(
              onTap: () {},
              leading: Icon(settings.isDarkMode
                  ? Icons.brightness_4
                  : Icons.brightness_7),
              title: Text('Mandhari Meusi'),
              trailing: Switch(
                onChanged: (bool value) => settings.setDarkMode(value),
                value: settings.isDarkMode,
              ),
            );
          }),
          Divider(),
          ListTile(
              leading: Icon(Icons.card_membership),
              title: Text('Tuunge Mkono'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GgDonate();
                }));
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.help),
              title: Text('Usaidizi'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GgHelpDesk();
                }));
              }),
          Divider(),
        ],
      ),
    );
  }
}
