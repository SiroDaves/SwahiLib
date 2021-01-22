// This file declares the database initialization screen

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anisi_controls/anisi_controls.dart';

import 'package:kamusi/models/generic_model.dart';
import 'package:kamusi/models/word_model.dart';
import 'package:kamusi/models/callbacks/Generic.dart';
import 'package:kamusi/models/callbacks/Word.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/utils/preferences.dart';
import 'package:kamusi/helpers/sqlite_assets.dart';
import 'package:kamusi/helpers/sqlite_helper.dart';
import 'package:kamusi/screens/start_screen.dart';

class InitLoadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CcInitLoadState();
  }
}

class CcInitLoadState extends State<InitLoadScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();
  
  AsLineProgress progress = AsLineProgress.setUp(0, Colors.black, Colors.black, ColorUtils.secondaryColor);
  AsInformer informer = AsInformer.setUp(1, LangStrings.gettingReady, ColorUtils.primaryColor, Colors.transparent, Colors.white, 10);
  
  SqliteHelper db = SqliteHelper();
  SqliteAssets adb = SqliteAssets();

  List<Word> words =List<Word>();
  List<Generic> idiomsList =List<Generic>();
  List<Generic> sayingsList =List<Generic>();
  List<Generic> proverbsList =List<Generic>();

  Future<Database> dbAssets;
  Future<Database> dbFuture;

  double mHeight, mWidth;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Method to run anything that needs to be run immediately after Widget build
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
    dbAssets = adb.initializeDatabase();
    dbAssets.then((database) {
      Future<List<Word>> wordListAsset = adb.getWordList();
      wordListAsset.then((wordList) {
        setState(() {
          words = wordList;
          requestNahauData();
        });
      });
    });
  }

  void requestNahauData() async {
    dbAssets = adb.initializeDatabase();
    dbAssets.then((database) {
      Future<List<Generic>> idiomsListAsset = adb.getGenericList(LangStrings.idiomsTable);
      idiomsListAsset.then((idiomsList) {
        setState(() {
          idiomsList = idiomsList;
          requestMisemoData();
        });
      });
    });
  }

  void requestMisemoData() async {
    dbAssets = adb.initializeDatabase();
    dbAssets.then((database) {
      Future<List<Generic>> sayingsListAsset = adb.getGenericList(LangStrings.sayingsTable);
      sayingsListAsset.then((itemsList) {
        setState(() {
          sayingsList = itemsList;
          requestMethaliData();
        });
      });
    });
  }

  void requestMethaliData() async {
    dbAssets = adb.initializeDatabase();
    dbAssets.then((database) {
      Future<List<Generic>> proverbsListAsset = adb.getGenericList(LangStrings.proverbsTable);
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

      Word item = words[i];

      WordModel word = new WordModel(item.title, item.meaning, item.synonyms, item.conjugation);

      await db.insertWord(word);
    }
  }

  Future<void> saveGenericData(String type, String table, List<Generic> genericlist) async {
    for (int i = 0; i < genericlist.length; i++) {
      int progressValue = (i / genericlist.length * 100).toInt();
      progress.setProgress(progressValue);
      informer.setText(">> Inapakia " + type + " ...");
      Generic item = genericlist[i];

      GenericModel generic = new GenericModel(item.title, item.meaning);

      await db.insertGeneric(table, generic);
    }
  }

  Future<void> _goToNextScreen() async {
    await saveWordsData();
    await saveGenericData(LangStrings.idioms, LangStrings.idiomsTable, idiomsList);
    await saveGenericData(LangStrings.sayings, LangStrings.sayingsTable, sayingsList);
    await saveGenericData(LangStrings.proverbs, LangStrings.proverbsTable, proverbsList);

    Preferences.setKamusidbLoaded(true);
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => new StartScreen()));
  }
}
