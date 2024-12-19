import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/idiom.dart';

@dao
abstract class IdiomsDao {
  @Query('SELECT * FROM ${AppConstants.idiomsTable} WHERE id = :id')
  Future<Idiom?> findIdiomById(int id);

  @Query('SELECT * FROM ${AppConstants.idiomsTable}')
  Future<List<Idiom>> fetchIdioms();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertIdiom(Idiom idiom);

  @Query("DELETE FROM ${AppConstants.idiomsTable}")
  Future<void> deleteAllIdioms();
}
