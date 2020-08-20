import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamusi/models/GenericModel.dart';
import 'package:kamusi/models/NenoModel.dart';
import 'package:kamusi/models/callbacks/Generic.dart';
import 'package:kamusi/models/callbacks/Neno.dart';
import 'package:kamusi/utils/Constants.dart';
import 'package:kamusi/utils/Preferences.dart';
import 'package:kamusi/helpers/SqliteAssets.dart';
import 'package:kamusi/helpers/SqliteHelper.dart';
import 'package:kamusi/screens/AppStart.dart';
import 'package:kamusi/widgets/AsTextView.dart';
import 'package:kamusi/widgets/AsLineProgress.dart';
import 'package:sqflite/sqflite.dart';

class CcKamusiLoad extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CcKamusiLoadState();
  }
}

class CcKamusiLoadState extends State<CcKamusiLoad> {
  AsTextView textIndicator = AsTextView.setUp("Vruuummh! ...", 25, true);
  AsTextView textProgress = AsTextView.setUp("", 25, true);
  AsLineProgress lineProgress = AsLineProgress.setUp(300, 0);
  final globalKey = new GlobalKey<ScaffoldState>();

  SqliteHelper db = SqliteHelper();
  SqliteAssets adb = SqliteAssets();

  List<Neno> nenos;
  List<Generic> nahau;
  List<Generic> misemo;
  List<Generic> methali;

  Future<Database> dbAssets;
  Future<Database> dbFuture;

  @override
  Widget build(BuildContext context) {
    if (nenos == null) {
      nenos = List<Neno>();
      nahau = List<Generic>();
      misemo = List<Generic>();
      methali = List<Generic>();
      requestData();
    }

    return Scaffold(
      key: globalKey,
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: new Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _appIcon(),
                  _appLoading(),
                ],
              ),
              _appLabel(),
              Stack(
                children: <Widget>[
                  _appProgress(),
                  _appProgressText(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appIcon() {
    return new Center(
      child: new Container(
        child: new Image(
          image: new AssetImage("assets/images/appicon.png"),
          height: 450,
          width: 300,
        ),
        margin: EdgeInsets.only(top: 75),
      ),
    );
  }

  Widget _appLoading() {
    return new Center(
      child: new Container(
        child: new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation(Colors.blue)),
        margin: EdgeInsets.only(top: 270),
      ),
    );
  }

  Widget _appLabel() {
    return new Center(
      child: new Container(
        height: 100,
        width: 350,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            boxShadow: [BoxShadow(blurRadius: 5)],
            borderRadius: new BorderRadius.all(new Radius.circular(10))),
        child: new Stack(
          children: <Widget>[
            new Center(child: new Container(width: 300, height: 120)),
            new Center(
              child: new Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: textIndicator,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appProgress() {
    return new Center(
      child: new Container(
        height: 100,
        width: 350,
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: new Stack(
          children: <Widget>[
            new Center(
              child: lineProgress,
            )
          ],
        ),
      ),
    );
  }

  Widget _appProgressText() {
    return new Center(
      child: new Container(
        height: 100,
        width: 350,
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: new Stack(
          children: <Widget>[
            new Center(
              child: textProgress,
            )
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
      Future<List<Generic>> nahauListAsset = adb.getGenericList(Texts.nahau);
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
      Future<List<Generic>> misemoListAsset = adb.getGenericList(Texts.misemo);
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
      Future<List<Generic>> methaliListAsset = adb.getGenericList(Texts.methali);
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
      int progress = (i / nenos.length * 100).toInt();
      String progresStr = (progress / 100).toStringAsFixed(1);

      textProgress.setText(progress.toString() + " %");
      lineProgress.setProgress(double.parse(progresStr));

      switch (progress) {
        case 1:
          textIndicator.setText("Moja...");
          break;
        case 2:
          textIndicator.setText("Mbili...");
          break;
        case 3:
          textIndicator.setText("Tatu ...");
          break;
        case 4:
          textIndicator.setText("Inapakia ...");
          break;
        case 10:
          textIndicator.setText("Inapakia maneno ...");
          break;
        case 20:
          textIndicator.setText("Kuwa mvumilivu ...");
          break;
        case 40:
          textIndicator.setText("Mvumilivu hula mbivu ...");
          break;
        case 75:
          textIndicator.setText("Asante kwa uvumilivu wako!");
          break;
        case 85:
          textIndicator.setText("Hatimaye");
          break;
        case 95:
          textIndicator.setText("Karibu tumalizie");
          break;
      }

      Neno item = nenos[i];

      NenoModel neno = new NenoModel(item.title, item.maana, item.visawe, item.mnyambuliko);

      await db.insertNeno(neno);
    }
  }

  Future<void> saveGenericData(String table, List<Generic> genericlist) async {
    for (int i = 0; i < genericlist.length; i++) {
      int progress = (i / genericlist.length * 100).toInt();
      String progresStr = (progress / 100).toStringAsFixed(1);

      textProgress.setText(progress.toString() + " %");
      lineProgress.setProgress(double.parse(progresStr));
      textIndicator.setText(">> Inapakia " + table + " ...");
      Generic item = genericlist[i];

      GenericModel generic = new GenericModel(item.title, item.maana);

      await db.insertGeneric(table, generic);
    }
  }

  Future<void> _goToNextScreen() async {
    await saveManenoData();
    await saveGenericData(Texts.nahau, nahau);
    await saveGenericData(Texts.misemo, misemo);
    await saveGenericData(Texts.methali, methali);

    Preferences.setKamusidbLoaded(true);
    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new AppStart()));
  }
}
