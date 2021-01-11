import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kamusi/screens/donate.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/widgets/as_tab_bar.dart';
import 'package:kamusi/views/tab_view_neno.dart';
import 'package:kamusi/views/tab_view_generic.dart';
import 'package:kamusi/models/page.dart';
import 'package:app_prompter/app_prompter.dart';

List<AsPage> _allPages = <AsPage>[
  AsPage(text: LangStrings.maneno, category: 'category-name'),
  AsPage(text: LangStrings.misemo, category: 'category-name'),
  AsPage(text: LangStrings.nahau, category: 'category-name'),
  AsPage(text: LangStrings.methali, category: 'category-name'),
];

class MainView extends StatefulWidget {
  MainView({this.scrollController});

  final ScrollController scrollController;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  TabController _controller;
  WidgetBuilder builder = buildProgressIndicator;

  AppPrompter appPrompter = AppPrompter(
    preferencesPrefix: 'appPrompter_',
    minDays: 0,
    minLaunches: 3,
    remindDays: 2,
    remindLaunches: 3
  );

  Key _key = new PageStorageKey({});
  double _offset = 0.0;
  double _newOffset = 0.0;

  void _scrollListener() {
    if (widget.scrollController.position.extentAfter == 0.0) {
      _newOffset = 25.0;
      if (Platform.isIOS) {
        _newOffset = 35.0;
      }
    } else {
      _newOffset = 0.0;
    }
    setState(() {
      _offset = _newOffset;
    });
  }

  @override
  void initState() {
    _controller = new TabController(vsync: this, length: _allPages.length);
    widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  Widget build(BuildContext context) {
    final List<Widget> tabChildernPages = <Widget>[];
    _allPages.forEach((AsPage page)
    {
      if (page.text == LangStrings.maneno) tabChildernPages.add(TabViewNeno());
      else tabChildernPages.add(TabViewGeneric(page.text));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: _offset),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        AsTabBar(_controller, _allPages),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Stack(              
              children: <Widget>[
                TabBarView(
                  key: _key,
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: tabChildernPages,
                ),
                AppPrompterBuilder(
                  builder: builder,
                  onInitialized: (context, appPrompter) {                    
                    if (appPrompter.shouldOpenDialog) {
                      appPrompter.showPromptDialog(
                        context,
                        title: LangStrings.donateDialogTitle, // The dialog title.
                        message: LangStrings.donateDialogMessage, // The dialog message.
                        actionButton: LangStrings.donateActionButton, // The dialog "action" button text.
                        noButton: "", // The dialog "no" button text.
                        laterButton: LangStrings.laterActionButton, // The dialog "later" button text.
                        listener: (button) { // The button click listener (useful if you want to cancel the click event).
                          switch(button) {
                            case AppPrompterDialogButton.action:
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Donate();
                                })
                              );
                              break;
                            case AppPrompterDialogButton.later:
                            case AppPrompterDialogButton.no:
                              //print('Clicked on "Later".');
                              break;
                          }
                          
                          return true; // Return false if you want to cancel the click event.
                        },
                        dialogStyle: DialogStyle(), // Custom dialog styles.
                        onDismissed: () => appPrompter.callEvent(AppPrompterEventType.laterButtonPressed),
                      );
                    }
                  },
                ),
              ]
            ),
          ),
        ),
      ],
    );
  }
  static Widget buildProgressIndicator(BuildContext context) => const Center();
}
