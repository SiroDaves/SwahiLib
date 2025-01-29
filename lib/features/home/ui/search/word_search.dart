part of '../home_screen.dart';

class WordSearch extends SearchDelegate<List> {
  final List<Word> words;

  WordSearch(BuildContext context, this.words);

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
      onPressed: () => close(context, words),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => searchThis(context);

  @override
  Widget buildSuggestions(BuildContext context) => searchThis(context);

  Widget searchThis(BuildContext context) {
    final matchQuery = words.where((i) {
      return (i.title!.toLowerCase().contains(query.toLowerCase()) ||
          i.synonyms!.toLowerCase().contains(query.toLowerCase()) ||
          i.meaning!.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        return WordItem(
          word: result,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordViewer(
                  word: result,
                  words: words,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
