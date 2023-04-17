import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/idiom.dart';
import '../../model/base/proverb.dart';
import '../../model/base/saying.dart';
import '../../model/base/word.dart';
import '../../repo/db_repository.dart';
import '../../repo/storage/local_storage.dart';
import '../../util/constants/app_constants.dart';

@singleton
class HomeVm with ChangeNotifierEx {
  late final HomeNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  HomeVm(this.dbRepo, this.localStorage);
  BuildContext? context;

  bool isLoading = false;
  HomeList setPage = HomeList.list1;

  List<Word>? words = [], filterWords = [];
  List<Idiom>? idioms = [], filterIdioms = [];
  List<Saying>? sayings = [], filterSayings = [];
  List<Proverb>? proverbs = [], filterProverbs = [];

  Future<void> init(HomeNavigator screenNavigator) async {
    navigator = screenNavigator;

    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData({bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();

    filterWords = words = await dbRepo.fetchWords();

    filterIdioms = idioms = await dbRepo.fetchIdioms();

    filterSayings = sayings = await dbRepo.fetchSayings();

    filterProverbs = proverbs = await dbRepo.fetchProverbs();

    isLoading = false;
    notifyListeners();
  }

  /// Open a word view
  Future<void> openWord(Word word) async {
    localStorage.word = word;
    navigator.goToWord();
  }

  /// Open an idiom view
  Future<void> openIdiom(Idiom idiom) async {
    localStorage.idiom = idiom;
    navigator.goToIdiom();
  }

  /// Open a saying view
  Future<void> openSaying(Saying saying) async {
    localStorage.saying = saying;
    navigator.goToSaying();
  }

  /// Open a proverb view
  Future<void> openProverb(Proverb proverb) async {
    localStorage.proverb = proverb;
    navigator.goToProverb();
  }

  Future<void> setLetter(String letter) async {
    isLoading = true;
    notifyListeners();

    switch (setPage) {
      case HomeList.list1:
        filterWords = words!
            .where((w) => w.title!.toLowerCase().startsWith(
                  letter.toLowerCase(),
                ))
            .toList();
        break;

      case HomeList.list2:
        filterIdioms = idioms!
            .where((i) => i.title!.toLowerCase().startsWith(
                  letter.toLowerCase(),
                ))
            .toList();
        break;

      case HomeList.list3:
        filterSayings = sayings!
            .where((s) => s.title!.toLowerCase().startsWith(
                  letter.toLowerCase(),
                ))
            .toList();
        break;

      case HomeList.list4:
        filterProverbs = proverbs!
            .where((p) => p.title!.toLowerCase().startsWith(
                  letter.toLowerCase(),
                ))
            .toList();
        break;
    }

    isLoading = false;
    notifyListeners();
  }
}

abstract class HomeNavigator {
  void goToWord();
  void goToIdiom();
  void goToSaying();
  void goToProverb();

  void goToListView();
  void goToHelpDesk();
  void goToDonation();
  void goToSettings();
}
