import 'package:flutter/material.dart';
import 'package:anisi_controls/anisi_bottom_navigation.dart';

import 'package:kamusi/screens/games.dart';
import 'package:kamusi/screens/search.dart';
import 'package:kamusi/screens/favourites.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    ScreenSizes.height = MediaQuery.of(context).size.height;
    ScreenSizes.padding = MediaQuery.of(context).padding;
    ScreenSizes.devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    List<Widget> tabs = [Favourites(), Search(), Games()];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabs[_currentIndex],
      bottomNavigationBar: AnisiBottomNavigation(
        barHeight: 55,
        arcHeight: 50,
        arcWidth: 75,
        circleHeight: 50,
        initialSelection: 1,
        tabs: [
          TabData(iconData: Icons.star, title: 'VIPENDWA'),
          TabData(iconData: Icons.search, title: 'TAFUTA'),
          TabData(iconData: Icons.games, title: 'MICHEZO'),
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
