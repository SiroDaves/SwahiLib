import 'package:flutter/material.dart';
import 'package:kamusi/models/page.dart';

class AsTabBar extends StatelessWidget {
  final TabController _controller;
  final List<AsPage> _allPages;
  AsTabBar(this._controller, this._allPages);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      margin: EdgeInsets.only(bottom: 5.0),
      child: TabBar(
        labelStyle: TextStyle(fontSize: 12.0),
        controller: _controller,
        isScrollable: true,
        indicatorColor: Colors.white,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        tabs: _allPages.map((AsPage page) {
          return Tab(
            text: page.title.toUpperCase(),
          );
        }).toList(),
      ),
    );
  }
}
