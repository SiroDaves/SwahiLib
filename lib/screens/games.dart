import 'package:flutter/material.dart';

class Games extends StatefulWidget {
  @override
  GamesState createState() => GamesState();
}

class GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chemsha Bongo'),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
