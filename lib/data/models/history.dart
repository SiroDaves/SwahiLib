import 'package:floor/floor.dart';

import '../../core/utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.historiesTable)
class History {
  @PrimaryKey()
  int? id;
  int? rid;
  int? item;
  String? type;
  String? createdAt;

  History({
    this.id,
    this.rid,
    this.item,
    this.type,
    this.createdAt,
  });

}
