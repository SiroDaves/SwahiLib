import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/utils/constants.dart';

class HelpDeskScreen extends StatefulWidget {
  @override
  createState() => new HelpDeskScreenState();
}

class HelpDeskScreenState extends State<HelpDeskScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tabPages = <Widget>[
      tabContent("help1", LangStrings.helpTab1Content),
      tabContent("help2", LangStrings.helpTab2Content),
      tabContent("help3", LangStrings.helpTab3Content),
    ];
    final tabTitles = <Tab>[
      Tab(text: LangStrings.helpTab1Title),
      Tab(text: LangStrings.helpTab2Title),
      Tab(text: LangStrings.helpTab3Title),
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
            title: Text(LangStrings.helpTabPage),
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
                height: 200.0,
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Html(
                  data: strText,
                  style: {
                    "html": Style(
                      fontSize: FontSize(30.0),
                    ),
                  },
                  onLinkTap: (url) => launchURL(url),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
