import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/session.dart';

@dao
abstract class SessionsDao {
  @Query('SELECT * FROM ${AppConstants.sessionsTable} WHERE id = :id')
  Future<Session?> findSessionById(int id);

  @Query('SELECT * FROM ${AppConstants.sessionsTable}')
  Future<List<Session>> fetchSessions();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSession(Session session);

  @Query(
    'UPDATE ${AppConstants.sessionsTable} '
    'SET bookmark = :bookmark, updated = :updated WHERE id = :id',
  )
  Future<void> bookmarkSession(
    int id,
    bool bookmark,
    String updated,
  );

  @Query("DELETE FROM ${AppConstants.sessionsTable}")
  Future<void> deleteAllSessions();
}
