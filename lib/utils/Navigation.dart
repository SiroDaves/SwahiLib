import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'package:kamusi/screens/home_screen.dart';

void pushHomeScreenScreen(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    PageTransition(
      child: HomeScreen(),
      type: PageTransitionType.rightToLeftWithFade,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    ),
    (route) => false,
  );
}

void pushSettingsScreen(BuildContext context) {
  //Navigator.of(context).push(
  //  MaterialPageRoute(builder: (context) => FfSettings()),
  //);
}

void pushAttributionsScreen(BuildContext context) {
  /*Navigator.of(context).push(
      //MaterialPageRoute(builder: (context) => AttributionsScreen()),
      );*/
}
