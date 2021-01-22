import 'package:flutter/material.dart';

import 'package:kamusi/widgets/as_search.dart';
import 'package:kamusi/views/main_view.dart';
import 'package:kamusi/models/word_model.dart';
import 'package:kamusi/helpers/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = new ScrollController();
  double offset = 0.0;

  SqliteHelper db = SqliteHelper();
  List<WordModel> itemList;

  void updateItemList() {
    final Future<Database> dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<WordModel>> wordListFuture = db.getWordList();
      wordListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
        });
      });
    });
  }

  Widget _header() => SliverAppBar(
    title: Container(child: AsSearch(scaffoldKey, itemList)),
    elevation: 0.0,
    automaticallyImplyLeading: false,
  );

  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = [];
      updateItemList();
    }

    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _header(),
          ];
        },
        body: MainView(scrollController: _scrollController),
      ),
    );

  }
}
