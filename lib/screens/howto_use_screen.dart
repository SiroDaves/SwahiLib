import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/utils/constants.dart';

class HowtoUseScreen extends StatefulWidget {

  @override
  HowtoUseScreenState createState() => HowtoUseScreenState();
}

class HowtoUseScreenState extends State<HowtoUseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LangStrings.howToUse),
      ),
      body: Container(
      padding: const EdgeInsets.all(10),
      decoration: Provider.of<AppSettings>(context).isDarkMode
          ? BoxDecoration()
          : BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.cyan, Colors.indigo]),
            ),
      child: ListView(
        children: <Widget>[
          Card(
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(LangStrings.howToSearch1.toUpperCase(), style: TextStyle(fontSize: 20.0)),
                  Text(LangStrings.howToSearch2, style: TextStyle(fontSize: 16.0)),
                  Image(
                    image: new AssetImage("assets/help/howto1.jpg"),
                    //height: 200.0,
                  ),
                ],),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
