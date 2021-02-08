
/// General database strings
class DbUtils{  
  static const String wordsTable = 'words';
  static const String idiomsTable = 'idioms';
  static const String sayingsTable = 'sayings';
  static const String proverbsTable = 'proverbs';
  static const String searchesTable = 'searches';
  static const String historyTable = 'history';
  static const String triviaTable = 'my_trivia';
  static const String attemptsTable = 'my_attempts';

  static const String id = 'id';
  static const String trivia = 'trivia';
  static const String wordid = 'wordid';
  static const String wordids = 'wordids';
  static const String triviaid = 'triviaid';
  static const String categoryid = 'categoryid';
  static const String created = 'created';
  static const String title = 'title';
  static const String meaning = 'meaning';
  static const String synonyms = 'synonyms';
  static const String conjugation = 'conjugation';
  static const String description = 'description';
  static const String isfav = 'isfav';
  static const String views = 'views';
  static const String notes = 'notes';

  static const String progress = 'progress';
  static const String time = 'time';
  static const String category = 'category';
  static const String level = 'level';
  static const String questions = 'questions';
  static const String score = 'score';

}
/// Strings used in the database queries
class Queries {
  
  /// Query string for creating the searches table
  static const String createHistoryTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.historyTable +
    '(' + 
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.wordid + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.created + ' VARCHAR(20) NOT NULL DEFAULT ""' +
    ');';
 
  /// Query string for creating the idioms table
  static const String createIdiomsTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.idiomsTable +
    '(' +
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.title + ' VARCHAR(100) NOT NULL DEFAULT "", ' +
      DbUtils.meaning + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.synonyms + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.notes + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';
    
  /// Query string for creating the proverbs table
  static const String createProverbsTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.proverbsTable +
    '(' +
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.title + ' VARCHAR(100) NOT NULL DEFAULT "", ' +
      DbUtils.meaning + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.synonyms + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.notes + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the sayings table
  static const String createSayingsTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.sayingsTable +
    '(' +
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.title + ' VARCHAR(100) NOT NULL DEFAULT "", ' +
      DbUtils.meaning + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.synonyms + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.notes + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';

  /// Query string for creating the searches table
  static const String createSearchesTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.searchesTable +
    '(' + 
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.wordid + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.created + ' VARCHAR(20) NOT NULL DEFAULT ""' +
    ');';
   
  /// Query string for creating the words table
  static const String createWordsTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.wordsTable +
    '(' + 
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.title + ' VARCHAR(100) NOT NULL DEFAULT "", ' +
      DbUtils.meaning + ' VARCHAR(300) NOT NULL DEFAULT "", ' +
      DbUtils.synonyms + ' VARCHAR(100) NOT NULL DEFAULT "", ' +
      DbUtils.conjugation + ' VARCHAR(100) NOT NULL DEFAULT "",' +
      DbUtils.notes + ' VARCHAR(500) NOT NULL DEFAULT "", ' +
      DbUtils.isfav + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.views + ' INTEGER NOT NULL DEFAULT 0' +
    ');';


  /// Query string for creating the trivia table
  static const String createTriviaTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.triviaTable +
    '(' + 
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.triviaid + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.category + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.description + ' VARCHAR(100) NOT NULL DEFAULT "", ' +
      DbUtils.questions + ' VARCHAR(1000) NOT NULL DEFAULT "", ' +
      DbUtils.level + ' VARCHAR(20) NOT NULL DEFAULT "", ' +
      DbUtils.score + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.time + ' VARCHAR(20) NOT NULL DEFAULT "", ' +
      DbUtils.created + ' VARCHAR(20) NOT NULL DEFAULT ""' +
    ');';
   
  /// Query string for creating the trivia table
  static const String createTriviaAttemptTable = 'CREATE TABLE IF NOT EXISTS ' + DbUtils.attemptsTable +
    '(' + 
      DbUtils.id + ' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
      DbUtils.trivia + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.progress + ' INTEGER NOT NULL DEFAULT 0, ' +
      DbUtils.time + ' VARCHAR(20) NOT NULL DEFAULT "", ' +
      DbUtils.created + ' VARCHAR(20) NOT NULL DEFAULT ""' +
    ');';
  
}
