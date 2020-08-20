import 'package:flutter/material.dart';

class AsProgressWidget extends StatefulWidget {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  AsProgressWidgetState progressWidgetState;

  AsProgressWidget(
    {
      this.backgroundColor = Colors.black54,
      this.color = Colors.white,
      this.containerColor = Colors.transparent,
      this.borderRadius = 10,
      this.text
    }
  );

  @override
  createState() => progressWidgetState = new AsProgressWidgetState(
      backgroundColor: this.backgroundColor,
      color: this.color,
      containerColor: this.containerColor,
      borderRadius: this.borderRadius,
      text: this.text);

  void hideProgress() {
    progressWidgetState.hideProgress();
  }

  void showProgress() {
    progressWidgetState.showProgress();
  }

  void showProgressWithText(String title) {
    progressWidgetState.showProgressWithText(title);
  }

  static Widget getProgressWidget(String title) {
    return new AsProgressWidget(
      backgroundColor: Colors.black12,
      color: Colors.black,
      containerColor: Colors.white,
      borderRadius: 5,
      text: title,
    );
  }
}

class AsProgressWidgetState extends State<AsProgressWidget> {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  bool _opacity = true;

  AsProgressWidgetState(    
    {
      this.backgroundColor = Colors.black54,
      this.color = Colors.white,
      this.containerColor = Colors.transparent,
      this.borderRadius = 10,
      this.text
    }
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: !_opacity ? null : new Opacity(
        opacity: _opacity ? 1 : 0,
        child: new Stack(
          children: <Widget>[
              new Center(
                child: new Container(
                  width: 300,
                  height: 120,
                  decoration: new BoxDecoration(
                      color: containerColor,
                  ),
                ),
              ),
              new Center(
                child: _getCenterContent(),
            )
          ],
        ),
      )
    );
  }

  Widget _getCenterContent() {
    if (text == null || text.isEmpty) {
      return _getCircularProgress();
    }

    return new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getCircularProgress(),
          new Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: new Text(
              text,
              style: new TextStyle(color: color, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircularProgress() {
    return new CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation(Colors.deepOrange));
  }

  void hideProgress() {
    setState(() {
      _opacity = false;
    });
  }

  void showProgress() {
    setState(() {
      _opacity = true;
    });
  }

  void showProgressWithText(String title) {
    setState(() {
      _opacity = true;
      text = title;
    });
  }
}
