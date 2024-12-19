import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/proverb.dart';

@dao
abstract class ProverbsDao {
  @Query('SELECT * FROM ${AppConstants.proverbsTable} WHERE id = :id')
  Future<Proverb?> findProverbById(int id);

  @Query('SELECT * FROM ${AppConstants.proverbsTable}')
  Future<List<Proverb>> fetchProverbs();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProverb(Proverb proverb);

  @Query("DELETE FROM ${AppConstants.proverbsTable}")
  Future<void> deleteAllProverbs();
}
