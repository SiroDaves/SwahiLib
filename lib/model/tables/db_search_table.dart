import 'package:drift/drift.dart';

import '../../db/swahilib_db.dart';
import '../base/search.dart';

@DataClassName('DbSearch')
class DbSearchTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().withDefault(const Constant(''))();

  TextColumn get title => text().withDefault(const Constant(''))();

  TextColumn get createdAt => text().withDefault(const Constant(''))();
}

extension DbSearchExtension on DbSearch {
  Search getModel() => Search(
        id: id,
        objectId: objectId,
        title: title,
        createdAt: createdAt,
      );
}

extension SearchExtension on Search {
  DbSearchTableCompanion getDbModel() {
    final id = this.id;
    return DbSearchTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: Value(objectId!),
      title: Value(title!),
      createdAt: Value(createdAt!),
    );
  }
}
