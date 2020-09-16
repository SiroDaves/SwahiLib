import 'package:kamusi/utils/Navigation.dart';
import 'package:flutter/material.dart';

class AppStart extends StatefulWidget {
  @override
  AppStartState createState() => AppStartState();
}

class AppStartState extends State<AppStart> {
  @override
  void initState() {
    _nextAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.cover)),
    ))));
  }

  _nextAction() async {
    await Future.delayed(Duration(milliseconds: 3000)).then((_) {
      pushHomeScreen(context);
    });
  }
}
