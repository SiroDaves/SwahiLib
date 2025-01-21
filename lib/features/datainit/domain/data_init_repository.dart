import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';

class DataInitRepository {
  final supabase = Supabase.instance.client;

  Future<List<Idiom>> fetchIdioms() async {
    List<Idiom> idioms = [];
    try {
      final idiomsData = await supabase.from('idioms').select();
      if (idiomsData.isNotEmpty) {
        idioms = idiomsData.map((item) => Idiom.fromJson(item)).toList();
      }
    } catch (e) {
      logger('Unable to fetch idioms: $e');
    }
    return idioms;
  }

  Future<List<Proverb>> fetchProverbs() async {
    List<Proverb> proverbs = [];
    try {
      final proverbsData = await supabase.from('proverbs').select();
      if (proverbsData.isNotEmpty) {
        proverbs = proverbsData.map((item) => Proverb.fromJson(item)).toList();
      }
    } catch (e) {
      logger('Unable to fetch proverbs: $e');
    }
    return proverbs;
  }

  Future<List<Saying>> fetchSayings() async {
    List<Saying> sayings = [];
    try {
      final sayingsData = await supabase.from('sayings').select();
      if (sayingsData.isNotEmpty) {
        sayings = sayingsData.map((item) => Saying.fromJson(item)).toList();
      }
    } catch (e) {
      logger('Unable to fetch sayings: $e');
    }
    return sayings;
  }

  Future<List<Word>> fetchWords() async {
    List<Word> words = [];
    try {
      final wordsData = await supabase.from('words').select();
      if (wordsData.isNotEmpty) {
        words = wordsData.map((item) => Word.fromJson(item)).toList();
      }
    } catch (e) {
      logger('Unable to fetch words: $e');
    }
    return words;
  }
}
