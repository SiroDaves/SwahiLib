import '../../data/db/app_database.dart';
import '../../data/models/models.dart';
import '../../utils/app_util.dart';
import '../../utils/date_util.dart';
import 'database_repository.dart';

/// Implementor of Database Repository
class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDB;

  DatabaseRepositoryImpl(this._appDB);

  @override
  Future<List<History>> fetchHistories() async {
    return _appDB.historiesDao.fetchHistories();
  }

  @override
  Future<void> saveHistory(History history) async {
    return _appDB.historiesDao.insertHistory(history);
  }

  @override
  Future<void> removeAllHistories() async {
    return _appDB.historiesDao.deleteAllHistories();
  }

  @override
  Future<List<Idiom>> fetchIdioms() async {
    return _appDB.idiomsDao.fetchIdioms();
  }

  @override
  Future<void> saveIdiom(Idiom idiom) async {
    return _appDB.idiomsDao.insertIdiom(idiom);
  }

  @override
  Future<void> saveIdioms(List<Idiom> idioms) async {
    try {
      if (idioms.isNotEmpty) {
        await _appDB.idiomsDao.deleteAllIdioms();
        logger('${idioms.length} idioms to be saved ${dateNow()}');
        for (final idiom in idioms) {
          await _appDB.idiomsDao.insertIdiom(idiom);
        }
        logger('${idioms.length} idioms have been saved ${dateNow()}');
      }
    } catch (e) {
      logger('Unable to save idioms: $e');
    }
  }

  @override
  Future<void> removeAllIdioms() async {
    return _appDB.idiomsDao.deleteAllIdioms();
  }

  @override
  Future<List<Proverb>> fetchProverbs() async {
    return _appDB.proverbsDao.fetchProverbs();
  }

  @override
  Future<void> saveProverb(Proverb proverb) async {
    return _appDB.proverbsDao.insertProverb(proverb);
  }

  @override
  Future<void> saveProverbs(List<Proverb> proverbs) async {
    try {
      if (proverbs.isNotEmpty) {
        await _appDB.proverbsDao.deleteAllProverbs();
        logger('${proverbs.length} proverbs to be saved ${dateNow()}');
        for (final proverb in proverbs) {
          await _appDB.proverbsDao.insertProverb(proverb);
        }
        logger('${proverbs.length} proverbs have been saved ${dateNow()}');
      }
    } catch (e) {
      logger('Unable to save proverbs: $e');
    }
  }

  @override
  Future<void> removeAllProverbs() async {
    return _appDB.proverbsDao.deleteAllProverbs();
  }

  @override
  Future<List<Saying>> fetchSayings() async {
    return _appDB.sayingsDao.fetchSayings();
  }

  @override
  Future<void> saveSaying(Saying saying) async {
    return _appDB.sayingsDao.insertSaying(saying);
  }

  @override
  Future<void> saveSayings(List<Saying> sayings) async {
    try {
      if (sayings.isNotEmpty) {
        await _appDB.sayingsDao.deleteAllSayings();
        logger('${sayings.length} sayings to be saved ${dateNow()}');
        for (final saying in sayings) {
          await _appDB.sayingsDao.insertSaying(saying);
        }
        logger('${sayings.length} sayings have been saved ${dateNow()}');
      }
    } catch (e) {
      logger('Unable to save sayings: $e');
    }
  }

  @override
  Future<void> removeAllSayings() async {
    return _appDB.sayingsDao.deleteAllSayings();
  }

  @override
  Future<List<Search>> fetchSearches() async {
    return _appDB.searchesDao.fetchSearches();
  }

  @override
  Future<void> saveSearch(Search search) async {
    return _appDB.searchesDao.insertSearch(search);
  }

  @override
  Future<void> removeAllSearches() async {
    return _appDB.searchesDao.deleteAllSearches();
  }

  @override
  Future<List<Word>> fetchWords() async {
    return _appDB.wordsDao.fetchWords();
  }

  @override
  Future<void> saveWord(Word word) async {
    return _appDB.wordsDao.insertWord(word);
  }

  @override
  Future<void> saveWords(List<Word> words) async {
    try {
      if (words.isNotEmpty) {
        await _appDB.wordsDao.deleteAllWords();
        logger('${words.length} words to be saved ${dateNow()}');
        for (final word in words) {
          await _appDB.wordsDao.insertWord(word);
        }
        logger('${words.length} words have been saved ${dateNow()}');
      }
      //final prefRepo = getIt<PrefRepository>();
      //prefRepo.setPrefBool(PrefConstants.wordsAreLoadedKey, true);
    } catch (e) {
      logger('Unable to save words: $e');
    }
  }

  @override
  Future<void> removeAllWords() async {
    return _appDB.wordsDao.deleteAllWords();
  }
}
