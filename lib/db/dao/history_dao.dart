import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/history.dart';
import '../../model/tables/db_history_table.dart';
import '../../util/constants/utilities.dart';
import '../swahilib_db.dart';

part 'history_dao.g.dart';

@lazySingleton
abstract class HistoryDao {
  @factoryMethod
  factory HistoryDao(SwahiliDB db) = _HistoryDao;

  Future<List<History>> getHistories();
  Future<void> createHistory(History history);
  Future<void> deleteHistory(History history);
  Future<void> deleteHistories();
}

@DriftAccessor(tables: [
  DbHistoryTable,
])
class _HistoryDao extends DatabaseAccessor<SwahiliDB>
    with _$_HistoryDaoMixin
    implements HistoryDao {
  _HistoryDao(SwahiliDB db) : super(db);

  @override
  Future<List<History>> getHistories() async {
    final List<DbHistory> results = await select(db.dbHistoryTable).get();
    final List<History> histories = [];
    for (final result in results) {
      histories.add(
        History(
          id: const IntType().mapFromDatabaseResponse(result.id)!,
          item: const IntType().mapFromDatabaseResponse(result.item)!,
          objectId:
              const StringType().mapFromDatabaseResponse(result.objectId)!,
          createdAt:
              const StringType().mapFromDatabaseResponse(result.createdAt)!,
        ),
      );
    }
    return histories;
  }

  @override
  Future<void> createHistory(History history) => into(db.dbHistoryTable).insert(
        DbHistoryTableCompanion.insert(
          item: Value(history.item!),
          createdAt: Value(dateNow()),
        ),
      );

  @override
  Future<void> deleteHistory(History history) =>
      (delete(db.dbHistoryTable)..where((row) => row.id.equals(history.id)))
          .go();
  @override
  Future<void> deleteHistories() => (delete(db.dbHistoryTable)).go();
}
