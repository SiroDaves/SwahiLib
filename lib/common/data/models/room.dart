import 'package:floor/floor.dart';

import '../../utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.roomsTable)
class Room {
  @PrimaryKey()
  int? id;
  String? name;
  int? sort;
  String? createdAt;

  Room({
    this.id,
    this.name,
    this.sort,
    this.createdAt,
  });
}
