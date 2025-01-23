import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';

class DataInitRepository {
  final SupabaseClient supabase;

  DataInitRepository(this.supabase);

  Future<List<Idiom>> fetchIdioms() async {
    logger('Now fetching idioms');
    try {
      final idiomsData = await Supabase.instance.client.from('idioms').select();
      if (idiomsData.isNotEmpty) {
        final idioms =
            (idiomsData as List).map((item) => Idiom.fromJson(item)).toList();
        logger('${idioms.length} idioms fetched');
        return idioms;
      }
    } catch (e) {
      logger('Unable to fetch idioms: $e');
    }
    return [];
  }

  Future<List<Proverb>> fetchProverbs() async {
    logger('Now fetching proverbs');
    try {
      final proverbsData = await supabase.from('proverbs').select();
      if (proverbsData.isNotEmpty) {
        final proverbs = (proverbsData as List)
            .map((item) => Proverb.fromJson(item))
            .toList();
        logger('${proverbs.length} proverbs fetched');
        return proverbs;
      }
    } catch (e) {
      logger('Unable to fetch proverbs: $e');
    }
    return [];
  }

  Future<List<Saying>> fetchSayings() async {
    logger('Now fetching sayings');
    try {
      final sayingsData = await supabase.from('sayings').select();
      if (sayingsData.isNotEmpty) {
        final sayings =
            (sayingsData as List).map((item) => Saying.fromJson(item)).toList();
        logger('${sayings.length} sayings fetched');
        return sayings;
      }
    } catch (e) {
      logger('Unable to fetch sayings: $e');
    }
    return [];
  }

  Future<List<Word>> fetchWords() async {
    logger('Now fetching words');
    try {
      final wordsData = await supabase.from('words').select();
      if (wordsData.isNotEmpty) {
        final words =
            (wordsData as List).map((item) => Word.fromJson(item)).toList();
        logger('${words.length} words fetched');
        return words;
      }
    } catch (e) {
      logger('Unable to fetch words: $e');
    }
    return [];
  }
}
