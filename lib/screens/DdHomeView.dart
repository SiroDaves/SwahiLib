// This file declares the home screen of the app

import 'package:flutter/material.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:kamusi/widgets/AsSearchGeneric.dart';
import 'package:kamusi/widgets/AsSearchNeno.dart';

class DdHomeView extends StatefulWidget {
	DdHomeView();

	@override
  State<StatefulWidget> createState() {
    return DdHomeViewState();
  }
}

class DdHomeViewState extends State<DdHomeView> {
	DdHomeViewState();  
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          bottom: TabBar( tabs: pageTabs ),
        ),
        body: TabBarView( children: pageViews ),
      ),
    );
  }

}
