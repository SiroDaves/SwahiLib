import 'package:flutter/material.dart';

class AsTextView extends StatefulWidget {
  final String text;
  final double fsize;
  final bool isbold;
  AsTextViewState asTextViewState;

  AsTextView(
    {
      this.text,
      this.fsize,
      this.isbold
    }
  );

  @override
  createState() => asTextViewState = new AsTextViewState( text: this.text, fsize: this.fsize, isbold: this.isbold );

  void setText(String newtext) {
    asTextViewState.setNewText(newtext);
  }

  void setSize(double newfontsize) {
    asTextViewState.setNewFontSize(newfontsize);
  }

  static Widget setUp(String defaultText, double textFontsize, bool isTextbold) {
    return new AsTextView(
      text: defaultText,
      fsize: textFontsize ,
      isbold: isTextbold   
    );
  }
}

class AsTextViewState extends State<AsTextView> {
  String text;
  double fsize;
  bool isbold;

  AsTextViewState( { this.text, this.fsize, this.isbold } );

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style: new TextStyle(fontWeight: isbold ? FontWeight.bold : FontWeight.normal, fontSize: fsize),
    );
  }

  void setNewText(String newText) {
    setState(() { text = newText; });
  }
  
  void setNewFontSize(double newFontsize) {
    setState(() { fsize = newFontsize; });
  }

}
