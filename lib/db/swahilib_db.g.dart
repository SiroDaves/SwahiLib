// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swahilib_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DbHistory extends DataClass implements Insertable<DbHistory> {
  final int id;
  final String objectId;
  final int item;
  final String type;
  final String createdAt;
  DbHistory(
      {required this.id,
      required this.objectId,
      required this.item,
      required this.type,
      required this.createdAt});
  factory DbHistory.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbHistory(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      item: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['item'] = Variable<int>(item);
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  DbHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return DbHistoryTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      item: Value(item),
      type: Value(type),
      createdAt: Value(createdAt),
    );
  }

  factory DbHistory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbHistory(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      item: serializer.fromJson<int>(json['item']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'item': serializer.toJson<int>(item),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  DbHistory copyWith(
          {int? id,
          String? objectId,
          int? item,
          String? type,
          String? createdAt}) =>
      DbHistory(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        item: item ?? this.item,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbHistory(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('item: $item, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, item, type, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbHistory &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.item == this.item &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class DbHistoryTableCompanion extends UpdateCompanion<DbHistory> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int> item;
  final Value<String> type;
  final Value<String> createdAt;
  const DbHistoryTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.item = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DbHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.item = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DbHistory> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int>? item,
    Expression<String>? type,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (item != null) 'item': item,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DbHistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int>? item,
      Value<String>? type,
      Value<String>? createdAt}) {
    return DbHistoryTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      item: item ?? this.item,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (item.present) {
      map['item'] = Variable<int>(item.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('item: $item, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DbHistoryTableTable extends DbHistoryTable
    with TableInfo<$DbHistoryTableTable, DbHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbHistoryTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _itemMeta = const VerificationMeta('item');
  @override
  late final GeneratedColumn<int?> item = GeneratedColumn<int?>(
      'item', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, objectId, item, type, createdAt];
  @override
  String get aliasedName => _alias ?? 'db_history_table';
  @override
  String get actualTableName => 'db_history_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbHistory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item']!, _itemMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbHistory.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbHistoryTableTable createAlias(String alias) {
    return $DbHistoryTableTable(attachedDatabase, alias);
  }
}

class DbIdiom extends DataClass implements Insertable<DbIdiom> {
  final int id;
  final String objectId;
  final String title;
  final String meaning;
  final int views;
  final int likes;
  final bool liked;
  final String createdAt;
  final String updatedAt;
  DbIdiom(
      {required this.id,
      required this.objectId,
      required this.title,
      required this.meaning,
      required this.views,
      required this.likes,
      required this.liked,
      required this.createdAt,
      required this.updatedAt});
  factory DbIdiom.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbIdiom(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views'])!,
      likes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    map['meaning'] = Variable<String>(meaning);
    map['views'] = Variable<int>(views);
    map['likes'] = Variable<int>(likes);
    map['liked'] = Variable<bool>(liked);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DbIdiomTableCompanion toCompanion(bool nullToAbsent) {
    return DbIdiomTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      title: Value(title),
      meaning: Value(meaning),
      views: Value(views),
      likes: Value(likes),
      liked: Value(liked),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbIdiom.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbIdiom(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      meaning: serializer.fromJson<String>(json['meaning']),
      views: serializer.fromJson<int>(json['views']),
      likes: serializer.fromJson<int>(json['likes']),
      liked: serializer.fromJson<bool>(json['liked']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'meaning': serializer.toJson<String>(meaning),
      'views': serializer.toJson<int>(views),
      'likes': serializer.toJson<int>(likes),
      'liked': serializer.toJson<bool>(liked),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  DbIdiom copyWith(
          {int? id,
          String? objectId,
          String? title,
          String? meaning,
          int? views,
          int? likes,
          bool? liked,
          String? createdAt,
          String? updatedAt}) =>
      DbIdiom(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        meaning: meaning ?? this.meaning,
        views: views ?? this.views,
        likes: likes ?? this.likes,
        liked: liked ?? this.liked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbIdiom(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('meaning: $meaning, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, objectId, title, meaning, views, likes, liked, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbIdiom &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.meaning == this.meaning &&
          other.views == this.views &&
          other.likes == this.likes &&
          other.liked == this.liked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DbIdiomTableCompanion extends UpdateCompanion<DbIdiom> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<String> title;
  final Value<String> meaning;
  final Value<int> views;
  final Value<int> likes;
  final Value<bool> liked;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const DbIdiomTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.meaning = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DbIdiomTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.title = const Value.absent(),
    this.meaning = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : objectId = Value(objectId);
  static Insertable<DbIdiom> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? meaning,
    Expression<int>? views,
    Expression<int>? likes,
    Expression<bool>? liked,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (meaning != null) 'meaning': meaning,
      if (views != null) 'views': views,
      if (likes != null) 'likes': likes,
      if (liked != null) 'liked': liked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbIdiomTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<String>? title,
      Value<String>? meaning,
      Value<int>? views,
      Value<int>? likes,
      Value<bool>? liked,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return DbIdiomTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      meaning: meaning ?? this.meaning,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      liked: liked ?? this.liked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (liked.present) {
      map['liked'] = Variable<bool>(liked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbIdiomTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('meaning: $meaning, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbIdiomTableTable extends DbIdiomTable
    with TableInfo<$DbIdiomTableTable, DbIdiom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbIdiomTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _meaningMeta = const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String?> meaning = GeneratedColumn<String?>(
      'meaning', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int?> likes = GeneratedColumn<int?>(
      'likes', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  @override
  late final GeneratedColumn<bool?> liked = GeneratedColumn<bool?>(
      'liked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (liked IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns =>
      [id, objectId, title, meaning, views, likes, liked, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'db_idiom_table';
  @override
  String get actualTableName => 'db_idiom_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbIdiom> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes']!, _likesMeta));
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked']!, _likedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbIdiom map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbIdiom.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbIdiomTableTable createAlias(String alias) {
    return $DbIdiomTableTable(attachedDatabase, alias);
  }
}

class DbProverb extends DataClass implements Insertable<DbProverb> {
  final int id;
  final String objectId;
  final String title;
  final String synonyms;
  final String meaning;
  final int views;
  final int likes;
  final bool liked;
  final String createdAt;
  final String updatedAt;
  DbProverb(
      {required this.id,
      required this.objectId,
      required this.title,
      required this.synonyms,
      required this.meaning,
      required this.views,
      required this.likes,
      required this.liked,
      required this.createdAt,
      required this.updatedAt});
  factory DbProverb.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbProverb(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      synonyms: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}synonyms'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views'])!,
      likes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    map['synonyms'] = Variable<String>(synonyms);
    map['meaning'] = Variable<String>(meaning);
    map['views'] = Variable<int>(views);
    map['likes'] = Variable<int>(likes);
    map['liked'] = Variable<bool>(liked);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DbProverbTableCompanion toCompanion(bool nullToAbsent) {
    return DbProverbTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      title: Value(title),
      synonyms: Value(synonyms),
      meaning: Value(meaning),
      views: Value(views),
      likes: Value(likes),
      liked: Value(liked),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbProverb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProverb(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      synonyms: serializer.fromJson<String>(json['synonyms']),
      meaning: serializer.fromJson<String>(json['meaning']),
      views: serializer.fromJson<int>(json['views']),
      likes: serializer.fromJson<int>(json['likes']),
      liked: serializer.fromJson<bool>(json['liked']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'synonyms': serializer.toJson<String>(synonyms),
      'meaning': serializer.toJson<String>(meaning),
      'views': serializer.toJson<int>(views),
      'likes': serializer.toJson<int>(likes),
      'liked': serializer.toJson<bool>(liked),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  DbProverb copyWith(
          {int? id,
          String? objectId,
          String? title,
          String? synonyms,
          String? meaning,
          int? views,
          int? likes,
          bool? liked,
          String? createdAt,
          String? updatedAt}) =>
      DbProverb(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        synonyms: synonyms ?? this.synonyms,
        meaning: meaning ?? this.meaning,
        views: views ?? this.views,
        likes: likes ?? this.likes,
        liked: liked ?? this.liked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbProverb(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('synonyms: $synonyms, ')
          ..write('meaning: $meaning, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, title, synonyms, meaning, views,
      likes, liked, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProverb &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.synonyms == this.synonyms &&
          other.meaning == this.meaning &&
          other.views == this.views &&
          other.likes == this.likes &&
          other.liked == this.liked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DbProverbTableCompanion extends UpdateCompanion<DbProverb> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<String> title;
  final Value<String> synonyms;
  final Value<String> meaning;
  final Value<int> views;
  final Value<int> likes;
  final Value<bool> liked;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const DbProverbTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.synonyms = const Value.absent(),
    this.meaning = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DbProverbTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.title = const Value.absent(),
    this.synonyms = const Value.absent(),
    this.meaning = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : objectId = Value(objectId);
  static Insertable<DbProverb> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? synonyms,
    Expression<String>? meaning,
    Expression<int>? views,
    Expression<int>? likes,
    Expression<bool>? liked,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (synonyms != null) 'synonyms': synonyms,
      if (meaning != null) 'meaning': meaning,
      if (views != null) 'views': views,
      if (likes != null) 'likes': likes,
      if (liked != null) 'liked': liked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbProverbTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<String>? title,
      Value<String>? synonyms,
      Value<String>? meaning,
      Value<int>? views,
      Value<int>? likes,
      Value<bool>? liked,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return DbProverbTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      synonyms: synonyms ?? this.synonyms,
      meaning: meaning ?? this.meaning,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      liked: liked ?? this.liked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (synonyms.present) {
      map['synonyms'] = Variable<String>(synonyms.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (liked.present) {
      map['liked'] = Variable<bool>(liked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbProverbTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('synonyms: $synonyms, ')
          ..write('meaning: $meaning, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbProverbTableTable extends DbProverbTable
    with TableInfo<$DbProverbTableTable, DbProverb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbProverbTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _synonymsMeta = const VerificationMeta('synonyms');
  @override
  late final GeneratedColumn<String?> synonyms = GeneratedColumn<String?>(
      'synonyms', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _meaningMeta = const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String?> meaning = GeneratedColumn<String?>(
      'meaning', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int?> likes = GeneratedColumn<int?>(
      'likes', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  @override
  late final GeneratedColumn<bool?> liked = GeneratedColumn<bool?>(
      'liked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (liked IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        title,
        synonyms,
        meaning,
        views,
        likes,
        liked,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'db_proverb_table';
  @override
  String get actualTableName => 'db_proverb_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbProverb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('synonyms')) {
      context.handle(_synonymsMeta,
          synonyms.isAcceptableOrUnknown(data['synonyms']!, _synonymsMeta));
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes']!, _likesMeta));
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked']!, _likedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbProverb map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbProverb.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbProverbTableTable createAlias(String alias) {
    return $DbProverbTableTable(attachedDatabase, alias);
  }
}

class DbSaying extends DataClass implements Insertable<DbSaying> {
  final int id;
  final String objectId;
  final String title;
  final String meaning;
  final int views;
  final int likes;
  final bool liked;
  final String createdAt;
  final String updatedAt;
  DbSaying(
      {required this.id,
      required this.objectId,
      required this.title,
      required this.meaning,
      required this.views,
      required this.likes,
      required this.liked,
      required this.createdAt,
      required this.updatedAt});
  factory DbSaying.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbSaying(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views'])!,
      likes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    map['meaning'] = Variable<String>(meaning);
    map['views'] = Variable<int>(views);
    map['likes'] = Variable<int>(likes);
    map['liked'] = Variable<bool>(liked);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DbSayingTableCompanion toCompanion(bool nullToAbsent) {
    return DbSayingTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      title: Value(title),
      meaning: Value(meaning),
      views: Value(views),
      likes: Value(likes),
      liked: Value(liked),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbSaying.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSaying(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      meaning: serializer.fromJson<String>(json['meaning']),
      views: serializer.fromJson<int>(json['views']),
      likes: serializer.fromJson<int>(json['likes']),
      liked: serializer.fromJson<bool>(json['liked']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'meaning': serializer.toJson<String>(meaning),
      'views': serializer.toJson<int>(views),
      'likes': serializer.toJson<int>(likes),
      'liked': serializer.toJson<bool>(liked),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  DbSaying copyWith(
          {int? id,
          String? objectId,
          String? title,
          String? meaning,
          int? views,
          int? likes,
          bool? liked,
          String? createdAt,
          String? updatedAt}) =>
      DbSaying(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        meaning: meaning ?? this.meaning,
        views: views ?? this.views,
        likes: likes ?? this.likes,
        liked: liked ?? this.liked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbSaying(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('meaning: $meaning, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, objectId, title, meaning, views, likes, liked, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSaying &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.meaning == this.meaning &&
          other.views == this.views &&
          other.likes == this.likes &&
          other.liked == this.liked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DbSayingTableCompanion extends UpdateCompanion<DbSaying> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<String> title;
  final Value<String> meaning;
  final Value<int> views;
  final Value<int> likes;
  final Value<bool> liked;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const DbSayingTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.meaning = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DbSayingTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.title = const Value.absent(),
    this.meaning = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : objectId = Value(objectId);
  static Insertable<DbSaying> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? meaning,
    Expression<int>? views,
    Expression<int>? likes,
    Expression<bool>? liked,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (meaning != null) 'meaning': meaning,
      if (views != null) 'views': views,
      if (likes != null) 'likes': likes,
      if (liked != null) 'liked': liked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbSayingTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<String>? title,
      Value<String>? meaning,
      Value<int>? views,
      Value<int>? likes,
      Value<bool>? liked,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return DbSayingTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      meaning: meaning ?? this.meaning,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      liked: liked ?? this.liked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (liked.present) {
      map['liked'] = Variable<bool>(liked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbSayingTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('meaning: $meaning, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbSayingTableTable extends DbSayingTable
    with TableInfo<$DbSayingTableTable, DbSaying> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSayingTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _meaningMeta = const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String?> meaning = GeneratedColumn<String?>(
      'meaning', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int?> likes = GeneratedColumn<int?>(
      'likes', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  @override
  late final GeneratedColumn<bool?> liked = GeneratedColumn<bool?>(
      'liked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (liked IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns =>
      [id, objectId, title, meaning, views, likes, liked, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'db_saying_table';
  @override
  String get actualTableName => 'db_saying_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbSaying> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes']!, _likesMeta));
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked']!, _likedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSaying map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbSaying.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbSayingTableTable createAlias(String alias) {
    return $DbSayingTableTable(attachedDatabase, alias);
  }
}

class DbSearch extends DataClass implements Insertable<DbSearch> {
  final int id;
  final String objectId;
  final String title;
  final String createdAt;
  DbSearch(
      {required this.id,
      required this.objectId,
      required this.title,
      required this.createdAt});
  factory DbSearch.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbSearch(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  DbSearchTableCompanion toCompanion(bool nullToAbsent) {
    return DbSearchTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      title: Value(title),
      createdAt: Value(createdAt),
    );
  }

  factory DbSearch.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSearch(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  DbSearch copyWith(
          {int? id, String? objectId, String? title, String? createdAt}) =>
      DbSearch(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbSearch(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, title, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSearch &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.createdAt == this.createdAt);
}

class DbSearchTableCompanion extends UpdateCompanion<DbSearch> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<String> title;
  final Value<String> createdAt;
  const DbSearchTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DbSearchTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DbSearch> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DbSearchTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<String>? title,
      Value<String>? createdAt}) {
    return DbSearchTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbSearchTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DbSearchTableTable extends DbSearchTable
    with TableInfo<$DbSearchTableTable, DbSearch> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSearchTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, objectId, title, createdAt];
  @override
  String get aliasedName => _alias ?? 'db_search_table';
  @override
  String get actualTableName => 'db_search_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbSearch> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSearch map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbSearch.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbSearchTableTable createAlias(String alias) {
    return $DbSearchTableTable(attachedDatabase, alias);
  }
}

class DbWord extends DataClass implements Insertable<DbWord> {
  final int id;
  final String objectId;
  final String title;
  final String synonyms;
  final String meaning;
  final String conjugation;
  final int views;
  final int likes;
  final bool liked;
  final String createdAt;
  final String updatedAt;
  DbWord(
      {required this.id,
      required this.objectId,
      required this.title,
      required this.synonyms,
      required this.meaning,
      required this.conjugation,
      required this.views,
      required this.likes,
      required this.liked,
      required this.createdAt,
      required this.updatedAt});
  factory DbWord.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbWord(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      synonyms: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}synonyms'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
      conjugation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}conjugation'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views'])!,
      likes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    map['synonyms'] = Variable<String>(synonyms);
    map['meaning'] = Variable<String>(meaning);
    map['conjugation'] = Variable<String>(conjugation);
    map['views'] = Variable<int>(views);
    map['likes'] = Variable<int>(likes);
    map['liked'] = Variable<bool>(liked);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DbWordTableCompanion toCompanion(bool nullToAbsent) {
    return DbWordTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      title: Value(title),
      synonyms: Value(synonyms),
      meaning: Value(meaning),
      conjugation: Value(conjugation),
      views: Value(views),
      likes: Value(likes),
      liked: Value(liked),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWord(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      synonyms: serializer.fromJson<String>(json['synonyms']),
      meaning: serializer.fromJson<String>(json['meaning']),
      conjugation: serializer.fromJson<String>(json['conjugation']),
      views: serializer.fromJson<int>(json['views']),
      likes: serializer.fromJson<int>(json['likes']),
      liked: serializer.fromJson<bool>(json['liked']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'synonyms': serializer.toJson<String>(synonyms),
      'meaning': serializer.toJson<String>(meaning),
      'conjugation': serializer.toJson<String>(conjugation),
      'views': serializer.toJson<int>(views),
      'likes': serializer.toJson<int>(likes),
      'liked': serializer.toJson<bool>(liked),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  DbWord copyWith(
          {int? id,
          String? objectId,
          String? title,
          String? synonyms,
          String? meaning,
          String? conjugation,
          int? views,
          int? likes,
          bool? liked,
          String? createdAt,
          String? updatedAt}) =>
      DbWord(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        synonyms: synonyms ?? this.synonyms,
        meaning: meaning ?? this.meaning,
        conjugation: conjugation ?? this.conjugation,
        views: views ?? this.views,
        likes: likes ?? this.likes,
        liked: liked ?? this.liked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbWord(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('synonyms: $synonyms, ')
          ..write('meaning: $meaning, ')
          ..write('conjugation: $conjugation, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, title, synonyms, meaning,
      conjugation, views, likes, liked, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWord &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.synonyms == this.synonyms &&
          other.meaning == this.meaning &&
          other.conjugation == this.conjugation &&
          other.views == this.views &&
          other.likes == this.likes &&
          other.liked == this.liked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DbWordTableCompanion extends UpdateCompanion<DbWord> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<String> title;
  final Value<String> synonyms;
  final Value<String> meaning;
  final Value<String> conjugation;
  final Value<int> views;
  final Value<int> likes;
  final Value<bool> liked;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const DbWordTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.synonyms = const Value.absent(),
    this.meaning = const Value.absent(),
    this.conjugation = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DbWordTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.title = const Value.absent(),
    this.synonyms = const Value.absent(),
    this.meaning = const Value.absent(),
    this.conjugation = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.liked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : objectId = Value(objectId);
  static Insertable<DbWord> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? synonyms,
    Expression<String>? meaning,
    Expression<String>? conjugation,
    Expression<int>? views,
    Expression<int>? likes,
    Expression<bool>? liked,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (synonyms != null) 'synonyms': synonyms,
      if (meaning != null) 'meaning': meaning,
      if (conjugation != null) 'conjugation': conjugation,
      if (views != null) 'views': views,
      if (likes != null) 'likes': likes,
      if (liked != null) 'liked': liked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbWordTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<String>? title,
      Value<String>? synonyms,
      Value<String>? meaning,
      Value<String>? conjugation,
      Value<int>? views,
      Value<int>? likes,
      Value<bool>? liked,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return DbWordTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      synonyms: synonyms ?? this.synonyms,
      meaning: meaning ?? this.meaning,
      conjugation: conjugation ?? this.conjugation,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      liked: liked ?? this.liked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (synonyms.present) {
      map['synonyms'] = Variable<String>(synonyms.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (conjugation.present) {
      map['conjugation'] = Variable<String>(conjugation.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (liked.present) {
      map['liked'] = Variable<bool>(liked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbWordTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('synonyms: $synonyms, ')
          ..write('meaning: $meaning, ')
          ..write('conjugation: $conjugation, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('liked: $liked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbWordTableTable extends DbWordTable
    with TableInfo<$DbWordTableTable, DbWord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbWordTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _synonymsMeta = const VerificationMeta('synonyms');
  @override
  late final GeneratedColumn<String?> synonyms = GeneratedColumn<String?>(
      'synonyms', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _meaningMeta = const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String?> meaning = GeneratedColumn<String?>(
      'meaning', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _conjugationMeta =
      const VerificationMeta('conjugation');
  @override
  late final GeneratedColumn<String?> conjugation = GeneratedColumn<String?>(
      'conjugation', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int?> likes = GeneratedColumn<int?>(
      'likes', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  @override
  late final GeneratedColumn<bool?> liked = GeneratedColumn<bool?>(
      'liked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (liked IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        title,
        synonyms,
        meaning,
        conjugation,
        views,
        likes,
        liked,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'db_word_table';
  @override
  String get actualTableName => 'db_word_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('synonyms')) {
      context.handle(_synonymsMeta,
          synonyms.isAcceptableOrUnknown(data['synonyms']!, _synonymsMeta));
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    }
    if (data.containsKey('conjugation')) {
      context.handle(
          _conjugationMeta,
          conjugation.isAcceptableOrUnknown(
              data['conjugation']!, _conjugationMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes']!, _likesMeta));
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked']!, _likedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbWord map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbWord.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbWordTableTable createAlias(String alias) {
    return $DbWordTableTable(attachedDatabase, alias);
  }
}

abstract class _$SwahiliDB extends GeneratedDatabase {
  _$SwahiliDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$SwahiliDB.connect(DatabaseConnection c) : super.connect(c);
  late final $DbHistoryTableTable dbHistoryTable = $DbHistoryTableTable(this);
  late final $DbIdiomTableTable dbIdiomTable = $DbIdiomTableTable(this);
  late final $DbProverbTableTable dbProverbTable = $DbProverbTableTable(this);
  late final $DbSayingTableTable dbSayingTable = $DbSayingTableTable(this);
  late final $DbSearchTableTable dbSearchTable = $DbSearchTableTable(this);
  late final $DbWordTableTable dbWordTable = $DbWordTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dbHistoryTable,
        dbIdiomTable,
        dbProverbTable,
        dbSayingTable,
        dbSearchTable,
        dbWordTable
      ];
}
