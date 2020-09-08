import 'package:flutter/material.dart';
import 'package:kamusi/screens/GgDonate.dart';
import 'package:kamusi/screens/GgHelpDesk.dart';

class AsNavDrawer extends StatefulWidget {
  @override
  createState() => new AsNavDrawerState();
}

class AsNavDrawerState extends State<AsNavDrawer> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    didChangeDependencies();

    return new ListView(
      children: <Widget>[
        drawerHeader(),
        ListTile(
            leading: Icon(Icons.card_membership),
            title: Text('Tuunge Mkono'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GgDonate();
              }));
            }),
        ListTile(
            leading: Icon(Icons.help),
            title: Text('Usaidizi'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GgHelpDesk();
              }));
            }),
      ],
    );
  }

  Widget drawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Kamusi v1.6.0'),
      accountEmail: Text("Kiswahili Kitukuzwe"),
      currentAccountPicture: CircleAvatar(
        child: new Image(
          image: new AssetImage("assets/images/appicon.png"),
          height: 70,
          width: 70,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
