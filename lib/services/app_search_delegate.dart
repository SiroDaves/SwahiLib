import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_settings.dart';
import '../data/models/word.dart';
import '../utils/app_utils.dart';
import '../utils/colors.dart';
import '../ui/views/word_item.dart';

class AppSearchDelegate extends SearchDelegate<List> {

	List<Word> itemList, filtered;

	AppSearchDelegate(BuildContext context, this.itemList) {
    filtered = itemList;
  }

  @override
  String get searchFieldLabel => AppStrings.searchHint;

	@override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
			primaryColor: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.primaryColor,
			accentIconTheme: IconThemeData(color: ColorUtils.white),
			primaryIconTheme: IconThemeData(color: ColorUtils.white),
			textTheme: TextTheme(
				subtitle1: TextStyle(
						color: Color(0xFFFBF5E8)
				),
			),
			primaryTextTheme: TextTheme(
				subtitle1: TextStyle(
          color: ColorUtils.white
				),
			),
		);
  }
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          filtered = itemList;
					showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
		return IconButton(
			icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
			onPressed: () {
				close(context, null);
			},
		);
  }

  // Function triggered when "ENTER" is pressed.
  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) filterNow();
    return _buildItems(context);
  }

  // Results are displayed if _data is not empty.
  // Display of results changes as users type something in the search field.
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) filterNow();
    return _buildItems(context);
  }

  Widget _buildItems(BuildContext context) {
    return Container(
      decoration: Provider.of<AppSettings>(context).isDarkMode ? BoxDecoration()
          : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [ 0.1, 0.4, 0.6, 0.9 ],
                colors: [ ColorUtils.black, Colors.blue[900],  Colors.blue, Colors.blue[200] ]),
            ),
      child: ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          return WordItem('ItemSearch_' + filtered[index].id.toString(), filtered[index], context);
        }
      ),
    );
  }

  void filterNow() async {
    if (query.isNotEmpty)
    {
      List<Word> tmpList = new List<Word>();
      for(int i = 0; i < itemList.length; i++) {        
        if (
          itemList[i].title.toLowerCase().startsWith(query.toLowerCase())
          //|| itemList[i].meaning.toLowerCase().contains(query.toLowerCase())
        ) tmpList.add(itemList[i]);
      }
      filtered = tmpList;
    }
  }
  
}
