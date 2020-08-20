import 'dart:math';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kamusi/helpers/SqliteHelper.dart';
import 'package:kamusi/models/NenoModel.dart';
import 'package:backdrop/backdrop.dart';
import 'package:kamusi/screens/FfSettingsQuick.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'package:share/share.dart';
import 'package:kamusi/utils/Constants.dart';

class EeNenoView extends StatefulWidget {
  final bool haschorus;
  final NenoModel neno;
  final String nenotitle;
  final String nenobook;

  EeNenoView(this.neno, this.haschorus, this.nenotitle, this.nenobook);

  @override
  State<StatefulWidget> createState() {
    return EeNenoViewState(
        this.neno, this.haschorus, this.nenotitle, this.nenobook);
  }
}

class EeNenoViewState extends State<EeNenoView> {
  EeNenoViewState(this.neno, this.haschorus, this.nenotitle, this.nenobook);
  final globalKey = new GlobalKey<ScaffoldState>();
  SqliteHelper db = SqliteHelper();

  var appBar = AppBar(), nenoVerses;
  String nenotitle, nenobook;
  bool haschorus;
  NenoModel neno;
  int curStanza = 0, curNeno = 0;
  List<String> verseTexts, verseTitles, verseInfos;
  String nenoTitle, nenoContent;

  void getListView() async {
    await setContent();
  }

  @override
  Widget build(BuildContext context) {
    curNeno = neno.id;
    nenoTitle = neno.title;
    nenoContent = neno.maana.replaceAll("\\n", "\n").replaceAll("''", "'");

    if (verseTexts == null) {
      verseInfos = List<String>();
      verseTitles = List<String>();
      verseTexts = List<String>();
      getListView();
    }
    bool isFavourited(int favorite) => favorite == 1 ?? false;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: BackdropScaffold(
        title: Text(nenotitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              isFavourited(neno.isfav) ? Icons.star : Icons.star_border,
            ),
            onPressed: () => favoriteNeno(),
          )
        ],
        iconPosition: BackdropIconPosition.action,
        headerHeight: 120,
        frontLayer: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Scaffold(
              key: globalKey,
              body: mainBody(),
              floatingActionButton: AnimatedFloatingActionButton(
                fabButtons: floatingButtons(),
                colorStartAnimation: Colors.deepOrange,
                colorEndAnimation: Colors.red,
                animatedIconData: AnimatedIcons.menu_close,
              ),
            ),
          ),
        ),
        backLayer: FfSettingsQuick(),
      ),
    );
  }

  Widget mainBody() {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: new Stack(
          children: <Widget>[
            nenoViewer(),
            nenoBook(),
          ],
        ),
      ),
    );
  }

  Widget nenoBook() {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 50,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 160),
      child: Center(
        child: Text(
          nenobook,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.deepOrange),
        ),
      ),
    );
  }

  Widget nenoViewer() {
    return VerticalTabs(
        tabsWidth: 50,
        contentScrollAxis: Axis.vertical,
        tabs: List<Tab>.generate(
          verseInfos.length,
          (int index) {
            return new Tab(text: verseInfos[index]);
          },
        ),
        contents: List<Widget>.generate(
          verseInfos.length,
          (int index) {
            return new Container(
              child: tabsContent(index),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover)),
            );
          },
        ));
  }

  double getFontSize(int characters, double height, double width) {
    height = height - 300;
    width = width - 100;
    return sqrt((height * width) / characters);
  }

  Widget tabsContent(int index) {
    var lines = verseTexts[index].split("\\n");
    String lyrics =
        verseTexts[index].replaceAll("\\n", "\n").replaceAll("''", "'");
    double nfontsize = getFontSize(lyrics.length,
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);

    return new Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 180,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Card(
              elevation: 2,
              child: new Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: new Text(
                    lyrics,
                    style: new TextStyle(fontSize: nfontsize),
                  ),
                ),
              )),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height - 215),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: new Column(
            children: <Widget>[
              new Center(
                child: new Container(
                  width: 200,
                  height: 50,
                  decoration: new BoxDecoration(
                      color: Colors.orangeAccent,
                      border: Border.all(color: Colors.orange),
                      boxShadow: [BoxShadow(blurRadius: 5)],
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(5))),
                  child: new Center(
                    child: new Text(
                      verseTitles[index],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> floatingButtons() {
    return <Widget>[
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.content_copy),
        tooltip: Tooltips.copyNeno,
        onPressed: copyNeno,
      ),
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.share),
        tooltip: Tooltips.shareNeno,
        onPressed: shareNeno,
      ),
    ];
  }

  Future<void> setContent() async {
    verseInfos = [];
    verseTitles = [];
    verseTexts = [];
    nenoVerses = neno.maana.split("\\n\\n");
    int verseCount = nenoVerses.length;

    if (haschorus) {
      String chorus = nenoVerses[1].toString().replaceAll("CHORUS\\n", "");

      verseInfos.add("1");
      verseInfos.add("C");
      verseTitles.add("VERSE 1 of " + (verseCount - 1).toString());
      verseTitles.add('CHORUS');
      verseTexts.add(nenoVerses[0]);
      verseTexts.add(chorus);

      try {
        for (int i = 2; i < verseCount; i++) {
          String verseno = i.toString();
          verseInfos.add(verseno);
          verseInfos.add("C");
          verseTitles
              .add('VERSE ' + verseno + ' of ' + (verseCount - 1).toString());
          verseTitles.add('CHORUS');
          verseTexts.add(nenoVerses[i]);
          verseTexts.add(chorus);
        }
      } catch (Exception) {}
    } else {
      try {
        for (int i = 0; i < verseCount; i++) {
          String verseno = (i + 1).toString();
          verseInfos.add(verseno);
          verseTitles.add('VERSE ' + verseno + ' of ' + verseCount.toString());
          verseTexts.add(nenoVerses[i]);
        }
      } catch (Exception) {}
    }
  }

  void copyNeno() {
    Clipboard.setData(ClipboardData(text: nenoTitle + "\n\n" + nenoContent));
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(SnackBarText.nenoCopied),
    ));
  }

  void shareNeno() {
    Share.share(
      nenoTitle + "\n\n" + nenoContent + "\n\nvia #Kamusi App",
      subject: "Share the neno: " + nenoTitle,
    );
  }

  void favoriteNeno() {
    if (neno.isfav == 1)
      db.favouriteNeno(neno, false);
    else
      db.favouriteNeno(neno, true);
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(nenoTitle + " " + SnackBarText.nenoLiked),
    ));
    //notifyListeners();
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
