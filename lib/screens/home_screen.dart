import 'package:flutter/material.dart';

import 'package:kamusi/screens/search_screen.dart';
import 'package:kamusi/screens/favourite_screen.dart';
import 'package:kamusi/screens/trivia/trivia_screen.dart';
import 'package:kamusi/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> _kTabPages = [
    SearchScreen(),
    FavouriteScreen(),
    //HistoryScreen(), 
    TriviaScreen(),    
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
      initialIndex: 0,
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
      bottomNavigationBar: bottomNavigation(),
    );
  }

  
  Widget bottomNavigation()
  {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _tabController.index,
      selectedItemColor: ColorUtils.baseColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem( icon: Icon(Icons.home), label: 'Home' ),
        BottomNavigationBarItem( icon: Icon(Icons.star), label: 'Favourites' ),
        //BottomNavigationBarItem( icon: Icon(Icons.history), label: 'Recent' ),
        BottomNavigationBarItem( icon: Icon(Icons.help), label: 'Trivia' ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

}
