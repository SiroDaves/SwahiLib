import 'package:flutter/material.dart';
import 'package:kamusi/helpers/AppSettings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/models/GenericModel.dart';
import 'package:kamusi/helpers/SqliteHelper.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:kamusi/widgets/AsProgressWidget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class AsSearchGeneric extends StatefulWidget {
  final String table;
  AsSearchGeneric({this.table});

  @override
  createState() => AsSearchGenericState(table: this.table);

  static Widget getList(String table) {
    return new AsSearchGeneric(
      table: table,
    );
  }
}

class AsSearchGenericState extends State<AsSearchGeneric> {
  AsProgressWidget progressWidget =
      AsProgressWidget.getProgressWidget(LangStrings.somePatience);
  TextEditingController txtSearch = new TextEditingController(text: "");
  SqliteHelper db = SqliteHelper();

  AsSearchGenericState({this.table});
  Future<Database> dbFuture;
  List<GenericModel> results;
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
  String table;

  @override
  Widget build(BuildContext context) {
    if (results == null) {
      results = [];
      updateSearchList();
    }

    return new Container(
      decoration: Provider.of<AppSettings>(context).isDarkMode
          ? BoxDecoration()
          : BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
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
            hintText: LangStrings.searchNow + table,
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

    try {
      if (results[index].maana.length > 1) {
        strContent = strContent + '<ul>';
        var strContents = results[index].maana.split(";");

        if (strContents.length > 1) {
          try {
            for (int i = 0; i < strContents.length; i++) {
              var strExtra = strContents[i].split(":");
              strContent = strContent + "<li>" + strExtra[0].trim() + "</li>";
            }
          } catch (Exception) {}
        } else {
          var strExtra = strContents[0].split(":");
          strContent = strContent + "<li>" + strExtra[0].trim() + "</li>";
        }
        strContent = strContent + '</ul>';
      }
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
            },
          ),
        ),
      );
    } catch (Exception) {
      return Container();
    }
  }

  Widget listViewx(BuildContext context, int index) {
    String strContent = "<b>" + results[index].title + "</b><ul>";

    try {
      var strContents = results[index].maana.split("|");

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
      strContent = strContent + '</ul><hr>';

      if (strContents.length == 0) {
        strContent = "";
      }
    } catch (Exception) {
      strContent = '';
    }

    return Container(
      width: 50,
      child: GestureDetector(
        onTap: () {
          //navigateToGeneric(results[index], genericTitle,
          //    " Generic #" + results[index].number.toString() + " - " + genericbook);
        },
        child: new Stack(
          children: <Widget>[
            /*new Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                  genericTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
            ),*/
            new Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Html(
                data: strContent,
                style: {
                  "html": Style(
                    fontSize: FontSize(20.0),
                  ),
                  "ul": Style(
                    fontSize: FontSize(18.0),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateSearchList() {
    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<GenericModel>> genericListFuture = db.getGenericList(table);
      genericListFuture.then((resultList) {
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
        Future<List<GenericModel>> genericListFuture =
            db.getGenericSearch(table, txtSearch.text);
        genericListFuture.then((resultList) {
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

  void navigateToGeneric(
      GenericModel generic, String title, String genericbook) async {
    /*if (generic.content.contains("CHORUS")) haschorus = true;
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EeGenericView(generic, haschorus, title, genericbook);
    }));*/
  }
}

class BookItem<T> {
  bool isSelected = false;
  T data;
  BookItem(this.data);
}
