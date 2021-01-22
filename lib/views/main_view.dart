import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/widgets/as_tab_bar.dart';
import 'package:kamusi/views/tab_view_word.dart';
import 'package:kamusi/views/tab_view_generic.dart';
import 'package:kamusi/models/page.dart';

List<AsPage> _allPages = <AsPage>[
  AsPage(title: LangStrings.words, content: LangStrings.wordsTable, category: 'category-name'),
  AsPage(title: LangStrings.sayings, content: LangStrings.sayingsTable, category: 'category-name'),
  AsPage(title: LangStrings.idioms, content: LangStrings.idiomsTable, category: 'category-name'),
  AsPage(title: LangStrings.proverbs, content: LangStrings.proverbsTable, category: 'category-name'),
];

class MainView extends StatefulWidget {
  MainView({this.scrollController});

  final ScrollController scrollController;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  TabController _controller;

  Key _key = new PageStorageKey({});
  double _offset = 0.0;
  double _newOffset = 0.0;

  void _scrollListener() {
    if (widget.scrollController.position.extentAfter == 0.0) {
      _newOffset = 25.0;
      if (Platform.isIOS) {
        _newOffset = 35.0;
      }
    } else {
      _newOffset = 0.0;
    }
    setState(() {
      _offset = _newOffset;
    });
  }

  @override
  void initState() {
    _controller = new TabController(vsync: this, length: _allPages.length);
    widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  Widget build(BuildContext context) {
    final List<Widget> tabChildernPages = <Widget>[];
    _allPages.forEach((AsPage page)
    {
      if (page.title == LangStrings.wordsTable) tabChildernPages.add(TabViewWord());
      else tabChildernPages.add(TabViewGeneric(page.content));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: _offset),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        AsTabBar(_controller, _allPages),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Stack(              
              children: <Widget>[
                TabBarView(
                  key: _key,
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: tabChildernPages,
                ),
              ]
            ),
          ),
        ),
      ],
    );
  }
}
