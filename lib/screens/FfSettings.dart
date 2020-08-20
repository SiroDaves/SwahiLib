import 'dart:async';
import 'package:flutter/material.dart';

class FfSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FfSettingsState();
  }
}

class FfSettingsState extends State<FfSettings> {
  var appBar = AppBar();
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
	    onWillPop: () {
		    moveToLastScreen();
	    },

	    child: Scaffold(
	    appBar: AppBar(
        title: Text('Kamusi Settings'),
		    leading: IconButton(icon: Icon(
				    Icons.arrow_back),
				    onPressed: () {
		    	    moveToLastScreen();
				    }
		    ),
	    ),

	    body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: new Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
  
  void moveToLastScreen() {
		Navigator.pop(context, true);
  }

}
