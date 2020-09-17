import 'package:kamusi/views/GameView.dart';
import 'package:kamusi/views/SearchView.dart';
import 'package:kamusi/views/MoreView.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class DdHomeView extends StatefulWidget {
  @override
  _DdHomeViewState createState() => _DdHomeViewState();
}

class _DdHomeViewState extends State<DdHomeView> {
  int _currentIndex = 1;
  List<Widget> tabs = [MoreView(), SearchView(), GameView()];

  @override
  Widget build(BuildContext context) {
    ScreenSizes.height = MediaQuery.of(context).size.height;
    ScreenSizes.padding = MediaQuery.of(context).padding;
    ScreenSizes.devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        centerTitle: true,
        title: Text('Kamusi ya Kiswahili'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              pushSettingsScreen(context);
            },
          ),
        ],
      ),*/
      body: tabs[_currentIndex],
      bottomNavigationBar: FancyBottomNavigation(
        barHeight: 55,
        arcHeight: 50,
        arcWidth: 75,
        circleHeight: 50,
        initialSelection: 1,
        tabs: [
          TabData(iconData: Icons.settings, title: 'Zaidi'),
          TabData(iconData: Icons.search, title: 'Tafuta'),
          TabData(iconData: Icons.games, title: 'Michezo'),
        ],
        onTabChangedListener: (position) {
          setState(() {
            _currentIndex = position;
          });
        },
      ),
    );
  }
}

class ScreenSizes {
  static double height;
  static var padding;
  static double devicePixelRatio;
}
