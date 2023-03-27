import 'package:drift/drift.dart';

import '../../db/swahilib_db.dart';
import '../base/word.dart';


@DataClassName('DbWord')
class DbWordTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get objectId => text().unique()();

  TextColumn get title => text().withDefault(const Constant(''))();

  TextColumn get synonyms => text().withDefault(const Constant(''))();

  TextColumn get meaning => text().withDefault(const Constant(''))();

  TextColumn get conjugation => text().withDefault(const Constant(''))();

  IntColumn get views => integer().withDefault(const Constant(0))();

  IntColumn get likes => integer().withDefault(const Constant(0))();

  BoolColumn get liked => boolean().withDefault(const Constant(false))();

  TextColumn get createdAt => text().withDefault(const Constant(''))();

  TextColumn get updatedAt => text().withDefault(const Constant(''))();
}

extension DbWordExtension on DbWord {
  Word getModel() => Word(
        id: id,
        objectId: objectId,
        title: title,
        synonyms: synonyms,
        meaning: meaning,
        conjugation: conjugation,
        views: views,
        likes: likes,
        liked: liked,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension WordExtension on Word {
  DbWordTableCompanion getDbModel() {
    final id = this.id;
    return DbWordTableCompanion.insert(
      id: id == null ? const Value.absent() : Value(id),
      objectId: objectId!,
      title: Value(title!),
      synonyms: Value(synonyms!),
      meaning: Value(meaning!),
      conjugation: Value(conjugation!),
      views: Value(views!),
      likes: Value(likes!),
      liked: Value(liked!),
      createdAt: Value(createdAt!),
      updatedAt:Value( updatedAt!),
    );
  }
}
