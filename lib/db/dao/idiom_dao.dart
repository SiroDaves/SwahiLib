import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/idiom.dart';
import '../../model/tables/db_idiom_table.dart';
import '../swahilib_db.dart';

part 'idiom_dao.g.dart';

@lazySingleton
abstract class IdiomDao {
  @factoryMethod
  factory IdiomDao(SwahiliDB db) = _IdiomDao;

  Future<List<Idiom>> getAllIdioms();
  Future<void> createIdiom(Idiom idiom);
  Future<void> updateIdiom(Idiom idiom);
  Future<void> deleteIdiom(Idiom idiom);
  Future<void> deleteIdioms();
}

@DriftAccessor(tables: [
  DbIdiomTable,
])
class _IdiomDao extends DatabaseAccessor<SwahiliDB>
    with _$_IdiomDaoMixin
    implements IdiomDao {
  _IdiomDao(SwahiliDB db) : super(db);

  @override
  Future<List<Idiom>> getAllIdioms() async {
    final List<DbIdiom> rows = await select(db.dbIdiomTable).get();
    return rows
        .map(
          (row) => Idiom(
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
  Future<void> createIdiom(Idiom idiom) => into(db.dbIdiomTable).insert(
        DbIdiomTableCompanion.insert(
          objectId: idiom.objectId!,
          title: Value(idiom.title!),
          meaning: Value(idiom.meaning!),
          views: Value(idiom.views!),
          likes: Value(idiom.likes!),
          createdAt: Value(idiom.createdAt!),
          updatedAt: Value(idiom.updatedAt!),
        ),
      );

  @override
  Future<void> updateIdiom(Idiom idiom) =>
      (update(db.dbIdiomTable)..where((row) => row.id.equals(idiom.id))).write(
        DbIdiomTableCompanion(
          title: Value(idiom.title!),
          meaning: Value(idiom.meaning!),
          views: Value(idiom.views!),
          likes: Value(idiom.likes!),
          liked: Value(idiom.liked!),
          updatedAt: Value(idiom.updatedAt!),
        ),
      );

  @override
  Future<void> deleteIdiom(Idiom idiom) =>
      (delete(db.dbIdiomTable)..where((row) => row.id.equals(idiom.id))).go();

  @override
  Future<void> deleteIdioms() => (delete(db.dbIdiomTable)).go();
}
