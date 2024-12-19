import 'package:floor/floor.dart';

import '../../utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.historiesTable)
class History {
  @PrimaryKey()
  int? id;
  String? objectId;
  int? item;
  String? type;
  String? createdAt;

  History({
    this.id,
    this.objectId,
    this.item,
    this.type,
    this.createdAt,
  });

}
