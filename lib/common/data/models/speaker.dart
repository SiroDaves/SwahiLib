import 'package:floor/floor.dart';

import '../../utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.speakersTable)
class Speaker {
  @PrimaryKey()
  int? id;
  String? firstName;
  String? lastName;
  String? bio;
  String? tagLine;
  String? profilePic;
  String? links;
  String? sessions;
  String? createdAt;

  Speaker({
    this.id,
    this.firstName,
    this.lastName,
    this.bio,
    this.tagLine,
    this.profilePic,
    this.links,
    this.sessions,
    this.createdAt,
  });
}
