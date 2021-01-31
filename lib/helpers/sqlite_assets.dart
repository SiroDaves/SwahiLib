// This file declares functions that manages the asset database that is compiled with the app

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:kamusi/models/callbacks/ItemCallback.dart';
import 'package:kamusi/models/callbacks/WordCallback.dart';
import 'package:kamusi/utils/constants.dart';

class SqliteAssets {
  static SqliteAssets sqliteHelper; // Singleton DatabaseHelper
  static Database appDb; // Singleton Database

  SqliteAssets._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory SqliteAssets() {
    if (sqliteHelper == null) {
      sqliteHelper = SqliteAssets
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
    //String path = join("assets", "kamusi.db");
    //await rootBundle.load(join("assets", "example.db"));
    //var assetDatabase = await openDatabase("assets/kamusi.db", readOnly: true);
    //return assetDatabase;
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "demo_asset_example.db");

    // Check if the database exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", "kamusi.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);

    // open the database
    var assetDatabase = await openDatabase(path, readOnly: true);
    return assetDatabase;
  }

  Future<List<Map<String, dynamic>>> getWordMapList() async {
    Database db = await this.database;
    var result = db.query(LangStrings.wordsTable);
    return result;
  }

  Future<List<WordCallback>> getWordList() async {
    var wordMapList = await getWordMapList();
    List<WordCallback> wordList = List<WordCallback>();
    for (int i = 0; i < wordMapList.length; i++) {
      wordList.add(WordCallback.fromMapObject(wordMapList[i]));
    }
    return wordList;
  }

  Future<List<Map<String, dynamic>>> getItemMapList(String table) async {
    Database db = await this.database;
    var result = db.query(table);
    return result;
  }

  Future<List<ItemCallback>> getItemList(String table) async {
    var genericMapList = await getItemMapList(table);
    List<ItemCallback> genericList = List<ItemCallback>();
    for (int i = 0; i < genericMapList.length; i++) {
      genericList.add(ItemCallback.fromMapObject(genericMapList[i]));
    }
    return genericList;
  }
}
