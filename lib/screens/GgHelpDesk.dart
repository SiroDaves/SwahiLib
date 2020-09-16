import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

class GgHelpDesk extends StatefulWidget {
  @override
  createState() => new GgHelpDeskState();
}

class GgHelpDeskState extends State<GgHelpDesk> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tabPages = <Widget>[
      tabContent("support",
          "<p>SIMU: +2547 - </p><hr><p>BARUA PEPE: <a href=\"mailto:tunaboresha@gmail.com\">tunaboresha@gmail.com</a> </p><hr> <p>TOVUTI: <a href=\"https://kazibora.github.io\">kazibora.github.io</a></p>"),
      tabContent("review",
          "Iwapo unafurahia kitumizi (app) chetu au haufurahii tafadhali tujulishe kwa kuacha review yako kwenye <a href=\"play.google.com/store/apps/details?id=com.kazibora.kamusi\">Google Play Store</a>"),
      tabContent("github",
          "Iwapo wewe ni Msanidi Kitumizi (App Developer), source code ya kitumizi hiki yapatikana bila malipo kwenye GitHub:</br></br> <a href=\"Https://github.com/kazibora/kamusi\">github.com/kazibora/kamusi</a>"),
    ];
    final tabTitles = <Tab>[
      Tab(text: 'Wasiliana'),
      Tab(text: 'Reviews'),
      Tab(text: 'Open Source'),
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
            title: Text('Usaidizi'),
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
      decoration: BoxDecoration(
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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch URL');
    }
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
