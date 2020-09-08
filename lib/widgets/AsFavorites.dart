import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kamusi/models/NenoModel.dart';
import 'package:kamusi/helpers/SqliteHelper.dart';
import 'package:kamusi/screens/EeContentView.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:kamusi/widgets/AsProgressWidget.dart';

class AsFavorites extends StatefulWidget {
  @override
  createState() => AsFavoritesState();
}

class AsFavoritesState extends State<AsFavorites> {
  AsProgressWidget progressWidget =
      AsProgressWidget.getProgressWidget(AsProgressDialogTitles.somePatience);
  TextEditingController txtSearch = new TextEditingController(text: "");
  SqliteHelper db = SqliteHelper();

  Future<Database> dbFuture;
  List<NenoModel> nenos;

  @override
  Widget build(BuildContext context) {
    if (nenos == null) {
      nenos = [];
      updateNenoList();
    }
    return new Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover)),
      child: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: new Column(
              children: <Widget>[
                searchBox(),
                //searchCriteria(),
              ],
            ),
          ),
          Container(
            //height: MediaQuery.of(context).size.height - 150,
            height: MediaQuery.of(context).size.height - 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: progressWidget,
          ),
          Container(
            //height: MediaQuery.of(context).size.height - 150,
            height: MediaQuery.of(context).size.height - 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            //margin: EdgeInsets.only(top: 130),
            margin: EdgeInsets.only(top: 60),

            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: nenos.length,
              itemBuilder: nenoListView,
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
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: Texts.searchNow,
            hintStyle: TextStyle(fontSize: 18)),
        onChanged: (value) {
          searchNeno();
        },
      ),
    );
  }

  Widget nenoListView(BuildContext context, int index) {
    int category = nenos[index].id;
    String nenobook = "";
    String nenoTitle = nenos[index].title;

    var verses = nenos[index].maana.split("\\n\\n");
    var nenoConts = nenos[index].maana.split("\\n");
    String nenoContent = nenoConts[0] + ' ' + nenoConts[1] + " ...";

    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(nenoTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(nenoContent, style: TextStyle(fontSize: 18)),
        onTap: () {
          //navigateToNeno(nenos[index], nenoTitle,
          //    "Neno #" + nenos[index].number.toString() + " - " + nenobook);
        },
      ),
    );
  }

  void updateNenoList() {
    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<NenoModel>> nenoListFuture = db.getFavorites();
      nenoListFuture.then((nenoList) {
        setState(() {
          nenos = nenoList;
          progressWidget.hideProgress();
        });
      });
    });
  }

  void searchNeno() {
    String searchThis = txtSearch.text;
    if (searchThis.length > 0) {
      nenos.clear();
      dbFuture = db.initializeDatabase();
      dbFuture.then((database) {
        Future<List<NenoModel>> nenoListFuture =
            db.getFavSearch(txtSearch.text);
        nenoListFuture.then((nenoList) {
          setState(() {
            nenos = nenoList;
          });
        });
      });
    } else
      updateNenoList();
  }

  void navigateToNeno(NenoModel neno, String title, String nenobook) async {
    bool haschorus = false;
    if (neno.maana.contains("CHORUS")) haschorus = true;
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      //return EeContentView(neno, haschorus, title, nenobook);
    }));
  }
}
