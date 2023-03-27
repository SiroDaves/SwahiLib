import 'package:injectable/injectable.dart';

import '../db/dao/history_dao.dart';
import '../db/dao/idiom_dao.dart';
import '../db/dao/proverb_dao.dart';
import '../db/dao/saying_dao.dart';
import '../db/dao/search_dao.dart';
import '../db/dao/word_dao.dart';
import '../model/base/history.dart';
import '../model/base/idiom.dart';
import '../model/base/proverb.dart';
import '../model/base/saying.dart';
import '../model/base/search.dart';
import '../model/base/word.dart';

@lazySingleton
abstract class DbRepository {
  @factoryMethod
  factory DbRepository(
    HistoryDao historyDao,
    IdiomDao idiomDao,
    ProverbDao proverbDao,
    SayingDao sayingDao,
    SearchDao searchDao,
    WordDao wordDao,
  ) = DbRepo;

  Future<List<History>> fetchHistories();
  Future<List<Idiom>> fetchIdioms();
  Future<List<Proverb>> fetchProverbs();
  Future<List<Saying>> fetchSayings();
  Future<List<Search>> fetchSearches();
  Future<List<Word>> fetchWords();

  Future<void> saveHistory(History history);
  Future<void> saveIdiom(Idiom idiom);
  Future<void> saveProverb(Proverb proverb);
  Future<void> saveSaying(Saying saying);
  Future<void> saveSearch(Search search);
  Future<void> saveWord(Word word);

  Future<void> editIdiom(Idiom idiom);
  Future<void> editProverb(Proverb proverb);
  Future<void> editSaying(Saying saying);
  Future<void> editWord(Word word);

  Future<void> deleteHistories();
  Future<void> deleteSearches();
  Future<void> majorCleanUp();
}

class DbRepo implements DbRepository {
  final HistoryDao historyDao;
  final IdiomDao idiomDao;
  final ProverbDao proverbDao;
  final SayingDao sayingDao;
  final SearchDao searchDao;
  final WordDao wordDao;

  DbRepo(
    this.historyDao,
    this.idiomDao,
    this.proverbDao,
    this.sayingDao,
    this.searchDao,
    this.wordDao,
  );

  @override
  Future<void> deleteHistories() async {
    await historyDao.deleteHistories();
  }

  @override
  Future<void> deleteSearches() async {
    await searchDao.deleteSearches();
  }

  @override
  Future<void> editIdiom(Idiom idiom) async {
    await idiomDao.updateIdiom(idiom);
  }

  @override
  Future<void> editProverb(Proverb proverb) async {
    await proverbDao.updateProverb(proverb);
  }

  @override
  Future<void> editSaying(Saying saying) async {
    await sayingDao.updateSaying(saying);
  }

  @override
  Future<void> editWord(Word word) async {
    await wordDao.updateWord(word);
  }

  @override
  Future<List<History>> fetchHistories() async {
    return await historyDao.getHistories();
  }

  @override
  Future<List<Idiom>> fetchIdioms() async {
    return await idiomDao.getAllIdioms();
  }

  @override
  Future<List<Proverb>> fetchProverbs() async {
    return await proverbDao.getAllProverbs();
  }

  @override
  Future<List<Saying>> fetchSayings() async {
    return await sayingDao.getAllSayings();
  }

  @override
  Future<List<Search>> fetchSearches() async {
    return await searchDao.getAllSearches();
  }

  @override
  Future<List<Word>> fetchWords() async {
    return await wordDao.getAllWords();
  }

  @override
  Future<void> majorCleanUp() async {
    await historyDao.deleteHistories();
    await searchDao.deleteSearches();
  }

  @override
  Future<void> saveHistory(History history) async {
    await historyDao.createHistory(history);
  }

  @override
  Future<void> saveIdiom(Idiom idiom) async {
    await idiomDao.createIdiom(idiom);
  }

  @override
  Future<void> saveProverb(Proverb proverb) async {
    await proverbDao.createProverb(proverb);
  }

  @override
  Future<void> saveSaying(Saying saying) async {
    await sayingDao.createSaying(saying);
  }

  @override
  Future<void> saveSearch(Search search) async {
    await searchDao.createSearch(search);
  }

  @override
  Future<void> saveWord(Word word) async {
    await wordDao.createWord(word);
  }
}
