// This file declares functions that manages the asset database that is compiled with the app

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:kamusi/models/callbacks/Generic.dart';
import 'package:kamusi/models/callbacks/Neno.dart';
import 'package:kamusi/utils/Constants.dart';

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

  Future<List<Map<String, dynamic>>> getNenoMapList() async {
    Database db = await this.database;
    var result = db.query(LangStrings.maneno);
    return result;
  }

  Future<List<Neno>> getNenoList() async {
    var nenoMapList = await getNenoMapList();
    List<Neno> nenoList = List<Neno>();
    for (int i = 0; i < nenoMapList.length; i++) {
      nenoList.add(Neno.fromMapObject(nenoMapList[i]));
    }
    return nenoList;
  }

  Future<List<Map<String, dynamic>>> getGenericMapList(String table) async {
    Database db = await this.database;
    var result = db.query(table);
    return result;
  }

  Future<List<Generic>> getGenericList(String table) async {
    var genericMapList = await getGenericMapList(table);
    List<Generic> genericList = List<Generic>();
    for (int i = 0; i < genericMapList.length; i++) {
      genericList.add(Generic.fromMapObject(genericMapList[i]));
    }
    return genericList;
  }
}
