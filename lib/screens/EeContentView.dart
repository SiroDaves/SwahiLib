// This file declares the content view screen

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/helpers/AppSettings.dart';
import 'package:kamusi/helpers/SqliteHelper.dart';
import 'package:kamusi/models/NenoModel.dart';
import 'package:share/share.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class EeContentView extends StatefulWidget {
  final NenoModel neno;

  EeContentView(this.neno);

  @override
  State<StatefulWidget> createState() {
    return EeContentViewState(this.neno);
  }
}

class EeContentViewState extends State<EeContentView> {
  EeContentViewState(this.neno);
  final globalKey = new GlobalKey<ScaffoldState>();
  SqliteHelper db = SqliteHelper();

  var appBar = AppBar(), nenoVerses;
  NenoModel neno;
  int curNeno = 0;
  String nenoContent;
  List<String> meanings, synonyms;
  List<NenoModel> nenos;

  @override
  Widget build(BuildContext context) {
    curNeno = neno.id;
    nenoContent = neno.title + " ni neno la Kiswahili lenye maana:";
    bool isFavourited(int favorite) => favorite == 1 ?? false;

    if (meanings == null) {
      meanings = List<String>();
      synonyms = List<String>();
      processData();
    }

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        key: globalKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(LangStrings.appName),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                isFavourited(neno.isfav) ? Icons.star : Icons.star_border,
              ),
              onPressed: () => favoriteThis(),
            )
          ],
        ),
        body: mainBody(),
        floatingActionButton: AnimatedFloatingActionButton(
          fabButtons: floatingButtons(),
          animatedIconData: AnimatedIcons.menu_close,
        ),
      ),
    );
  }

  Widget mainBody() {
    return Container(
      decoration: Provider.of<AppSettings>(context).isDarkMode
          ? BoxDecoration()
          : BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.cyan, Colors.indigo]),
            ),
      child: new Stack(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Html(
              data: "<h3>" + neno.title + "</h3>",
              style: {
                "h3": Style(
                    fontSize: FontSize(30.0),
                    color: Provider.of<AppSettings>(context).isDarkMode
                        ? Colors.white
                        : Colors.black),
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.only(top: 60),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: meanings.length,
              itemBuilder: listView,
            ),
          ),
        ],
      ),
    );
  }

  Widget listView(BuildContext context, int index) {
    if (neno.visawe == meanings[index]) {
      nenoContent = nenoContent +
          LangStrings.visawe_vya +
          neno.title +
          " ni: " +
          neno.visawe;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Html(
          data: "<p><b>Visawe:</b> <i>" + neno.visawe + "</i></p>",
          style: {
            "p": Style(
              fontSize: FontSize(25.0),
            ),
          },
        ),
      );
    } else {
      var strContents = meanings[index].split(":");
      String strContent = meanings[index];

      if (strContents.length > 1) {
        strContent = strContents[0] + "<br>";
        strContent = strContent +
            "<p><b>Kwa mfano:</b> <i>" +
            strContents[1] +
            "</i></p>";

        nenoContent = nenoContent + "\n- " + strContents[0] + " kwa mfano: ";
        nenoContent = nenoContent + strContents[1];
      } else
        nenoContent = nenoContent + "\n - " + meanings[index];

      return Card(
        elevation: 2,
        child: GestureDetector(
          child: Html(
            data: "<ul><li>" + strContent + "</li></ul>",
            style: {
              "li": Style(
                fontSize: FontSize(25.0),
              ),
              "p": Style(
                fontSize: FontSize(22.0),
              ),
            },
          ),
        ),
      );
    }
  }

  List<Widget> floatingButtons() {
    return <Widget>[
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.content_copy),
        tooltip: LangStrings.copyThis,
        onPressed: copyItem,
      ),
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.share),
        tooltip: LangStrings.shareThis,
        onPressed: shareItem,
      ),
    ];
  }

  void copyItem() {
    Clipboard.setData(ClipboardData(text: nenoContent + LangStrings.campaign));
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(LangStrings.nenoCopied),
    ));
  }

  void shareItem() {
    Share.share(
      nenoContent + LangStrings.campaign,
      subject: "Shiriki neno: " + neno.title,
    );
  }

  void favoriteThis() {
    if (neno.isfav == 1)
      db.favouriteNeno(neno, false);
    else
      db.favouriteNeno(neno, true);
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(neno.title + " " + LangStrings.nenoLiked),
    ));
    //notifyListeners();
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void processData() async {
    nenoContent = neno.title;
    meanings = [];
    synonyms = [];

    try {
      String strMeaning = neno.maana;
      strMeaning = strMeaning.replaceAll("\\u201c", "");
      strMeaning = strMeaning.replaceAll("\\", "");
      strMeaning = strMeaning.replaceAll('"', '');

      var strMeanings = strMeaning.split("|");

      if (strMeanings.length > 1) {
        for (int i = 0; i < strMeanings.length; i++) {
          meanings.add(strMeanings[i]);
        }
      } else {
        meanings.add(strMeanings[0]);
      }
    } catch (Exception) {}
    if (neno.visawe.length > 1) meanings.add(neno.visawe);

    try {
      var strSynonyms = neno.maana.split("|");

      if (strSynonyms.length > 1) {
        for (int i = 0; i < strSynonyms.length; i++) {
          synonyms.add(strSynonyms[i]);
        }
      } else {
        synonyms.add(strSynonyms[0]);
      }
    } catch (Exception) {}
  }
}
