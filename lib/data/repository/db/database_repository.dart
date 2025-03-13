import '../../models/models.dart';

abstract class DatabaseRepository {
  Future<List<History>> fetchHistories();

  Future<void> saveHistory(History history);

  Future<void> removeAllHistories();

  Future<List<Idiom>> fetchIdioms();

  Future<void> saveIdiom(Idiom idiom);

  Future<void> saveIdioms(List<Idiom> idioms);

  Future<void> removeAllIdioms();

  Future<List<Proverb>> fetchProverbs();

  Future<void> saveProverb(Proverb proverb);

  Future<void> saveProverbs(List<Proverb> proverbs);

  Future<void> removeAllProverbs();

  Future<List<Saying>> fetchSayings();

  Future<void> saveSaying(Saying saying);

  Future<void> saveSayings(List<Saying> sayings);

  Future<void> removeAllSayings();

  Future<List<Search>> fetchSearches();

  Future<void> saveSearch(Search search);


  Future<void> removeAllSearches();

  Future<List<Word>> fetchWords();

  Future<void> saveWord(Word word);

  Future<void> saveWords(List<Word> words);

  Future<void> removeAllWords();
}
