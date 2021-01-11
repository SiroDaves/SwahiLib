import 'package:flutter/material.dart';

import 'package:kamusi/screens/search.dart';
import 'package:kamusi/screens/favourites.dart';
import 'package:kamusi/screens/trivia/trivia.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.star), text: 'VIPENDWA'),
    Tab(icon: Icon(Icons.search), text: 'TAFUTA'),
    Tab(icon: Icon(Icons.help), text: 'TRIVIA'),
  ];

  List<Widget> _kTabPages = [Favourites(), Search(), Trivia()];

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
