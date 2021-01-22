import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/utils/constants.dart';

class DonateScreen extends StatefulWidget {
  @override
  createState() => new DonateState();
}

class DonateState extends State<DonateScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tabPages = <Widget>[
      tabContent("donation1", LangStrings.donateTab1Content),
      tabContent("donation2", LangStrings.donateTab2Content),
      tabContent("donation3", LangStrings.donateTab3Content),
      tabContent("donation4", LangStrings.donateTab4Content),
    ];
    final tabTitles = <Tab>[
      Tab(text: LangStrings.donateTab1Title),
      Tab(text: LangStrings.donateTab2Title),
      Tab(text: LangStrings.donateTab3Title),
      Tab(text: LangStrings.donateTab4Title),
    ];

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: DefaultTabController(
        length: tabTitles.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(LangStrings.donateTabPage),
            bottom: TabBar(
              tabs: tabTitles,
            ),
          ),
          body: TabBarView(
            children: tabPages,
          ),
        ),
      ),
    );
  }

  Widget tabContent(String image, String strText) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: Provider.of<AppSettings>(context).isDarkMode
          ? BoxDecoration()
          : BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.cyan, Colors.indigo]),
            ),
      child: ListView(
        children: <Widget>[
          Card(
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image(
                image: new AssetImage("assets/images/" + image + ".png"),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  strText,
                  style: new TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
