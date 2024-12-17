import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/bookmark.dart';

@dao
abstract class BookmarksDao {
  @Query('SELECT * FROM ${AppConstants.bookmarksTable} WHERE id = :id')
  Future<Bookmark?> findBookmarkById(int id);

  @Query('SELECT * FROM ${AppConstants.bookmarksTable}')
  Future<List<Bookmark>> fetchBookmarks();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBookmark(Bookmark bookmark);

  @delete
  Future<void> deleteBookmark(Bookmark bookmark);

  @Query("DELETE FROM ${AppConstants.bookmarksTable}")
  Future<void> deleteAllBookmarks();
}
