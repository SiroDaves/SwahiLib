import 'package:flutter/material.dart';
import 'package:kamusi/utils/colors.dart';

class AsLoader extends StatefulWidget {
  AsLoaderState progressState;

  @override
  createState() => progressState = AsLoaderState();

  void hideWidget() {
    progressState.hideWidget();
  }

  void showWidget() {
    progressState.showWidget();
  }

}

class AsLoaderState extends State<AsLoader> {
  bool _opacity = false;

  AsLoaderState();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !_opacity ? null : Opacity(
        opacity: _opacity ? 1 : 0,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ColorUtils.primaryColor),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                  borderRadius: BorderRadius.all(
                     Radius.circular(30)
                  )
                ),
              ),
            ),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(ColorUtils.primaryColor)
              ),
            )
          ],
        ),
      )
    );
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

}
