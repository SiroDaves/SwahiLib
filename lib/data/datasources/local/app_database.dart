import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/models.dart';
import 'dao/histories_dao.dart';
import 'dao/idioms_dao.dart';
import 'dao/proverbs_dao.dart';
import 'dao/sayings_dao.dart';
import 'dao/searches_dao.dart';
import 'dao/words_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    History,
    Idiom,
    Proverb,
    Saying,
    Search,
    Word,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  HistoriesDao get historiesDao;
  IdiomsDao get idiomsDao;
  ProverbsDao get proverbsDao;
  SayingsDao get sayingsDao;
  SearchesDao get searchesDao;
  WordsDao get wordsDao;
}

Future<AppDatabase> buildInMemoryDatabase() {
  return $FloorAppDatabase
      .inMemoryDatabaseBuilder()
      .build();
}
