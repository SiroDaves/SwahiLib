import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/saying.dart';

@dao
abstract class SayingsDao {
  @Query('SELECT * FROM ${AppConstants.sayingsTable} WHERE id = :id')
  Future<Saying?> findSayingById(int id);

  @Query('SELECT * FROM ${AppConstants.sayingsTable}')
  Future<List<Saying>> fetchSayings();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSaying(Saying saying);

  @Query("DELETE FROM ${AppConstants.sayingsTable}")
  Future<void> deleteAllSayings();
}
