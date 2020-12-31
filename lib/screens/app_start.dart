// This file declares the start screen which will handle
// first time settings and the next screen

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kamusi/screens/init_load.dart';
import 'package:kamusi/utils/navigation.dart';
import 'package:kamusi/utils/preferences.dart';

class AppStart extends StatefulWidget {
  @override
  createState() => new SplashPageState();
}

class SplashPageState extends State<AppStart> {
  final globalKey = new GlobalKey<ScaffoldState>();

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

      if (this.mounted) {
      setState(() {
        if (kamusidbLoaded != null && kamusidbLoaded)
        {
          pushHomeScreen(context);
        }
        else {
          Navigator.pushReplacement( context, new MaterialPageRoute(builder: (context) => new CcInitLoad()));
        }
      });
    }
  }

}