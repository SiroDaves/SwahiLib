import 'package:floor/floor.dart';

import '../../utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.sessionsTable)
class Session {
  @PrimaryKey()
  int? id;
  String? title;
  String? description;
  String? startsAt;
  String? endsAt;
  String? categories;
  String? speakerIds;
  String? speakerNames;
  int? room;
  bool? bookmarked;
  String? createdAt;
  String? updatedAt;

  Session({
    this.id,
    this.title,
    this.description,
    this.startsAt,
    this.endsAt,
    this.speakerIds,
    this.speakerNames,
    this.categories,
    this.room,
    this.bookmarked,
    this.createdAt,
    this.updatedAt,
  });
}
