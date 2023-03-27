import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/word.dart';
import '../../repo/db_repository.dart';
import '../../repo/storage/local_storage.dart';

@injectable
class WordVm with ChangeNotifierEx {
  late final WordNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  WordVm(this.dbRepo, this.localStorage);
  BuildContext? context;

  bool isLoading = false, enableWakeLock = false;
  IconData likeIcon = Icons.favorite_border;

  Word? word = Word();
  bool? isFavourited;
  String? itemTitle = 'Loading ...', conjugation = '';
  List<String?> synonyms = [], meanings = [];

  Future<void> init(WordNavigator screenNavigator) async {
    navigator = screenNavigator;
    isLoading = true;
    notifyListeners();

    word = localStorage.word;
    itemTitle = word!.title;
    conjugation = word!.conjugation;
    if (word!.synonyms!.isNotEmpty) synonyms = word!.synonyms!.split(',');

    meanings = word!.meaning!
        .replaceAll("\\", "")
        .replaceAll('"', '')
        .replaceAll(',', ', ')
        .replaceAll('  ', ' ')
        .split("|");
    //isFavourited(int favorite) => favorite == 1;
    isLoading = false;
    notifyListeners();
  }
}

abstract class WordNavigator {}
