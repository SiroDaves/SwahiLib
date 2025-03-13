import 'package:flutter/material.dart';

class ViewerModel {
  String songBook;
  String songTitle;
  bool hasChorus;
  List<String> songVerses;
  List<Tab> widgetTabs;
  List<Widget> widgetContent;

  ViewerModel({
    this.songBook = '',
    this.songTitle = '',
    this.hasChorus = false,
    this.songVerses = const [],
    this.widgetTabs = const [],
    this.widgetContent = const [],
  });
}
