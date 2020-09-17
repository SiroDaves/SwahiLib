import 'package:flutter/material.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:kamusi/widgets/AsSearchGeneric.dart';
import 'package:kamusi/widgets/AsSearchNeno.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  AsSearchNeno tabview1 = AsSearchNeno.getList();
  AsSearchGeneric tabview2 = AsSearchGeneric.getList(LangStrings.nahau);
  AsSearchGeneric tabview3 = AsSearchGeneric.getList(LangStrings.misemo);
  AsSearchGeneric tabview4 = AsSearchGeneric.getList(LangStrings.methali);

  @override
  Widget build(BuildContext context) {
    final pageViews = <Widget>[
      Center(child: tabview1),
      Center(child: tabview2),
      Center(child: tabview3),
      Center(child: tabview4)
    ];
    final pageTabs = <Tab>[
      Tab(text: LangStrings.maneno.toUpperCase()),
      Tab(text: LangStrings.nahau.toUpperCase()),
      Tab(text: LangStrings.misemo.toUpperCase()),
      Tab(text: LangStrings.methali.toUpperCase())
    ];

    return DefaultTabController(
      length: pageTabs.length,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(LangStrings.appName),
            bottom: TabBar(tabs: pageTabs),
          ),
          body: TabBarView(children: pageViews)),
    );
  }
}
