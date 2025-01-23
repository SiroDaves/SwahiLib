part of '../home_screen.dart';

class WordsList extends StatelessWidget {
  final List<Word> words;
  const WordsList({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 85,
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: vm.filterWords!.length,
        itemBuilder: (BuildContext context, int index) {
          final Word word = vm.filterWords![index];
          return WordItem(
            word: word,
            onTap: () => vm.openWord(word),
          );
        },
      ),
    );
  }
}
