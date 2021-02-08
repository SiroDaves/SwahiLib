// This file declares the database initialization screen

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anisi_controls/anisi_controls.dart';

import '../../data/callbacks/ItemCallback.dart';
import '../../data/callbacks/WordCallback.dart';
import '../../data/models/item.dart';
import '../../data/models/word.dart';
import '../../data/asset_database.dart';
import '../../data/app_database.dart';
import '../../utils/app_utils.dart';
import '../../utils/db_utils.dart';
import '../../utils/colors.dart';
import '../../utils/preferences.dart';
import 'start_screen.dart';

class InitLoadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitLoadState();
  }
}

class InitLoadState extends State<InitLoadScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();
  
  AsLineProgress progress = AsLineProgress.setUp(0, ColorUtils.black, ColorUtils.black, ColorUtils.secondaryColor);
  AsInformer informer = AsInformer.setUp(1, AppStrings.gettingReady, ColorUtils.primaryColor, Colors.transparent, ColorUtils.white, 10);
  
  AppDatabase appDB = AppDatabase();
  AssetDatabase assetDB = AssetDatabase();

  List<WordCallback> words =List<WordCallback>();
  List<ItemCallback> idiomsList =List<ItemCallback>();
  List<ItemCallback> sayingsList =List<ItemCallback>();
  List<ItemCallback> proverbsList =List<ItemCallback>();

  Future<Database> dbAssets;
  Future<Database> dbFuture;

  double mHeight, mWidth;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
    informer.showWidget();
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: mainBody(),
    );
  }

  Widget mainBody() {
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.jpg"),
          fit: BoxFit.cover)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: mWidth / 1.125,
              margin: EdgeInsets.only(top: mHeight / 2.52),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: progress,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: mHeight / 7.56),
              child: Center(
                child: informer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void requestData() async {
    dbAssets = assetDB.initializeDatabase();
    dbAssets.then((database) {
      Future<List<WordCallback>> wordListAsset = assetDB.getWordList();
      wordListAsset.then((itemsList) {
        setState(() {
          words = itemsList;
          requestIdiomsData();
        });
      });
    });
  }

  void requestIdiomsData() async {
    dbAssets = assetDB.initializeDatabase();
    dbAssets.then((database) {
      Future<List<ItemCallback>> idiomsListAsset = assetDB.getItemList(DbUtils.idiomsTable);
      idiomsListAsset.then((itemsList) {
        setState(() {
          idiomsList = itemsList;
          requestSayingsData();
        });
      });
    });
  }

  void requestSayingsData() async {
    dbAssets = assetDB.initializeDatabase();
    dbAssets.then((database) {
      Future<List<ItemCallback>> sayingsListAsset = assetDB.getItemList(DbUtils.sayingsTable);
      sayingsListAsset.then((itemsList) {
        setState(() {
          sayingsList = itemsList;
          requestProverbsData();
        });
      });
    });
  }

  void requestProverbsData() async {
    dbAssets = assetDB.initializeDatabase();
    dbAssets.then((database) {
      Future<List<ItemCallback>> proverbsListAsset = assetDB.getItemList(DbUtils.proverbsTable);
      proverbsListAsset.then((itemsList) {
        setState(() {
          proverbsList = itemsList;
          _goToNextScreen();
        });
      });
    });
  }

  Future<void> saveWordsData() async {
    for (int i = 0; i < words.length; i++) {
      int progressValue = (i / words.length * 100).toInt();
      progress.setProgress(progressValue);

      switch (progressValue) {
        case 1:
          informer.setText("Moja...");
          break;
        case 2:
          informer.setText("Mbili...");
          break;
        case 3:
          informer.setText("Tatu ...");
          break;
        case 4:
          informer.setText("Inapakia ...");
          break;
        case 10:
          informer.setText("Inapakia maneno ...");
          break;
        case 20:
          informer.setText("Kuwa mvumilivu ...");
          break;
        case 40:
          informer.setText("Mvumilivu hula mbivu ...");
          break;
        case 50:
          informer.setText("Kama una haraka, shuka ukimbie ...");
          break;
        case 75:
          informer.setText("Asante kwa uvumilivu wako!");
          break;
        case 85:
          informer.setText("Hatimaye");
          break;
        case 90:
          informer.setText("Inapakia words ...");
          break;
        case 95:
          informer.setText("Karibu tunamalizia");
          break;
      }

      WordCallback item = words[i];

      Word word = new Word(item.title, item.meaning, item.synonyms, item.conjugation);

      await appDB.insertWord(word);
    }
  }

  Future<void> saveItemData(String type, String table, List<ItemCallback> itemlist) async {
    for (int i = 0; i < itemlist.length; i++) {
      int progressValue = (i / itemlist.length * 100).toInt();
      progress.setProgress(progressValue);
      informer.setText("Sasa yapakia " + type + " ...");
      ItemCallback itemCallBack = itemlist[i];

      Item item = new Item(itemCallBack.title, itemCallBack.meaning, itemCallBack.synonyms);

      await appDB.insertItem(table, item);
    }
  }

  Future<void> _goToNextScreen() async {
    await saveWordsData();
    await saveItemData(AppStrings.idioms, DbUtils.idiomsTable, idiomsList);
    await saveItemData(AppStrings.sayings, DbUtils.sayingsTable, sayingsList);
    await saveItemData(AppStrings.proverbs, DbUtils.proverbsTable, proverbsList);

    Preferences.setKamusidbLoaded(true);
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => new StartScreen()));
  }
}
