import 'package:flutter/material.dart';

class GgDonate extends StatefulWidget {
  @override
  createState() => new GgDonateState();
}

class GgDonateState extends State<GgDonate> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tabPages = <Widget>[
      tabContent("mpesa", "PAYBILL: 891300\n\nAKAUNTI: 34489"),
      tabContent("equitel", "NAMBARI YA BIASHARA:\n\t891300\n\nAKAUNTI: 33112"),
      tabContent("airtel", "JINA LA BIASHARA:\n\tMCHANGA\n\nAKAUNTI: 33112"),
      tabContent("paypal", "ANWANI:\n\ttunaboresha [at] gmail.com"),
    ];
    final tabTitles = <Tab>[
      Tab(text: 'M-Pesa'),
      Tab(text: 'Equitel'),
      Tab(text: 'Airtel'),
      Tab(text: 'PayPal'),
    ];

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: DefaultTabController(
        length: tabTitles.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tuunge Mkono, Changia'),
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
                image:
                    new AssetImage("assets/images/donation_" + image + ".png"),
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
