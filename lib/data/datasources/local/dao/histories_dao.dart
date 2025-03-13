import 'package:floor/floor.dart';

import '../../../../core/utils/constants/app_constants.dart';
import '../../../models/history.dart';

@dao
abstract class HistoriesDao {
  @Query('SELECT * FROM ${AppConstants.historiesTable} WHERE id = :id')
  Future<History?> findHistoryById(int id);

  @Query('SELECT * FROM ${AppConstants.historiesTable}')
  Future<List<History>> fetchHistories();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertHistory(History history);

  @Query("DELETE FROM ${AppConstants.historiesTable}")
  Future<void> deleteAllHistories();
}
