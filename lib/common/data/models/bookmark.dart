import 'package:floor/floor.dart';

import '../../utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.bookmarksTable)
class Bookmark {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? session;
  String? createdAt;

  Bookmark({
    this.id,
    this.session,
    this.createdAt,
  });
}

