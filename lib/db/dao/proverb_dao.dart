import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/proverb.dart';
import '../../model/tables/db_proverb_table.dart';
import '../swahilib_db.dart';

part 'proverb_dao.g.dart';

@lazySingleton
abstract class ProverbDao {
  @factoryMethod
  factory ProverbDao(SwahiliDB db) = _ProverbDao;

  Future<List<Proverb>> getAllProverbs();
  Future<void> createProverb(Proverb proverb);
  Future<void> updateProverb(Proverb proverb);
  Future<void> deleteProverb(Proverb proverb);
  Future<void> deleteProverbs();
}

@DriftAccessor(tables: [
  DbProverbTable,
])
class _ProverbDao extends DatabaseAccessor<SwahiliDB>
    with _$_ProverbDaoMixin
    implements ProverbDao {
  _ProverbDao(SwahiliDB db) : super(db);

  @override
  Future<List<Proverb>> getAllProverbs() async {
    final List<DbProverb> rows = await select(db.dbProverbTable).get();
    return rows
        .map(
          (row) => Proverb(
            id: const IntType().mapFromDatabaseResponse(row.id)!,
            title: const StringType().mapFromDatabaseResponse(row.title)!,
            meaning: const StringType().mapFromDatabaseResponse(row.meaning)!,
            synonyms: const StringType().mapFromDatabaseResponse(row.synonyms)!,
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
  Future<void> createProverb(Proverb proverb) => into(db.dbProverbTable).insert(
        DbProverbTableCompanion.insert(
          objectId: proverb.objectId!,
          title: Value(proverb.title!),
          synonyms: Value(proverb.synonyms!),
          meaning: Value(proverb.meaning!),
          views: Value(proverb.views!),
          likes: Value(proverb.likes!),
          createdAt: Value(proverb.createdAt!),
          updatedAt: Value(proverb.updatedAt!),
        ),
      );

  @override
  Future<void> updateProverb(Proverb proverb) =>
      (update(db.dbProverbTable)..where((row) => row.id.equals(proverb.id))).write(
        DbProverbTableCompanion(
          title: Value(proverb.title!),
          synonyms: Value(proverb.synonyms!),
          meaning: Value(proverb.meaning!),
          views: Value(proverb.views!),
          likes: Value(proverb.likes!),
          liked: Value(proverb.liked!),
          updatedAt: Value(proverb.updatedAt!),
        ),
      );

  @override
  Future<void> deleteProverb(Proverb proverb) =>
      (delete(db.dbProverbTable)..where((row) => row.id.equals(proverb.id))).go();

  @override
  Future<void> deleteProverbs() => (delete(db.dbProverbTable)).go();
}
