import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:kamusi/screens/FfSettingsQuick.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'package:kamusi/utils/Constants.dart';

class GgDonate extends StatefulWidget {
  @override
  createState() => new GgDonateState();
}

class GgDonateState extends State<GgDonate> {
  final globalKey = new GlobalKey<ScaffoldState>();
  List<String> titles, details, images;

  Future<void> setContent() async {
    titles = [];
    details = [];
    images = [];

    titles.add("M-Pesa");
    titles.add("Equitel");
    titles.add("Airtel");
    titles.add("PayPal");
    titles.add("VisaCard");

    images.add("mpesa");
    images.add("equitel");
    images.add("airtel");
    images.add("paypal");
    images.add("visa_mastercard");

    details.add(
        "BONYEZA:\n* 483 * 57 * 33112 #\n\n\n\nPAYBILL: 891300\n\nAKAUNTI: 33112");
    details.add("BUSINESS NUMBER: 891300\n\nAKAUNTI: 33112");
    details.add("BUSINESS NAME: MCHANGA\n\nREFERENCE: 33112");
    details.add("ADDRESS:\n\ttunaboresha [at] gmail.com");
    details.add("Itakuwa tayari hivi karibuni");
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
        title: Text('Tuunge Mkono, Changia'),
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
                          image: new AssetImage("assets/images/donation_" +
                              images[index] +
                              ".png"),
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
