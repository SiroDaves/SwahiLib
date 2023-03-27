import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/idiom.dart';
import '../../model/base/proverb.dart';
import '../../model/base/saying.dart';
import '../../model/base/word.dart';
import '../../repo/db_repository.dart';
import '../../repo/storage/local_storage.dart';
import '../../util/constants/api_constants.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/event_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../util/constants/utilities.dart';
import '../../webservice/app_web_service.dart';

@injectable
class DataInitVm with ChangeNotifierEx {
  final AppWebService api;
  final DbRepository db;
  final LocalStorage localStorage;

  int progress = 0;
  String state = AppConstants.appTagline;

  DataInitVm(this.api, this.db, this.localStorage);
  late final DataInitNavigator navigator;

  bool isLoading = false, hasError = false, onBoarded = false;
  String errorTitle = AppConstants.errorOccurred;
  String errorBody = AppConstants.errorOccurredBody;

  List<Idiom>? idioms = [];
  List<Proverb>? proverbs = [];
  List<Saying>? sayings = [];
  List<Word>? words = [];

  Future<void> init(DataInitNavigator screenNavigator) async {
    navigator = screenNavigator;

    await fetchData();

    await saveWords();
    await saveSayings();
    await saveProverbs();
    await saveIdioms();

    localStorage.setPrefBool(PrefConstants.dataLoadedCheckKey, true);
    navigator.goToHome();
  }

  /// Get the list of songs and save theme
  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();

    if (await isConnected()) {
      final idiomResp = await api.fetchCloudData(ApiConstants.idiom);
      if (idiomResp.id == EventConstants.requestSuccessful) {
        final idiom = Idiom();
        idioms = idiom.fromParse(idiomResp.data);
      }
      final proverbResp = await api.fetchCloudData(ApiConstants.proverb);
      if (proverbResp.id == EventConstants.requestSuccessful) {
        final proverb = Proverb();
        proverbs = proverb.fromParse(proverbResp.data);
      }
      final sayingResp = await api.fetchCloudData(ApiConstants.saying);
      if (sayingResp.id == EventConstants.requestSuccessful) {
        final saying = Saying();
        sayings = saying.fromParse(sayingResp.data);
      }
      final wordResp = await api.fetchCloudData(ApiConstants.word);
      if (wordResp.id == EventConstants.requestSuccessful) {
        final word = Word();
        words = word.fromParse(wordResp.data);
      }
    } else {
      hasError = true;
      errorTitle = AppConstants.noConnection;
      errorBody = AppConstants.noConnectionBody;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> saveWords() async {
    if (words!.isNotEmpty) {
      // ignore: avoid_print
      print('Saving the ${words!.length} words to the db');
      for (int i = 0; i < words!.length; i++) {
        try {
          progress = (i / words!.length * 100).toInt();
          switch (progress) {
            case 1:
              state = "Moja...";
              break;
            case 2:
              state = "Mbili...";
              break;
            case 3:
              state = "Tatu ...";
              break;
            case 4:
              state = "Inapakia ...";
              break;
            case 10:
              state = "Inapakia maneno ...";
              break;
            case 20:
              state = "Kuwa mvumilivu ...";
              break;
            case 40:
              state = "Mvumilivu hula mbivu ...";
              break;
            case 50:
              state = "Inapakia maneno ...";
              break;
            case 75:
              state = "Asante kwa uvumilivu wako!";
              break;
            case 85:
              state = "Hatimaye";
              break;
            case 90:
              state = "Inapakia words ...";
              break;
            case 95:
              state = "Karibu tunamalizia";
              break;
          }
          notifyListeners();

          await db.saveWord(words![i]);
        } catch (_) {}
      }
    }
  }

  Future<void> saveSayings() async {
    if (sayings!.isNotEmpty) {
      // ignore: avoid_print
      print('Saving the ${sayings!.length} sayings to the db');
      state = "Sasa yapakia misemo ...";
      notifyListeners();
      for (int i = 0; i < sayings!.length; i++) {
        try {
          progress = (i / sayings!.length * 100).toInt();
          notifyListeners();
          await db.saveSaying(sayings![i]);
        } catch (_) {}
      }
    }
  }

  Future<void> saveProverbs() async {
    if (proverbs!.isNotEmpty) {
      // ignore: avoid_print
      print('Saving the ${proverbs!.length} proverbs to the db');
      state = "Sasa yapakia methali ...";
      notifyListeners();
      for (int i = 0; i < proverbs!.length; i++) {
        try {
          progress = (i / proverbs!.length * 100).toInt();
          notifyListeners();
          await db.saveProverb(proverbs![i]);
        } catch (_) {}
      }
    }
  }

  Future<void> saveIdioms() async {
    if (idioms!.isNotEmpty) {
      // ignore: avoid_print
      print('Saving the ${idioms!.length} idioms to the db');
      state = "Sasa yapakia nahau ...";
      notifyListeners();
      for (int i = 0; i < idioms!.length; i++) {
        try {
          progress = (i / idioms!.length * 100).toInt();
          notifyListeners();
          await db.saveIdiom(idioms![i]);
        } catch (_) {}
      }
    }
  }
}

abstract class DataInitNavigator {
  void goToHome();
}
