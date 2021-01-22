import 'package:flutter/material.dart';

import 'package:kamusi/screens/search_screen.dart';
import 'package:kamusi/screens/favourite_screen.dart';
import 'package:kamusi/screens/trivia/trivia_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.star), text: 'VIPENDWA'),
    Tab(icon: Icon(Icons.search), text: 'TAFUTA'),
    Tab(icon: Icon(Icons.help), text: 'TRIVIA'),
  ];

  List<Widget> _kTabPages = [FavouriteScreen(), SearchScreen(), TriviaScreen()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
