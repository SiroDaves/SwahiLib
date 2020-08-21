import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kamusi/models/NenoModel.dart';
import 'package:kamusi/helpers/SqliteHelper.dart';
import 'package:kamusi/screens/EeContentView.dart';
//import 'package:kamusi/utils/Preferences.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/widgets/AsProgressWidget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
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
  List< NenoModel> results;
  List<String> letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'V', 'W', 'Y', 'Z'];
  String letterSearch;

  @override
  Widget build(BuildContext context) {
    if (results == null) {
      results = [];
      updateSearchList();
    }

    return new Container(
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
                    itemBuilder: lettersListView,
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
            margin: EdgeInsets.only(top: 120),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: results.length,
              itemBuilder: itemListView,
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
        onChanged: (value) { searchNow(); },
      ),
    );
  }

  Widget lettersListView(BuildContext context, int index) {
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

  Widget itemListView(BuildContext context, int index) {
    String strContent = "<b>" + results[index].title + "</b>";
    if (results[index].visawe.length > 1)
    {
      strContent = strContent + " | visawe: <i>" + results[index].visawe + "</i>";
    }
    strContent = strContent + '<ul>';
    
    try {
        var strContents = results[index].maana.split("|");

        if (strContents.length > 1)
        {
          try {
            for (int i = 0; i < strContents.length; i++) {
              var strExtra = strContents[i].split(":");
              strContent = strContent + "<li>" + strExtra[0] + "</li>";
            }
          } catch (Exception) {}
        }
        else
        {
          var strExtra = strContents[0].split(":");
          strContent = strContent + "<li>" + strExtra[0] + "</li>";
        }
        strContent = strContent + '</ul><hr>';
        
        if (strContents.length == 0)
        {
          strContent = "";
        }
    }
    catch (Exception) {
        strContent = '';    
    }

    return Container(
      width: 50,
      child: GestureDetector(
        onTap: () {
          //navigateToNeno(results[index], nenoTitle,
          //    " Neno #" + results[index].number.toString() + " - " + nenobook);
        },
        child: new Stack(
          children: <Widget>[
            /*new Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                  nenoTitle,
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
      Future<List< NenoModel>> nenoListFuture = db.getNenoList();
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

  void navigateToNeno( NenoModel neno, String title, String nenobook) async {
    bool haschorus = false;
    /*if (neno.content.contains("CHORUS")) haschorus = true;
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EeContentView(neno, haschorus, title, nenobook);
    }));*/
  }
}

class BookItem<T> {
  bool isSelected = false;
  T data;
  BookItem(this.data);
}
