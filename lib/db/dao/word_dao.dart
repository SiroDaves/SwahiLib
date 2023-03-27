import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/word.dart';
import '../../model/tables/db_word_table.dart';
import '../swahilib_db.dart';

part 'word_dao.g.dart';

@lazySingleton
abstract class WordDao {
  @factoryMethod
  factory WordDao(SwahiliDB db) = _WordDao;

  Future<List<Word>> getAllWords();
  Future<void> createWord(Word word);
  Future<void> updateWord(Word word);
  Future<void> deleteWord(Word word);
  Future<void> deleteWords();
}

@DriftAccessor(tables: [
  DbWordTable,
])
class _WordDao extends DatabaseAccessor<SwahiliDB>
    with _$_WordDaoMixin
    implements WordDao {
  _WordDao(SwahiliDB db) : super(db);

  @override
  Future<List<Word>> getAllWords() async {
    final List<DbWord> rows = await select(db.dbWordTable).get();
    return rows
        .map(
          (row) => Word(
            id: const IntType().mapFromDatabaseResponse(row.id)!,
            title: const StringType().mapFromDatabaseResponse(row.title)!,
            meaning: const StringType().mapFromDatabaseResponse(row.meaning)!,
            synonyms: const StringType().mapFromDatabaseResponse(row.synonyms)!,
            conjugation: const StringType().mapFromDatabaseResponse(row.conjugation)!,
            views: const IntType().mapFromDatabaseResponse(row.views)!,
            likes: const IntType().mapFromDatabaseResponse(row.likes)!,
            liked: const BoolType().mapFromDatabaseResponse(row.liked)!,
            objectId: const StringType().mapFromDatabaseResponse(row.objectId)!,
            createdAt:
                const StringType().mapFromDatabaseResponse(row.createdAt)!,
            updatedAt:
                const StringType().mapFromDatabaseResponse(row.updatedAt)!,
          ),
        )
        .toList();
  }

  @override
  Future<void> createWord(Word word) => into(db.dbWordTable).insert(
        DbWordTableCompanion.insert(
          objectId: word.objectId!,
          title: Value(word.title!),
          synonyms: Value(word.synonyms!),
          meaning: Value(word.meaning!),
          conjugation: Value(word.conjugation!),
          views: Value(word.views!),
          likes: Value(word.likes!),
          createdAt: Value(word.createdAt!),
          updatedAt: Value(word.updatedAt!),
        ),
      );

  @override
  Future<void> updateWord(Word word) =>
      (update(db.dbWordTable)..where((row) => row.id.equals(word.id))).write(
        DbWordTableCompanion(
          title: Value(word.title!),
          synonyms: Value(word.synonyms!),
          meaning: Value(word.meaning!),
          conjugation: Value(word.conjugation!),
          views: Value(word.views!),
          likes: Value(word.likes!),
          liked: Value(word.liked!),
          updatedAt: Value(word.updatedAt!),
        ),
      );

  @override
  Future<void> deleteWord(Word word) =>
      (delete(db.dbWordTable)..where((row) => row.id.equals(word.id))).go();

  @override
  Future<void> deleteWords() => (delete(db.dbWordTable)).go();
}
