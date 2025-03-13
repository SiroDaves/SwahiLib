part of '../home_screen.dart';

class WordSearch extends SearchDelegate<List> {
  final List<Word> words;

  WordSearch(BuildContext context, this.words);

  @override
  String get searchFieldLabel => "Tafuta Neno";

  @override
  ThemeData appBarTheme(BuildContext context) {
   return Theme.of(context).brightness == Brightness.light
        ? AppTheme.darkTheme()
        : AppTheme.lightTheme();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear, color: Colors.white),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, words),
      icon: const Icon(Icons.arrow_back, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildSearchResults(context);

  Widget _buildSearchResults(BuildContext context) {
    final filteredWords = _filterWords(query);

    if (filteredWords.isEmpty) {
      return const Center(
        child: Text(
          "Hakuna matokeo",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: filteredWords.length,
      itemBuilder: (context, index) {
        final word = filteredWords[index];
        return WordItem(
          word: word,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordScreen(
                  word: word,
                  words: words,
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Word> _filterWords(String query) {
    if (query.trim().isEmpty) return words;

    final lowerQuery = query.trim().toLowerCase();

    return words.where((word) {
      return (word.title?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }
}
