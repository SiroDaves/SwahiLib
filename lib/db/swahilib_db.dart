import 'package:drift/drift.dart';

import '../model/tables/db_history_table.dart';
import '../model/tables/db_idiom_table.dart';
import '../model/tables/db_proverb_table.dart';
import '../model/tables/db_saying_table.dart';
import '../model/tables/db_search_table.dart';
import '../model/tables/db_word_table.dart';

part 'swahilib_db.g.dart';

@DriftDatabase(tables: [
  DbHistoryTable,
  DbIdiomTable,
  DbProverbTable,
  DbSayingTable,
  DbSearchTable,
  DbWordTable,
])
class SwahiliDB extends _$SwahiliDB {
  SwahiliDB(QueryExecutor db) : super(db);

  SwahiliDB.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
