import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anisi_controls/anisi_controls.dart';

import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/helpers/sqlite_helper.dart';
import 'package:kamusi/models/word_model.dart';
import 'package:kamusi/views/word_item.dart';
import 'package:kamusi/helpers/app_settings.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  FavouriteScreenState createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen> {
  AsLoader loader = AsLoader.setUp(ColorUtils.primaryColor);
  AsInformer notice = AsInformer.setUp(3, LangStrings.nothing, Colors.red, Colors.transparent, Colors.white, 10);
  
  SqliteHelper db = SqliteHelper();

  Future<Database> dbFuture;
  List<WordModel> items = List<WordModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Method to run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
    loadListView();
  }
  
  void loadListView() async {
    loader.showWidget();

    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<WordModel>> itemListFuture = db.getFavorites();
      itemListFuture.then((resultList) {
        setState(() {
          items = resultList;
          loader.hideWidget();
          if (items.length == 0) notice.showWidget();
          else notice.hideWidget();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LangStrings.favourited),
      ),
      body: mainBody(),
    );
  }

  Widget mainBody()
  {
    return Container(
      decoration: Provider.of<AppSettings>(context).isDarkMode ? BoxDecoration()
          : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [ 0.1, 0.4, 0.6, 0.9 ],
                colors: [ Colors.black, Colors.blue[900],  Colors.blue, Colors.blue[200] ]),
            ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return WordItem('ItemLiked_' + items[index].id.toString(), items[index], context);
              }
            ),
          ),
          Container(
            height: 200,
            child: notice,
          ),
          Container(
            height: 200,
            child: Center(
              child: loader,
            ),
          ),
        ],
      ),
    );
  }
  
}
