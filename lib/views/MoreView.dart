import 'package:flutter/material.dart';
import 'package:kamusi/screens/GgDonate.dart';
import 'package:kamusi/screens/GgHelpDesk.dart';

class MoreView extends StatefulWidget {
  @override
  _MoreViewState createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
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
