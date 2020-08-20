import 'package:flutter/material.dart';

class AppSplash extends StatelessWidget {
  const AppSplash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Center(child: Image.asset('assets/images/appicon.png', height: 64, width: 64)),
    );
  }
}
