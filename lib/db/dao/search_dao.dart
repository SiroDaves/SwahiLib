import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/search.dart';
import '../../model/tables/db_search_table.dart';
import '../swahilib_db.dart';

part 'search_dao.g.dart';

@lazySingleton
abstract class SearchDao {
  @factoryMethod
  factory SearchDao(SwahiliDB db) = _SearchDao;

  Future<List<Search>> getAllSearches();
  Future<void> createSearch(Search search);
  Future<void> deleteSearch(Search search);
  Future<void> deleteSearches();
}

@DriftAccessor(tables: [
  DbSearchTable,
])
class _SearchDao extends DatabaseAccessor<SwahiliDB>
    with _$_SearchDaoMixin
    implements SearchDao {
  _SearchDao(SwahiliDB db) : super(db);

  @override
  Future<List<Search>> getAllSearches() async {
    final Stream<List<Search>> streams = customSelect(
      'SELECT * FROM ${db.dbSearchTable.actualTableName} '
      'ORDER BY ${db.dbSearchTable.id.name} DESC;',
      readsFrom: {db.dbSearchTable},
    ).watch().map(
      (rows) {
        final List<Search> lists = [];
        for (final row in rows) {
          lists.add(
            Search(
              id: const IntType().mapFromDatabaseResponse(row.data['id'])!,
              objectId: const StringType()
                  .mapFromDatabaseResponse(row.data['object_id'])!,
              title: const StringType()
                  .mapFromDatabaseResponse(row.data['title'])!,
              createdAt: const StringType()
                  .mapFromDatabaseResponse(row.data['created_at'])!,
            ),
          );
        }
        return lists;
      },
    );
    return await streams.first;
  }

  @override
  Future<void> createSearch(Search search) => into(db.dbSearchTable).insert(
        DbSearchTableCompanion.insert(
          objectId: Value(search.objectId!),
          title: Value(search.title!),
          createdAt: Value(search.createdAt!),
        ),
      );

  @override
  Future<void> deleteSearch(Search search) =>
      (delete(db.dbSearchTable)..where((row) => row.id.equals(search.id))).go();

  @override
  Future<void> deleteSearches() => (delete(db.dbSearchTable)).go();
}
