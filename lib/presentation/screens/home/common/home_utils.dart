import '../home_screen.dart';

void filterList(int page, String letter, HomeScreenState parent) {
  final lowercaseLetter = letter.toLowerCase();

  switch (page) {
    case 0:
      parent.filteredWords = parent.words
          .where(
              (item) => item.title!.toLowerCase().startsWith(lowercaseLetter))
          .toList();
      break;
    case 1:
      parent.filteredIdioms = parent.idioms
          .where(
              (item) => item.title!.toLowerCase().startsWith(lowercaseLetter))
          .toList();
      break;
    case 2:
      parent.filteredSayings = parent.sayings
          .where(
              (item) => item.title!.toLowerCase().startsWith(lowercaseLetter))
          .toList();
      break;
    case 3:
      parent.filteredProverbs = parent.proverbs
          .where(
              (item) => item.title!.toLowerCase().startsWith(lowercaseLetter))
          .toList();
      break;
  }
}
