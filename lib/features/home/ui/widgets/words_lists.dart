part of '../home_screen.dart';

class WordsList extends StatelessWidget {
  final HomeScreenState parent;
  const WordsList({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 85,
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: parent.filteredWords.length,
        itemBuilder: (BuildContext context, int index) {
          final Word word = parent.filteredWords[index];
          return WordItem(
            word: word,
            onTap: () {},//=> vm.openWord(word),
          );
        },
      ),
    );
  }
}
