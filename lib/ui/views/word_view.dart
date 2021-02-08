// This file declares the content view screen

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

import '../../utils/colors.dart';
import '../../utils/app_utils.dart';
import '../../services/app_settings.dart';
import '../../data/app_database.dart';
import '../../data/models/word.dart';

/// Show a full View of a word meaning
class WordView extends StatefulWidget {
  final Word word;

  WordView(this.word);

  @override
  State<StatefulWidget> createState() {
    return WordViewState(this.word);
  }
}

class WordViewState extends State<WordView> {
  WordViewState(this.word);
  final globalKey = new GlobalKey<ScaffoldState>();
  AppDatabase db = AppDatabase();

  var appBar = AppBar(), wordVerses;
  Word word;
  int curWord = 0;
  String wordContent;
  List<String> meanings, synonyms;
  List<Word> words;

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
          title: Text(AppStrings.appName),
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
                  colors: [ColorUtils.white, Colors.cyan, Colors.indigo]),
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
                        ? ColorUtils.white
                        : ColorUtils.black),
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
          AppStrings.synonyms_for +
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
        tooltip: AppStrings.copyThis,
        onPressed: copyItem,
      ),
      FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.share),
        tooltip: AppStrings.shareThis,
        onPressed: shareItem,
      ),
    ];
  }

  void copyItem() {
    Clipboard.setData(ClipboardData(text: wordContent + AppStrings.campaign));
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(AppStrings.wordCopied),
    ));
  }

  void shareItem() {
    Share.share(
      wordContent + AppStrings.campaign,
      subject: "Shiriki word: " + word.title,
    );
  }

  void favoriteThis() {
    if (word.isfav == 1)
      db.favouriteWord(word, false);
    else
      db.favouriteWord(word, true);
    globalKey.currentState.showSnackBar(new SnackBar(
      content: new Text(word.title + " " + AppStrings.wordLiked),
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
