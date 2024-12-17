import '../../data/models/models.dart';

abstract class DatabaseRepository {
  Future<List<Bookmark>> fetchBookmarks();

  Future<void> saveBookmark(Bookmark bookmark);

  Future<void> deleteBookmark(Bookmark bookmark);

  Future<void> removeAllBookmarks();

  Future<List<Room>> fetchRooms();

  Future<void> saveRoom(Room room);

  Future<void> removeAllRooms();

  Future<List<Session>> fetchSessions();

  Future<void> saveSession(Session session);

  Future<void> bookmarkSession(int id, bool bookmark, String updated);

  Future<void> removeAllSessions();

  Future<List<Speaker>> fetchSpeakers();

  Future<void> saveSpeaker(Speaker speaker);

  Future<void> removeAllSpeakers();
}
