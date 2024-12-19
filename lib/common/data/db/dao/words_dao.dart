import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/word.dart';

@dao
abstract class WordsDao {
  @Query('SELECT * FROM ${AppConstants.wordsTable} WHERE id = :id')
  Future<Word?> findWordById(int id);

  @Query('SELECT * FROM ${AppConstants.wordsTable}')
  Future<List<Word>> fetchWords();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWord(Word word);

  @Query("DELETE FROM ${AppConstants.wordsTable}")
  Future<void> deleteAllWords();
}
