import 'package:drift/drift.dart';

import '../../db/swahilib_db.dart';
import '../base/history.dart';

@DataClassName('DbHistory')
class DbHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withDefault(const Constant(''))();

  IntColumn get item => integer().withDefault(const Constant(0))();

  TextColumn get type => text().withDefault(const Constant(''))();

  TextColumn get createdAt => text().withDefault(const Constant(''))();
}

extension DbHistoryExtension on DbHistory {
  History getModel() => History(
        id: id,
        objectId: objectId,
        item: item,
        type: type,
        createdAt: createdAt,
      );
}

extension HistoryExtension on History {
  DbHistoryTableCompanion getDbModel() {
    final id = this.id;
    return DbHistoryTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: Value(objectId!),
      item: Value(item!),
      type: Value(type!),
      createdAt: Value(createdAt!),
    );
  }
}
