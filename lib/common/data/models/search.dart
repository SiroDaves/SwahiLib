import 'package:floor/floor.dart';

import '../../utils/constants/app_constants.dart';

@Entity(tableName: AppConstants.searchesTable)
class Search {
  @PrimaryKey()
  int? id;
  int? rid;
  String? title;
  String? createdAt;

  Search({
    this.id,
    this.rid,
    this.title,
    this.createdAt,
  });

}
