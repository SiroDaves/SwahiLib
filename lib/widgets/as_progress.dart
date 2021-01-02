import 'package:flutter/material.dart';
import 'package:kamusi/utils/colors.dart';

class AsProgress extends StatefulWidget {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  AsProgressState progressState;

  AsProgress(
    {
      this.backgroundColor = Colors.black54,
      this.color = Colors.white,
      this.containerColor = Colors.transparent,
      this.borderRadius = 10,
      this.text
    }
  );

  @override
  createState() => progressState = AsProgressState(
      backgroundColor: this.backgroundColor,
      color: this.color,
      containerColor: this.containerColor,
      borderRadius: this.borderRadius,
      text: this.text);

  void hideWidget() {
    progressState.hideWidget();
  }

  void showWidget() {
    progressState.showWidget();
  }

  void showWidgetWithText(String title) {
    progressState.showWidgetWithText(title);
  }

  static Widget getProgress(String title) {
    return AsProgress(
      backgroundColor: Colors.black12,
      color: Colors.black,
      containerColor: Colors.white,
      borderRadius: 5,
      text: title,
    );
  }
}

class AsProgressState extends State<AsProgress> {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  bool _opacity = false;

  AsProgressState(    
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
    return Container(
      child: !_opacity ? null : Opacity(
        opacity: _opacity ? 1 : 0,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  color: containerColor,
                  border: Border.all(color: ColorUtils.primaryColor),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                  borderRadius: BorderRadius.all(
                     Radius.circular(borderRadius)
                  )
                ),
              ),
            ),
            Center(
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

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getCircularProgress(),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              text,
              style: TextStyle(color: color, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircularProgress() {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(ColorUtils.primaryColor));
  }

  void hideWidget() {
    setState(() {
      _opacity = false;
    });
  }

  void showWidget() {
    setState(() {
      _opacity = true;
    });
  }

  void showWidgetWithText(String title) {
    setState(() {
      _opacity = true;
      text = title;
    });
  }
}
