import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/idiom.dart';
import '../../repo/db_repository.dart';
import '../../repo/storage/local_storage.dart';

@injectable
class IdiomVm with ChangeNotifierEx {
  late final IdiomNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  IdiomVm(this.dbRepo, this.localStorage);
  BuildContext? context;

  bool isLoading = false, enableWakeLock = false;
  IconData likeIcon = Icons.favorite_border;

  Idiom? idiom = Idiom();
  bool? isFavourited;
  String? itemTitle = 'Loading ...';
  List<String?> synonyms = [], meanings = [];

  Future<void> init(IdiomNavigator screenNavigator) async {
    navigator = screenNavigator;
    isLoading = true;
    notifyListeners();

    idiom = localStorage.idiom;
    itemTitle = idiom!.title;

    meanings = idiom!.meaning!
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

abstract class IdiomNavigator {}
