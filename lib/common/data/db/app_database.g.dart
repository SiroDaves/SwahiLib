// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookmarksDao? _bookmarksDaoInstance;

  RoomsDao? _roomsDaoInstance;

  SessionsDao? _sessionsDaoInstance;

  SpeakersDao? _speakersDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `bookmarks` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `session` INTEGER, `createdAt` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `rooms` (`id` INTEGER, `name` TEXT, `sort` INTEGER, `createdAt` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `sessions` (`id` INTEGER, `title` TEXT, `description` TEXT, `startsAt` TEXT, `endsAt` TEXT, `categories` TEXT, `speakerIds` TEXT, `speakerNames` TEXT, `room` INTEGER, `bookmarked` INTEGER, `createdAt` TEXT, `updatedAt` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `speakers` (`id` INTEGER, `firstName` TEXT, `lastName` TEXT, `bio` TEXT, `tagLine` TEXT, `profilePic` TEXT, `links` TEXT, `sessions` TEXT, `createdAt` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookmarksDao get bookmarksDao {
    return _bookmarksDaoInstance ??= _$BookmarksDao(database, changeListener);
  }

  @override
  RoomsDao get roomsDao {
    return _roomsDaoInstance ??= _$RoomsDao(database, changeListener);
  }

  @override
  SessionsDao get sessionsDao {
    return _sessionsDaoInstance ??= _$SessionsDao(database, changeListener);
  }

  @override
  SpeakersDao get speakersDao {
    return _speakersDaoInstance ??= _$SpeakersDao(database, changeListener);
  }
}

class _$BookmarksDao extends BookmarksDao {
  _$BookmarksDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookmarkInsertionAdapter = InsertionAdapter(
            database,
            'bookmarks',
            (Bookmark item) => <String, Object?>{
                  'id': item.id,
                  'session': item.session,
                  'createdAt': item.createdAt
                }),
        _bookmarkDeletionAdapter = DeletionAdapter(
            database,
            'bookmarks',
            ['id'],
            (Bookmark item) => <String, Object?>{
                  'id': item.id,
                  'session': item.session,
                  'createdAt': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Bookmark> _bookmarkInsertionAdapter;

  final DeletionAdapter<Bookmark> _bookmarkDeletionAdapter;

  @override
  Future<Bookmark?> findBookmarkById(int id) async {
    return _queryAdapter.query('SELECT * FROM bookmarks WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Bookmark(
            id: row['id'] as int?,
            session: row['session'] as int?,
            createdAt: row['createdAt'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Bookmark>> fetchBookmarks() async {
    return _queryAdapter.queryList('SELECT * FROM bookmarks',
        mapper: (Map<String, Object?> row) => Bookmark(
            id: row['id'] as int?,
            session: row['session'] as int?,
            createdAt: row['createdAt'] as String?));
  }

  @override
  Future<void> deleteAllBookmarks() async {
    await _queryAdapter.queryNoReturn('DELETE FROM bookmarks');
  }

  @override
  Future<void> insertBookmark(Bookmark bookmark) async {
    await _bookmarkInsertionAdapter.insert(
        bookmark, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteBookmark(Bookmark bookmark) async {
    await _bookmarkDeletionAdapter.delete(bookmark);
  }
}

class _$RoomsDao extends RoomsDao {
  _$RoomsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _roomInsertionAdapter = InsertionAdapter(
            database,
            'rooms',
            (Room item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'sort': item.sort,
                  'createdAt': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Room> _roomInsertionAdapter;

  @override
  Future<Room?> findRoomById(int id) async {
    return _queryAdapter.query('SELECT * FROM rooms WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Room(
            id: row['id'] as int?,
            name: row['name'] as String?,
            sort: row['sort'] as int?,
            createdAt: row['createdAt'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Room>> fetchRooms() async {
    return _queryAdapter.queryList('SELECT * FROM rooms',
        mapper: (Map<String, Object?> row) => Room(
            id: row['id'] as int?,
            name: row['name'] as String?,
            sort: row['sort'] as int?,
            createdAt: row['createdAt'] as String?));
  }

  @override
  Future<void> deleteAllRooms() async {
    await _queryAdapter.queryNoReturn('DELETE FROM rooms');
  }

  @override
  Future<void> insertRoom(Room room) async {
    await _roomInsertionAdapter.insert(room, OnConflictStrategy.replace);
  }
}

class _$SessionsDao extends SessionsDao {
  _$SessionsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _sessionInsertionAdapter = InsertionAdapter(
            database,
            'sessions',
            (Session item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'startsAt': item.startsAt,
                  'endsAt': item.endsAt,
                  'categories': item.categories,
                  'speakerIds': item.speakerIds,
                  'speakerNames': item.speakerNames,
                  'room': item.room,
                  'bookmarked': item.bookmarked == null
                      ? null
                      : (item.bookmarked! ? 1 : 0),
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Session> _sessionInsertionAdapter;

  @override
  Future<Session?> findSessionById(int id) async {
    return _queryAdapter.query('SELECT * FROM sessions WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Session(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            startsAt: row['startsAt'] as String?,
            endsAt: row['endsAt'] as String?,
            speakerIds: row['speakerIds'] as String?,
            speakerNames: row['speakerNames'] as String?,
            categories: row['categories'] as String?,
            room: row['room'] as int?,
            bookmarked: row['bookmarked'] == null
                ? null
                : (row['bookmarked'] as int) != 0,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Session>> fetchSessions() async {
    return _queryAdapter.queryList('SELECT * FROM sessions',
        mapper: (Map<String, Object?> row) => Session(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            startsAt: row['startsAt'] as String?,
            endsAt: row['endsAt'] as String?,
            speakerIds: row['speakerIds'] as String?,
            speakerNames: row['speakerNames'] as String?,
            categories: row['categories'] as String?,
            room: row['room'] as int?,
            bookmarked: row['bookmarked'] == null
                ? null
                : (row['bookmarked'] as int) != 0,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?));
  }

  @override
  Future<void> bookmarkSession(
    int id,
    bool bookmark,
    String updated,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE sessions SET bookmark = ?2, updated = ?3 WHERE id = ?1',
        arguments: [id, bookmark ? 1 : 0, updated]);
  }

  @override
  Future<void> deleteAllSessions() async {
    await _queryAdapter.queryNoReturn('DELETE FROM sessions');
  }

  @override
  Future<void> insertSession(Session session) async {
    await _sessionInsertionAdapter.insert(session, OnConflictStrategy.replace);
  }
}

class _$SpeakersDao extends SpeakersDao {
  _$SpeakersDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _speakerInsertionAdapter = InsertionAdapter(
            database,
            'speakers',
            (Speaker item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'bio': item.bio,
                  'tagLine': item.tagLine,
                  'profilePic': item.profilePic,
                  'links': item.links,
                  'sessions': item.sessions,
                  'createdAt': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Speaker> _speakerInsertionAdapter;

  @override
  Future<Speaker?> findSpeakerById(int id) async {
    return _queryAdapter.query('SELECT * FROM speakers WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Speaker(
            id: row['id'] as int?,
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            bio: row['bio'] as String?,
            tagLine: row['tagLine'] as String?,
            profilePic: row['profilePic'] as String?,
            links: row['links'] as String?,
            sessions: row['sessions'] as String?,
            createdAt: row['createdAt'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Speaker>> fetchSpeakers() async {
    return _queryAdapter.queryList('SELECT * FROM speakers',
        mapper: (Map<String, Object?> row) => Speaker(
            id: row['id'] as int?,
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            bio: row['bio'] as String?,
            tagLine: row['tagLine'] as String?,
            profilePic: row['profilePic'] as String?,
            links: row['links'] as String?,
            sessions: row['sessions'] as String?,
            createdAt: row['createdAt'] as String?));
  }

  @override
  Future<void> deleteAllSpeakers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM speakers');
  }

  @override
  Future<void> insertSpeaker(Speaker speaker) async {
    await _speakerInsertionAdapter.insert(speaker, OnConflictStrategy.replace);
  }
}
