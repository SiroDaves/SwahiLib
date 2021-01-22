import 'package:flutter/material.dart';

import 'package:kamusi/helpers/app_search_delegate.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/models/word_model.dart';
import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:provider/provider.dart';

import 'package:kamusi/screens/donate_screen.dart';
import 'package:kamusi/screens/help_desk_screen.dart';
import 'package:kamusi/screens/howto_use_screen.dart';
import 'package:kamusi/screens/about_screen.dart';

class AsSearch extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<WordModel> itemList;
  AsSearch(this.scaffoldKey, this.itemList);

  @override
  Widget build(BuildContext context) {
    
    Widget menuPopup() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Consumer<AppSettings>(builder: (context, AppSettings settings, _) {
            return ListTile(
              onTap: () {},
              title: Text(LangStrings.mandhariMeusi),
              trailing: Switch(
                onChanged: (bool value) => settings.setDarkMode(value),
                value: settings.isDarkMode,
              ),
            );
          }),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(LangStrings.donateTabPage),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(LangStrings.helpTabPage),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(LangStrings.howToUse),
        ),
        /*PopupMenuItem(
          value: 4,
          child: Text(LangStrings.aboutApp),
        ),*/
      ],
      onCanceled: () { },
      onSelected: (value) {
        selectedMenu(value, context);
      },
      icon: Icon(
        Theme.of(context).platform == TargetPlatform.iOS ? Icons.more_horiz : Icons.more_vert, color: ColorUtils.black
      ),
    );

    return Card(
      elevation: 3.0,
      margin: EdgeInsets.only(top: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              alignment: Alignment( 2.4, -1.4 ),
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  onTap: () async {
                    final List selected = await showSearch(
                      context: context,
                      delegate: AppSearchDelegate(context, itemList),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  child: Text(LangStrings.appName, style: TextStyle(fontSize: 20)),
                  margin: EdgeInsets.all(10.0),
                ),
                onTap: () async {
                  final List selected = await showSearch(
                    context: context,
                    delegate: AppSearchDelegate(context, itemList),
                  );
                },
              ),
            ),
            menuPopup(),
          ],
        ),
      ),
    );
  }
  
  void selectedMenu(int menu, BuildContext context) {
    switch (menu) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DonateScreen();
          })
        );
        break;

      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HelpDeskScreen();
          })
        );
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HowtoUseScreen();
          })
        );
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AboutScreen();
          })
        );
        break;
    }
  }
}
