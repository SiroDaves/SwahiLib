import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kamusi/models/NenoModel.dart';
import 'package:kamusi/helpers/SqliteHelper.dart';
import 'package:kamusi/screens/EeContentView.dart';
//import 'package:kamusi/utils/Preferences.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:kamusi/widgets/AsProgressWidget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class AsSearchNeno extends StatefulWidget {
  AsSearchNeno();

  @override
  createState() => AsSearchNenoState();

  static Widget getList() {
    return new AsSearchNeno();
  }
}

class AsSearchNenoState extends State<AsSearchNeno> {
  AsProgressWidget progressWidget =
      AsProgressWidget.getProgressWidget(AsProgressDialogTitles.somePatience);
  TextEditingController txtSearch = new TextEditingController(text: "");
  SqliteHelper db = SqliteHelper();

  AsSearchNenoState();
  Future<Database> dbFuture;
  List<NenoModel> results;
  List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'Y',
    'Z'
  ];
  String letterSearch;

  @override
  Widget build(BuildContext context) {
    if (results == null) {
      results = [];
      updateSearchList();
    }

    return new Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.1,
              0.4,
              0.6,
              0.9
            ],
            colors: [
              Colors.black,
              Colors.blue[900],
              Colors.blue,
              Colors.blue[200]
            ]),
      ),
      child: new Stack(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: new Column(
              children: <Widget>[
                searchBox(),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: letters.length,
                    itemBuilder: lettersView,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: progressWidget,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.only(top: 110),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: results.length,
              itemBuilder: listView,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return new Card(
      elevation: 2,
      child: new TextField(
        controller: txtSearch,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.clear),
            hintText: Texts.searchNow + 'maneno',
            hintStyle: TextStyle(fontSize: 18)),
        onChanged: (value) {
          searchNow();
        },
      ),
    );
  }

  Widget lettersView(BuildContext context, int index) {
    return Container(
      width: 50,
      child: GestureDetector(
        onTap: () {
          setSearchingLetter(letters[index]);
        },
        child: Card(
          elevation: 5,
          child: Hero(
            tag: letters[index],
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Center(
                child: Text(
                  letters[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listView(BuildContext context, int index) {
    String strContent = "<b>" + results[index].title + "</b>";
    String strMeaning = results[index].maana;

    try {
      if (strMeaning.length == 0) {
        return Container();
      } else {
        strMeaning = strMeaning.replaceAll("\\u201c", "");
        strMeaning = strMeaning.replaceAll("\\", "");
        strMeaning = strMeaning.replaceAll('"', '');

        strContent = strContent + '<ul>';
        var strContents = strMeaning.split("|");

        if (strContents.length > 1) {
          try {
            for (int i = 0; i < strContents.length; i++) {
              var strExtra = strContents[i].split(":");
              strContent = strContent + "<li>" + strExtra[0] + "</li>";
            }
          } catch (Exception) {}
        } else {
          var strExtra = strContents[0].split(":");
          strContent = strContent + "<li>" + strExtra[0] + "</li>";
        }
        strContent = strContent + '</ul>';
        if (results[index].visawe.length > 1)
          strContent = strContent +
              "<br><p><b>Visawe:</b> <i>" +
              results[index].visawe +
              "</i></p>";

        return Card(
          elevation: 2,
          child: GestureDetector(
            child: Html(
              data: strContent,
              style: {
                "html": Style(
                  fontSize: FontSize(20.0),
                ),
                "ul": Style(
                  fontSize: FontSize(18.0),
                ),
                "p": Style(
                  fontSize: FontSize(18.0),
                  margin: EdgeInsets.only(left: 25, top: 10),
                ),
              },
            ),
            onTap: () {
              navigateToNeno(results[index]);
            },
          ),
        );
      }
    } catch (Exception) {
      return Container();
    }
  }

  void updateSearchList() {
    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<NenoModel>> nenoListFuture = db.getNenoList();
      nenoListFuture.then((resultList) {
        setState(() {
          results = resultList;
          progressWidget.hideProgress();
        });
      });
    });
  }

  void searchNow() {
    String searchThis = txtSearch.text;
    if (searchThis.length > 0) {
      results.clear();
      dbFuture = db.initializeDatabase();
      dbFuture.then((database) {
        Future<List<NenoModel>> nenoListFuture =
            db.getNenoSearch(txtSearch.text);
        nenoListFuture.then((resultList) {
          setState(() {
            results = resultList;
          });
        });
      });
    } else {
      updateSearchList();
    }
  }

  void setSearchingLetter(String _letter) {
    letterSearch = _letter;
    results.clear();
    updateSearchList();
  }

  void navigateToNeno(NenoModel neno) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EeContentView(neno);
    }));
  }
}

class BookItem<T> {
  bool isSelected = false;
  T data;
  BookItem(this.data);
}
