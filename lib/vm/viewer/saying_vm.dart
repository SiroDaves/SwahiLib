import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/saying.dart';
import '../../repo/db_repository.dart';
import '../../repo/storage/local_storage.dart';

@injectable
class SayingVm with ChangeNotifierEx {
  late final SayingNavigator navigator;
  final DbRepository dbRepo;
  final LocalStorage localStorage;

  SayingVm(this.dbRepo, this.localStorage);
  BuildContext? context;

  bool isLoading = false, enableWakeLock = false;
  IconData likeIcon = Icons.favorite_border;

  Saying? saying = Saying();
  bool? isFavourited;
  String? itemTitle = 'Loading ...';
  List<String?> synonyms = [], meanings = [];

  Future<void> init(SayingNavigator screenNavigator) async {
    navigator = screenNavigator;
    isLoading = true;
    notifyListeners();

    saying = localStorage.saying;
    itemTitle = saying!.title;

    meanings = saying!.meaning!
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

abstract class SayingNavigator {}
