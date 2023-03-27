import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/saying.dart';
import '../../model/tables/db_saying_table.dart';
import '../swahilib_db.dart';

part 'saying_dao.g.dart';

@lazySingleton
abstract class SayingDao {
  @factoryMethod
  factory SayingDao(SwahiliDB db) = _SayingDao;

  Future<List<Saying>> getAllSayings();
  Future<void> createSaying(Saying saying);
  Future<void> updateSaying(Saying saying);
  Future<void> deleteSaying(Saying saying);
  Future<void> deleteSayings();
}

@DriftAccessor(tables: [
  DbSayingTable,
])
class _SayingDao extends DatabaseAccessor<SwahiliDB>
    with _$_SayingDaoMixin
    implements SayingDao {
  _SayingDao(SwahiliDB db) : super(db);

  @override
  Future<List<Saying>> getAllSayings() async {
    final List<DbSaying> rows = await select(db.dbSayingTable).get();
    return rows
        .map(
          (row) => Saying(
            id: const IntType().mapFromDatabaseResponse(row.id)!,
            title: const StringType().mapFromDatabaseResponse(row.title)!,
            meaning: const StringType().mapFromDatabaseResponse(row.meaning)!,
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
  Future<void> createSaying(Saying saying) => into(db.dbSayingTable).insert(
        DbSayingTableCompanion.insert(
          objectId: saying.objectId!,
          title: Value(saying.title!),
          meaning: Value(saying.meaning!),
          views: Value(saying.views!),
          likes: Value(saying.likes!),
          createdAt: Value(saying.createdAt!),
          updatedAt: Value(saying.updatedAt!),
        ),
      );

  @override
  Future<void> updateSaying(Saying saying) =>
      (update(db.dbSayingTable)..where((row) => row.id.equals(saying.id))).write(
        DbSayingTableCompanion(
          title: Value(saying.title!),
          meaning: Value(saying.meaning!),
          views: Value(saying.views!),
          likes: Value(saying.likes!),
          liked: Value(saying.liked!),
          updatedAt: Value(saying.updatedAt!),
        ),
      );

  @override
  Future<void> deleteSaying(Saying saying) =>
      (delete(db.dbSayingTable)..where((row) => row.id.equals(saying.id))).go();

  @override
  Future<void> deleteSayings() => (delete(db.dbSayingTable)).go();
}
