import 'package:drift/drift.dart';

import '../../db/swahilib_db.dart';
import '../base/saying.dart';


@DataClassName('DbSaying')
class DbSayingTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().unique()();

  TextColumn get title => text().withDefault(const Constant(''))();

  TextColumn get meaning => text().withDefault(const Constant(''))();

  IntColumn get views => integer().withDefault(const Constant(0))();

  IntColumn get likes => integer().withDefault(const Constant(0))();

  BoolColumn get liked => boolean().withDefault(const Constant(false))();

  TextColumn get createdAt => text().withDefault(const Constant(''))();

  TextColumn get updatedAt => text().withDefault(const Constant(''))();
}

extension DbSayingExtension on DbSaying {
  Saying getModel() => Saying(
        id: id,
        objectId: objectId,
        title: title,
        meaning: meaning,
        views: views,
        likes: likes,
        liked: liked,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension SayingExtension on Saying {
  DbSayingTableCompanion getDbModel() {
    final id = this.id;
    return DbSayingTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: objectId!,
      title: Value(title!),
      meaning: Value(meaning!),
      views: Value(views!),
      likes: Value(likes!),
      liked: Value(liked!),
      createdAt: Value(createdAt!),
      updatedAt:Value( updatedAt!),
    );
  }
}
