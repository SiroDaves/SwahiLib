import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:kamusi/screens/FfSettingsQuick.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'package:kamusi/utils/Constants.dart';

class GgHelpDesk extends StatefulWidget {
  @override
  createState() => new GgHelpDeskState();
}

class GgHelpDeskState extends State<GgHelpDesk> {
  final globalKey = new GlobalKey<ScaffoldState>();
  List<String> titles, details, images;

  Future<void> setContent() async {
    titles = [];
    details = [];
    images = [];

    titles.add("Support");
    titles.add("App Reviews");
    titles.add("Open Source");

    images.add("support");
    images.add("review");
    images.add("github");

    details.add(
        "SIMU: +2547 -\nBARUA PEPE: tunaboresha [at] gmail.com\nTOVUTI: https://kazibora.github.io");
    details.add(
        "Iwapo unafurahia kitumizi (app) chetu au haufurahii tafadhali tujulishe kwa kuacha review yako kwenye Google Play Store");
    details.add(
        "Iwapo wewe ni Msanidi Kitumizi (App Developer), source code ya kitumizi hiki yapatikana bila malipo kwenye GitHub:\n\n Https://GitHub.com/Kazibora/Kamusi");
  }

  @override
  Widget build(BuildContext context) {
    if (titles == null) {
      titles = List<String>();
      details = List<String>();
      images = List<String>();
      setContent();
    }

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: BackdropScaffold(
        title: Text('Usaidizi'),
        iconPosition: BackdropIconPosition.action,
        headerHeight: 120,
        frontLayer: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Scaffold(
              key: globalKey,
              body: Center(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: bodyView(),
                ),
              ),
            ),
          ),
        ),
        backLayer: FfSettingsQuick(),
      ),
    );
  }

  Widget bodyView() {
    return VerticalTabs(
        tabsWidth: 100,
        contentScrollAxis: Axis.vertical,
        tabs: List<Tab>.generate(
          titles.length,
          (int index) {
            return new Tab(
                child: Text(
              titles[index],
              style: new TextStyle(fontSize: 20),
            ));
          },
        ),
        contents: List<Widget>.generate(
          titles.length,
          (int index) {
            return new Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.cyan, Colors.indigo]),
              ),
              child: new Container(
                  height: MediaQuery.of(context).size.height - 180,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Card(
                    elevation: 5,
                    child: new Column(
                      children: <Widget>[
                        Image(
                          image: new AssetImage(
                              "assets/images/" + images[index] + ".png"),
                          height: 150.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            details[index],
                            style: new TextStyle(fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          },
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
