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

  List<Word>? words = [];
  List<Idiom>? idioms = [];
  List<Saying>? sayings = [];
  List<Proverb>? proverbs = [];

  Future<void> init(HomeNavigator screenNavigator) async {
    navigator = screenNavigator;

    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData({bool showLoading = true}) async {
    if (showLoading) isLoading = true;
    notifyListeners();

    words = await dbRepo.fetchWords();

    idioms = await dbRepo.fetchIdioms();

    sayings = await dbRepo.fetchSayings();

    proverbs = await dbRepo.fetchProverbs();

    isLoading = false;
    notifyListeners();
  }

  void openWord(Word word) async {
    localStorage.word = word;
    navigator.goToWord();
  }

  void openIdiom(Idiom idiom) async {
    localStorage.idiom = idiom;
    navigator.goToIdiom();
  }

  void openSaying(Saying saying) async {
    localStorage.saying = saying;
    navigator.goToSaying();
  }

  void openProverb(Proverb proverb) async {
    localStorage.proverb = proverb;
    navigator.goToProverb();
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
