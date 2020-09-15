// This file declares the home screen of the app

import 'package:flutter/material.dart';
import 'package:kamusi/screens/GgDonate.dart';
import 'package:kamusi/screens/GgHelpDesk.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:kamusi/widgets/AsSearchGeneric.dart';
import 'package:kamusi/widgets/AsSearchNeno.dart';
import 'package:kamusi/widgets/AsNavDrawer.dart';

class DdHomeView extends StatefulWidget {
  DdHomeView();

  @override
  State<StatefulWidget> createState() {
    return DdHomeViewState();
  }
}

class DdHomeViewState extends State<DdHomeView> {
  final globalKey = new GlobalKey<ScaffoldState>();

  int _currentTabIndex = 0;
  List<String> blocks = [
    'Tafuta',
    //'Michezo',
    'Zaidi',
  ];

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: searchView()),
      //Center(child: Icon(Icons.group_work, size: 64.0, color: Colors.green)),
      Center(child: moreView()),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Tafuta')),
      //BottomNavigationBarItem(
      //   icon: Icon(Icons.group_work), title: Text('Michezo')),
      BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Zaidi')),
    ];

    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }

  Widget searchView() {
    AsNavDrawer navDrawer = AsNavDrawer();
    AsSearchNeno tabview1 = AsSearchNeno.getList();
    AsSearchGeneric tabview2 = AsSearchGeneric.getList(Texts.nahau);
    AsSearchGeneric tabview3 = AsSearchGeneric.getList(Texts.misemo);
    AsSearchGeneric tabview4 = AsSearchGeneric.getList(Texts.methali);

    final pageViews = <Widget>[
      Center(child: tabview1),
      Center(child: tabview2),
      Center(child: tabview3),
      Center(child: tabview4)
    ];
    final pageTabs = <Tab>[
      Tab(text: Texts.maneno.toUpperCase()),
      Tab(text: Texts.nahau.toUpperCase()),
      Tab(text: Texts.misemo.toUpperCase()),
      Tab(text: Texts.methali.toUpperCase())
    ];

    return DefaultTabController(
      length: pageTabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(Texts.appName),
            bottom: TabBar(tabs: pageTabs),
          ),
          body: TabBarView(children: pageViews)),
    );
  }

  Widget moreView() {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(Texts.appName),
      ),
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
