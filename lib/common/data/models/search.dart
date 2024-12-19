import 'package:floor/floor.dart';

import '../../utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.searchesTable)
class Search {
  @PrimaryKey()
  int? id;
  String? objectId;
  String? title;
  String? createdAt;

  Search({
    this.id,
    this.objectId,
    this.title,
    this.createdAt,
  });

}
