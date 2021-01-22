// This file declares the content view screen

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/helpers/sqlite_helper.dart';
import 'package:kamusi/models/word_model.dart';

class WordViewScreen extends StatefulWidget {
  final WordModel word;

  WordViewScreen(this.word);

  @override
  State<StatefulWidget> createState() {
    return EeWordViewScreenState(this.word);
  }
}

class EeWordViewScreenState extends State<WordViewScreen> {
  EeWordViewScreenState(this.word);
  final globalKey = new GlobalKey<ScaffoldState>();
  SqliteHelper db = SqliteHelper();

  var appBar = AppBar(), wordVerses;
  WordModel word;
  int curWord = 0;
  String wordContent;
  List<String> meanings, synonyms;
  List<WordModel> words;

  @override
  Widget build(BuildContext context) {
    curWord = word.id;
    wordContent = word.title + " ni word la Kiswahili lenye meaning:";
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
                isFavourited(word.isfav) ? Icons.star : Icons.star_border,
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
              data: "<h3>" + word.title + "</h3>",
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
    if (word.synonyms == meanings[index]) {
      wordContent = wordContent +
          LangStrings.synonyms_for +
          word.title +
          " ni: " +
          word.synonyms;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Html(
          data: "<p><b>Visawe:</b> <i>" + word.synonyms + "</i></p>",
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

        wordContent = wordContent + "\n- " + strContents[0] + " kwa mfano: ";
        wordContent = wordContent + strContents[1];
      } else
        wordContent = wordContent + "\n - " + meanings[index];

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
    Clipboard.setData(ClipboardData(text: wordContent + LangStrings.campaign));
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(LangStrings.wordCopied),
    ));
  }

  void shareItem() {
    Share.share(
      wordContent + LangStrings.campaign,
      subject: "Shiriki word: " + word.title,
    );
  }

  void favoriteThis() {
    if (word.isfav == 1)
      db.favouriteWord(word, false);
    else
      db.favouriteWord(word, true);
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(word.title + " " + LangStrings.wordLiked),
    ));
    //notifyListeners();
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void processData() async {
    wordContent = word.title;
    meanings = [];
    synonyms = [];

    try {
      String strMeaning = word.meaning;
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
    if (word.synonyms.length > 1) meanings.add(word.synonyms);

    try {
      var strSynonyms = word.meaning.split("|");

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
