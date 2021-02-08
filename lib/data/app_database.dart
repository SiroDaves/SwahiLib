// This file declares functions that manages the database that is created in the app
// when the app is installed for the first time

import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../data/models/item.dart';
import '../data/models/trivia_quiz.dart';
import '../data/models/trivia.dart';
import '../data/models/word.dart';
import '../utils/db_utils.dart';

class AppDatabase {
  static AppDatabase sqliteHelper; // Singleton DatabaseHelper
  static Database appDb; // Singleton Database

  AppDatabase._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory AppDatabase() {
    if (sqliteHelper == null) {
      sqliteHelper = AppDatabase._createInstance(); // This is executed only once, singleton object
    }
    return sqliteHelper;
  }

  Future<Database> get database async {
    if (appDb == null) {
      appDb = await initializeDatabase();
    }
    return appDb;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, "KiswahiliKitukuzwe.db");

    // Open/create the database at a given path
    var vsbDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return vsbDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(Queries.createHistoryTable);
    await db.execute(Queries.createIdiomsTable);
    await db.execute(Queries.createProverbsTable);
    await db.execute(Queries.createSayingsTable);
    await db.execute(Queries.createSearchesTable);
    await db.execute(Queries.createWordsTable);

    
    await db.execute(Queries.createTriviaTable);
    await db.execute(Queries.createTriviaAttemptTable);
  }

  Future<void> additionalTables()  async{
    Database db = await this.database;
    await db.rawQuery(Queries.createTriviaTable);
    await db.rawQuery(Queries.createTriviaAttemptTable);
  }

  //QUERIES FOR NENO
  Future<int> insertWord(Word item) async {
    Database db = await this.database;
    item.isfav = item.views = 0;

    var result = await db.insert(DbUtils.wordsTable, item.toMap());
    return result;
  }

  //QUERIES FOR Proverbs, Sayings or Idioms
  Future<int> insertItem(String table, Item item) async {
    Database db = await this.database;
    item.isfav = item.views = 0;

    var result = await db.insert(table, item.toMap());
    return result;
  }

  Future<int> favouriteWord(Word item, bool isFavorited) async {
    var db = await this.database;
    if (isFavorited) item.isfav = 1;
    else item.isfav = 0;
    var result = await db.rawUpdate('UPDATE ' + DbUtils.wordsTable +
        ' SET ' + DbUtils.isfav + '=' + item.isfav.toString() +
        ' WHERE ' + DbUtils.id + '=' + item.id.toString());
    return result;
  }

  Future<int> deleteWord(int itemID) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM ' + DbUtils.wordsTable +
      ' WHERE ' + DbUtils.id + '=' + itemID.toString());
    return result;
  }

  Future<int> getWordCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from ' + DbUtils.wordsTable);
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //GENERIC LISTS
  Future<List<Map<String, dynamic>>> getItemMapList(String table) async {
    try {
      Database db = await this.database;
      List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from ' + table);
      int counts = Sqflite.firstIntValue(x);
      print("Counts: " + counts.toString());
      var result = db.query(table);
      return result;
    } catch(e){
      print("Error: " + e.message);
      return null;
    }
  }

  Future<List<Item>> getItemList(String table) async {
    var itemMapList = await getItemMapList(table);
    List<Item> itemList = List<Item>();
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Item.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  //GENERIC SEARCH
  Future<List<Map<String, dynamic>>> getItemSearchMapLists(String searchString, String table) async {
    Database db = await this.database;
    String sqlQuery = DbUtils.title + ' LIKE "$searchString%"';

    var result = db.query(table, where: sqlQuery);
    return result;
  }

  Future<List<Map<String, dynamic>>> getItemSearchMapList(String searchString, String table, bool searchByTitle) async {
    Database db = await this.database;
    String sqlQuery = DbUtils.title + " LIKE '$searchString%'";

    if (!searchByTitle)
      sqlQuery = sqlQuery + " OR " + DbUtils.meaning + " LIKE '$searchString%'";

    var result = db.query(table, where: sqlQuery);
    return result;
  }

  Future<List<Item>> getItemSearch(String searchString, String table, bool searchByTitle) async {
    var itemMapList = await getItemSearchMapList(searchString, table, searchByTitle);

    List<Item> itemList = List<Item>();
    
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Item.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  //NENO LISTS
  Future<List<Map<String, dynamic>>> getWordMapList() async {
    Database db = await this.database;
    var result = db.query(DbUtils.wordsTable);
    return result;
  }

  Future<List<Word>> getWordList() async {
    var itemMapList = await getWordMapList();
    List<Word> itemList = List<Word>();
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Word.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  //NENO SEARCH
  Future<List<Map<String, dynamic>>> getWordSearchMapList(String searchString, bool searchByTitle) async {
    Database db = await this.database;
    String sqlQuery = DbUtils.title + " LIKE '$searchString%'";

    if (!searchByTitle)
      sqlQuery = sqlQuery + " OR " + DbUtils.meaning + " LIKE '$searchString%'";

    var result = db.query(DbUtils.wordsTable, where: sqlQuery);
    return result;
  }

  Future<List<Word>> getWordSearch(String searchString, bool searchByTitle) async {
    var itemMapList = await getWordSearchMapList(searchString, searchByTitle);

    List<Word> itemList = List<Word>();
    
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Word.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  //FAVOURITES LISTS
  Future<List<Map<String, dynamic>>> getFavoritesList() async {
    Database db = await this.database;
    var result = db.query(DbUtils.wordsTable, where: DbUtils.isfav + "=1");
    return result;
  }

  Future<List<Word>> getFavorites() async {
    var itemMapList = await getFavoritesList();

    List<Word> itemList = List<Word>();
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Word.fromMapObject(itemMapList[i]));
    }

    return itemList;
  }

  //FAVORITE SEARCH
  Future<List<Map<String, dynamic>>> getFavSearchMapList(
      String searchString) async {
    Database db = await this.database;
    String extraQuery = 'AND ' + DbUtils.isfav + "=1 ";
    String sqlQuery = DbUtils.title + ' LIKE "$searchString%" $extraQuery OR ' +
        DbUtils.meaning + ' LIKE "$searchString%" $extraQuery';

    var result = db.query(DbUtils.wordsTable, where: sqlQuery);
    return result;
  }

  Future<List<Word>> getFavSearch(String searchString) async {
    var itemMapList = await getFavSearchMapList(searchString);

    List<Word> itemList = List<Word>();
    
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Word.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  //Create a new Trivia
  Future<int> insertTrivia(Trivia trivia) async {
    Database db = await this.database;
    var result = await db.rawInsert('INSERT INTO ' + DbUtils.triviaTable + 
      '(' + DbUtils.category + ', ' + DbUtils.description + ', ' + DbUtils.questions + ', ' + DbUtils.level + ') VALUES(' + 
      trivia.category.toString() + ', "' + trivia.description + '", "' + trivia.questions + '", "' + trivia.level + '")');
    return result;
  }

  //TRIVIA LISTS
  Future<List<Map<String, dynamic>>> getTriviaMapList() async {
    Database db = await this.database;
    var result = db.query(DbUtils.triviaTable);
    return result;
  }

  Future<List<Trivia>> getTriviaList() async {
    var itemMapList = await getTriviaMapList();
    List<Trivia> itemList = List<Trivia>();
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Trivia.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  Future<List<Map<String, dynamic>>> getTriviaByIdList(int itemID) async {
    Database db = await this.database;
    var result = db.query(DbUtils.triviaTable, where: DbUtils.id + '=' + itemID.toString());
    return result;
  }

  Future<Trivia> getTriviaById(int itemID) async {
    var itemMapList = await getTriviaByIdList(itemID);

    List<Trivia> itemList = List<Trivia>();
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Trivia.fromMapObject(itemMapList[i]));
    }
    return itemList[0];
  }
  
  Future<List<Map<String, dynamic>>> getTriviaEntryMapList(String wordids) async {
    Database db = await this.database;
    String sqlQuery = DbUtils.id + " IN ($wordids)";

    var result = db.query(DbUtils.wordsTable, where: sqlQuery);
    return result;
  }

  Future<List<TriviaQuiz>> getTriviaEntries(String level, String wordids) async {
    var itemMapList = await getTriviaEntryMapList(wordids);

    List<TriviaQuiz> itemList = List<TriviaQuiz>();
   
    for (int i = 0; i < itemMapList.length; i++) 
    {
      String correctAnswer = itemMapList[i]['title'];
      var fullQuestion = itemMapList[i]['meaning'].split("|");

      String defect = correctAnswer.substring(0, 2);
      List<Word> alternatives = await getWordSearch(defect, true);
      alternatives.shuffle();

      TriviaQuiz quiz = new TriviaQuiz();
      quiz.type = itemMapList[i]["type"] == "multiple" ? Type.multiple : Type.boolean;
      quiz.level = itemMapList[i]["level"] == "easy" ? Level.easy : itemMapList[i]["level"] == "medium" ? Level.medium : Level.hard;
      quiz.question = fullQuestion[0];
      quiz.answer = correctAnswer;
      quiz.options = List<dynamic>();

      quiz.options.add(correctAnswer);

      quiz.options.add(alternatives[0].title);
      
      if (alternatives.length > 2) {
        quiz.options.add(alternatives[1].title);
      }

      if (alternatives.length > 3) {
        quiz.options.add(alternatives[2].title);
      }

      quiz.options.shuffle();

      itemList.add(quiz);
    }
    itemList.shuffle();
    return itemList;
  }
}
