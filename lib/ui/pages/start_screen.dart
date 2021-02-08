// This file declares the start screen which will handle
// first time settings and the next screen

import 'dart:async';

import 'package:flutter/material.dart';
import '../../data/app_database.dart';
import '../../utils/navigation.dart';
import '../../utils/preferences.dart';
import 'init_load_screen.dart';

class StartScreen extends StatefulWidget {
  @override
  createState() => new StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();
  AppDatabase appDB = AppDatabase();

@override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), _handleTapEvent);
    return MaterialApp(
      home: Scaffold(
      body: Center( 
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.cover
            )
          ),
          )
        )
      )
    ); 
  }

  void _handleTapEvent() async {
    bool kamusidbLoaded = await Preferences.isKamusidbLoaded();
    await appDB.additionalTables();

    if (this.mounted) {
      setState(() {
        if (kamusidbLoaded != null && kamusidbLoaded)
        {
          pushHomeScreenScreen(context);
          //Navigator.pushReplacement( context, new MaterialPageRoute(builder: (context) => new GameScreen()));
        }
        else {
          Navigator.pushReplacement( context, new MaterialPageRoute(builder: (context) => new InitLoadScreen()));
        }
      });
    }
  }

}