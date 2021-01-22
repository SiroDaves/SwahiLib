import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/utils/constants.dart';

class AboutScreen extends StatefulWidget {

  @override
  AboutAppState createState() => AboutAppState();
}

class AboutAppState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LangStrings.appName),
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
              child: Image(
                //image: new AssetImage("assets/images/" + image + ".png"),
                height: 200.0,
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Html(
                  //data: strText,
                  style: {
                    "html": Style(
                      fontSize: FontSize(30.0),
                    ),
                  },
                  //onLinkTap: (url) => launchURL(url),
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
