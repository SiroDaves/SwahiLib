// This file declares the database initialization screen

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anisi_controls/anisi_controls.dart';

import 'package:kamusi/models/generic_model.dart';
import 'package:kamusi/models/neno_model.dart';
import 'package:kamusi/models/callbacks/Generic.dart';
import 'package:kamusi/models/callbacks/Neno.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/utils/preferences.dart';
import 'package:kamusi/helpers/sqlite_assets.dart';
import 'package:kamusi/helpers/sqlite_helper.dart';
import 'package:kamusi/screens/app_start.dart';

class CcInitLoad extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CcInitLoadState();
  }
}

class CcInitLoadState extends State<CcInitLoad> {
  final globalKey = new GlobalKey<ScaffoldState>();
  
  AsLineProgress progress = AsLineProgress.setUp(0, Colors.black, Colors.black, ColorUtils.secondaryColor);
  AsInformer informer = AsInformer.setUp(1, LangStrings.gettingReady, ColorUtils.primaryColor, Colors.transparent, Colors.white, 10);
  
  SqliteHelper db = SqliteHelper();
  SqliteAssets adb = SqliteAssets();

  List<Neno> nenos =List<Neno>();
  List<Generic> nahau =List<Generic>();
  List<Generic> misemo =List<Generic>();
  List<Generic> methali =List<Generic>();

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
      Future<List<Neno>> nenoListAsset = adb.getNenoList();
      nenoListAsset.then((nenoList) {
        setState(() {
          nenos = nenoList;
          requestNahauData();
        });
      });
    });
  }

  void requestNahauData() async {
    dbAssets = adb.initializeDatabase();
    dbAssets.then((database) {
      Future<List<Generic>> nahauListAsset =
          adb.getGenericList(LangStrings.nahau);
      nahauListAsset.then((nahauList) {
        setState(() {
          nahau = nahauList;
          requestMisemoData();
        });
      });
    });
  }

  void requestMisemoData() async {
    dbAssets = adb.initializeDatabase();
    dbAssets.then((database) {
      Future<List<Generic>> misemoListAsset =
          adb.getGenericList(LangStrings.misemo);
      misemoListAsset.then((misemoList) {
        setState(() {
          misemo = misemoList;
          requestMethaliData();
        });
      });
    });
  }

  void requestMethaliData() async {
    dbAssets = adb.initializeDatabase();
    dbAssets.then((database) {
      Future<List<Generic>> methaliListAsset =
          adb.getGenericList(LangStrings.methali);
      methaliListAsset.then((methaliList) {
        setState(() {
          methali = methaliList;
          _goToNextScreen();
        });
      });
    });
  }

  Future<void> saveManenoData() async {
    for (int i = 0; i < nenos.length; i++) {
      int progressValue = (i / nenos.length * 100).toInt();
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
          informer.setText("Inapakia maneno ...");
          break;
        case 95:
          informer.setText("Karibu tunamalizia");
          break;
      }

      Neno item = nenos[i];

      NenoModel neno =
          new NenoModel(item.title, item.maana, item.visawe, item.mnyambuliko);

      await db.insertNeno(neno);
    }
  }

  Future<void> saveGenericData(String table, List<Generic> genericlist) async {
    for (int i = 0; i < genericlist.length; i++) {
      int progressValue = (i / genericlist.length * 100).toInt();
      progress.setProgress(progressValue);
      informer.setText(">> Inapakia " + table + " ...");
      Generic item = genericlist[i];

      GenericModel generic = new GenericModel(item.title, item.maana);

      await db.insertGeneric(table, generic);
    }
  }

  Future<void> _goToNextScreen() async {
    await saveManenoData();
    await saveGenericData(LangStrings.nahau, nahau);
    await saveGenericData(LangStrings.misemo, misemo);
    await saveGenericData(LangStrings.methali, methali);

    Preferences.setKamusidbLoaded(true);
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => new AppStart()));
  }
}
