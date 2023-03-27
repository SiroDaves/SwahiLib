import 'package:flutter/material.dart';

import '../../../../theme/theme_colors.dart';
import '../../vm/home/home_vm.dart';
import '../../widget/action/list_items.dart';

class SearchList1 extends SearchDelegate<List> {
  final HomeVm vm;
  final double? height;

  SearchList1(BuildContext context, this.vm, this.height);

  @override
  String get searchFieldLabel => "Tafuta Neno";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: ThemeColors.primary),
      textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, vm.words!),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => searchThis(context);

  @override
  Widget buildSuggestions(BuildContext context) => searchThis(context);

  Widget searchThis(BuildContext context) {
    final matchQuery = vm.words!.where((i) {
      return (i.title!.toLowerCase().contains(query.toLowerCase()) ||
          i.synonyms!.toLowerCase().contains(query.toLowerCase()) ||
          i.meaning!.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.all(height! * 0.015),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        return WordItem(
          word: result,
          onTap: () => vm.openWord(result),
        );
      },
    );
  }
}
