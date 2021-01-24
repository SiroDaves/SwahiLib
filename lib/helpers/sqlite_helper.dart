// This file declares functions that manages the database that is created in the app
// when the app is installed for the first time

import 'package:kamusi/models/trivia/category.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:kamusi/models/item.dart';
import 'package:kamusi/models/word.dart';
import 'package:kamusi/utils/constants.dart';

class SqliteHelper {
  static SqliteHelper sqliteHelper; // Singleton DatabaseHelper
  static Database appDb; // Singleton Database

  SqliteHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory SqliteHelper() {
    if (sqliteHelper == null) {
      sqliteHelper = SqliteHelper
          ._createInstance(); // This is executed only once, singleton object
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
    String path = join(docsDirectory.path, "AppDatabase.db");

    // Open/create the database at a given path
    var vsbDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return vsbDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(Queries.createIdiomsTable);
    await db.execute(Queries.createProverbsTable);
    await db.execute(Queries.createSayingsTable);
    await db.execute(Queries.createSearchesTable);
    await db.execute(Queries.createTriviaTable);
    await db.execute(Queries.createWordsTable);
  }

  //QUERIES FOR NENO
  Future<int> insertWord(Word item) async {
    Database db = await this.database;
    item.isfav = item.views = 0;

    var result = await db.insert(LangStrings.wordsTable, item.toMap());
    return result;
  }

  //QUERIES FOR NENO
  Future<int> insertGeneric(String table, Item generic) async {
    Database db = await this.database;
    generic.isfav = generic.views = 0;

    var result = await db.insert(table, generic.toMap());
    return result;
  }

  Future<int> favouriteWord(Word item, bool isFavorited) async {
    var db = await this.database;
    if (isFavorited) item.isfav = 1;
    else item.isfav = 0;
    var result = await db.rawUpdate('UPDATE ' + LangStrings.wordsTable +
        ' SET ' + LangStrings.isfav + '=' + item.isfav.toString() +
        ' WHERE ' + LangStrings.id + '=' + item.id.toString());
    return result;
  }

  Future<int> deleteWord(int itemID) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM ' + LangStrings.wordsTable +
      ' WHERE ' + LangStrings.id + '=' + itemID.toString());
    return result;
  }

  Future<int> getWordCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from ' + LangStrings.wordsTable);
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //GENERIC LISTS
  Future<List<Map<String, dynamic>>> getGenericMapList(String table) async {
    Database db = await this.database;
    var result = db.query(table);
    return result;
  }

  Future<List<Item>> getGenericList(String table) async {
    var genericMapList = await getGenericMapList(table);
    List<Item> genericList = List<Item>();
    for (int i = 0; i < genericMapList.length; i++) {
      genericList.add(Item.fromMapObject(genericMapList[i]));
    }
    return genericList;
  }

  //GENERIC SEARCH
  Future<List<Map<String, dynamic>>> getGenericSearchMapLists(String searchString, String table) async {
    Database db = await this.database;
    String sqlQuery = LangStrings.title + ' LIKE "$searchString%"';

    var result = db.query(table, where: sqlQuery);
    return result;
  }

  Future<List<Map<String, dynamic>>> getGenericSearchMapList(String searchString, String table, bool searchByTitle) async {
    Database db = await this.database;
    String sqlQuery = LangStrings.title + " LIKE '$searchString%'";

    if (!searchByTitle)
      sqlQuery = sqlQuery + " OR " + LangStrings.meaning + " LIKE '$searchString%'";

    var result = db.query(table, where: sqlQuery);
    return result;
  }

  Future<List<Item>> getGenericSearch(String searchString, String table, bool searchByTitle) async {
    var itemMapList = await getGenericSearchMapList(searchString, table, searchByTitle);

    List<Item> itemList = List<Item>();
    // For loop to create a 'item List' from a 'Map List'
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Item.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  //NENO LISTS
  Future<List<Map<String, dynamic>>> getWordMapList() async {
    Database db = await this.database;
    var result = db.query(LangStrings.wordsTable);
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
    String sqlQuery = LangStrings.title + " LIKE '$searchString%'";

    if (!searchByTitle)
      sqlQuery = sqlQuery + " OR " + LangStrings.meaning + " LIKE '$searchString%'";

    var result = db.query(LangStrings.wordsTable, where: sqlQuery);
    return result;
  }

  Future<List<Word>> getWordSearch(String searchString, bool searchByTitle) async {
    var itemMapList = await getWordSearchMapList(searchString, searchByTitle);

    List<Word> itemList = List<Word>();
    // For loop to create a 'item List' from a 'Map List'
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Word.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  //FAVOURITES LISTS
  Future<List<Map<String, dynamic>>> getFavoritesList() async {
    Database db = await this.database;
    var result = db.query(LangStrings.wordsTable, where: LangStrings.isfav + "=1");
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
    String extraQuery = 'AND ' + LangStrings.isfav + "=1 ";
    String sqlQuery = LangStrings.title + ' LIKE "$searchString%" $extraQuery OR ' +
        LangStrings.meaning + ' LIKE "$searchString%" $extraQuery';

    var result = db.query(LangStrings.wordsTable, where: sqlQuery);
    return result;
  }

  Future<List<Word>> getFavSearch(String searchString) async {
    var itemMapList = await getFavSearchMapList(searchString);

    List<Word> itemList = List<Word>();
    // For loop to create a 'item List' from a 'Map List'
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Word.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

  
  //QUIZ SEARCH
  Future<List<Map<String, dynamic>>> getQuizSearchMapList(String searchString) async {
    Database db = await this.database;
    String sqlQuery = LangStrings.title + " LIKE '$searchString%'";

    var result = db.query(LangStrings.wordsTable, where: sqlQuery);
    return result;
  }

  Future<List<Word>> getQuizSearch(Category category, int total, String difficulty) async {
    var itemMapList = await getQuizSearchMapList(category.name, );

    List<Word> itemList = List<Word>();
    // For loop to create a 'item List' from a 'Map List'
    for (int i = 0; i < itemMapList.length; i++) {
      itemList.add(Word.fromMapObject(itemMapList[i]));
    }
    return itemList;
  }

}
