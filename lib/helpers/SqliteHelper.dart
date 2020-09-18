// This file declares functions that manages the database that is created in the app
// when the app is installed for the first time

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:kamusi/models/GenericModel.dart';
import 'package:kamusi/models/NenoModel.dart';
import 'package:kamusi/utils/Constants.dart';

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
    String path = join(docsDirectory.path, "Kamusi.db");

    // Open/create the database at a given path
    var vsbDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return vsbDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(Queries.createManenoTable);
    await db.execute(Queries.createMethaliTable);
    await db.execute(Queries.createMisemoTable);
    await db.execute(Queries.createNahauTable);
  }

  //QUERIES FOR NENO
  Future<int> insertNeno(NenoModel neno) async {
    Database db = await this.database;
    neno.isfav = neno.views = 0;

    var result = await db.insert(LangStrings.maneno, neno.toMap());
    return result;
  }

  //QUERIES FOR NENO
  Future<int> insertGeneric(String table, GenericModel generic) async {
    Database db = await this.database;
    generic.isfav = generic.views = 0;

    var result = await db.insert(table, generic.toMap());
    return result;
  }

  Future<int> favouriteNeno(NenoModel neno, bool isFavorited) async {
    var db = await this.database;
    if (isFavorited)
      neno.isfav = 1;
    else
      neno.isfav = 0;
    var result = await db.rawUpdate('UPDATE ' +
        LangStrings.maneno +
        ' SET ' +
        LangStrings.isfav +
        '=' +
        neno.isfav.toString() +
        ' WHERE ' +
        LangStrings.id +
        '=' +
        neno.id.toString());
    return result;
  }

  Future<int> deleteNeno(int nenoID) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM ' +
        LangStrings.maneno +
        ' WHERE ' +
        LangStrings.id +
        '=' +
        nenoID.toString());
    return result;
  }

  Future<int> getNenoCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from ' + LangStrings.maneno);
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //NENO LISTS
  Future<List<Map<String, dynamic>>> getNenoMapList() async {
    Database db = await this.database;
    var result = db.query(LangStrings.maneno);
    return result;
  }

  Future<List<NenoModel>> getNenoList() async {
    var nenoMapList = await getNenoMapList();
    List<NenoModel> nenoList = List<NenoModel>();
    for (int i = 0; i < nenoMapList.length; i++) {
      nenoList.add(NenoModel.fromMapObject(nenoMapList[i]));
    }
    return nenoList;
  }

  //GENERIC LISTS
  Future<List<Map<String, dynamic>>> getGenericMapList(String table) async {
    Database db = await this.database;
    var result = db.query(table);
    return result;
  }

  Future<List<GenericModel>> getGenericList(String table) async {
    var genericMapList = await getGenericMapList(table);
    List<GenericModel> genericList = List<GenericModel>();
    for (int i = 0; i < genericMapList.length; i++) {
      genericList.add(GenericModel.fromMapObject(genericMapList[i]));
    }
    return genericList;
  }

  //NENO SEARCH
  Future<List<Map<String, dynamic>>> getNenoSearchMapList(
      String searchThis, bool searchByTitle) async {
    Database db = await this.database;
    String sqlQuery = LangStrings.title + " LIKE '$searchThis%'";

    if (!searchByTitle)
      sqlQuery = sqlQuery + " OR " + LangStrings.maana + " LIKE '$searchThis%'";

    var result = db.query(LangStrings.maneno, where: sqlQuery);
    return result;
  }

  Future<List<NenoModel>> getNenoSearch(
      String searchString, bool searchByTitle) async {
    var nenoMapList = await getNenoSearchMapList(searchString, searchByTitle);

    List<NenoModel> nenoList = List<NenoModel>();
    // For loop to create a 'neno List' from a 'Map List'
    for (int i = 0; i < nenoMapList.length; i++) {
      nenoList.add(NenoModel.fromMapObject(nenoMapList[i]));
    }
    return nenoList;
  }

  //GENERIC SEARCH
  Future<List<Map<String, dynamic>>> getGenericSearchMapList(
      String searchThis, String table) async {
    Database db = await this.database;
    String sqlQuery = LangStrings.title + ' LIKE "$searchThis%"';

    var result = db.query(table, where: sqlQuery);
    return result;
  }

  Future<List<GenericModel>> getGenericSearch(
      String searchThis, String table) async {
    var genericMapList = await getGenericSearchMapList(searchThis, table);

    List<GenericModel> genericList = List<GenericModel>();
    // For loop to create a 'generic List' from a 'Map List'
    for (int i = 0; i < genericMapList.length; i++) {
      genericList.add(GenericModel.fromMapObject(genericMapList[i]));
    }
    return genericList;
  }

  //FAVOURITES LISTS
  Future<List<Map<String, dynamic>>> getFavoritesList() async {
    Database db = await this.database;
    var result = db.query(LangStrings.maneno, where: LangStrings.isfav + '=1');
    return result;
  }

  Future<List<NenoModel>> getFavorites() async {
    var nenoMapList = await getFavoritesList();

    List<NenoModel> nenoList = List<NenoModel>();
    for (int i = 0; i < nenoMapList.length; i++) {
      nenoList.add(NenoModel.fromMapObject(nenoMapList[i]));
    }

    return nenoList;
  }

  //FAVORITE SEARCH
  Future<List<Map<String, dynamic>>> getFavSearchMapList(
      String searchThis) async {
    Database db = await this.database;
    String extraQuery = 'AND ' + LangStrings.isfav + '=1 ';
    String sqlQuery = LangStrings.title +
        ' LIKE "$searchThis%" $extraQuery OR ' +
        LangStrings.maana +
        ' LIKE "$searchThis%" $extraQuery';

    var result = db.query(LangStrings.maneno, where: sqlQuery);
    return result;
  }

  Future<List<NenoModel>> getFavSearch(String searchThis) async {
    var nenoMapList = await getFavSearchMapList(searchThis);

    List<NenoModel> nenoList = List<NenoModel>();
    // For loop to create a 'neno List' from a 'Map List'
    for (int i = 0; i < nenoMapList.length; i++) {
      nenoList.add(NenoModel.fromMapObject(nenoMapList[i]));
    }
    return nenoList;
  }
}
