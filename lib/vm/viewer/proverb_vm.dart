import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/proverb.dart';
import '../../repo/db_repository.dart';
import '../../repo/storage/local_storage.dart';

@injectable
class ProverbVm with ChangeNotifierEx {
  late final ProverbNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  ProverbVm(this.dbRepo, this.localStorage);
  BuildContext? context;

  bool isLoading = false, enableWakeLock = false;
  IconData likeIcon = Icons.favorite_border;

  Proverb? proverb = Proverb();
  bool? isFavourited;
  String? itemTitle = 'Loading ...';
  List<String?> synonyms = [], meanings = [];

  Future<void> init(ProverbNavigator screenNavigator) async {
    navigator = screenNavigator;
    isLoading = true;
    notifyListeners();

    proverb = localStorage.proverb;
    itemTitle = proverb!.title;
    if (proverb!.synonyms!.isNotEmpty) synonyms = proverb!.synonyms!.split(',');

    meanings = proverb!.meaning!
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

abstract class ProverbNavigator {}
