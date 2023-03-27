import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../navigator/mixin/back_navigator.dart';
import '../../repo/db_repository.dart';
import '../../repo/storage/local_storage.dart';

@injectable
class SettingsVm with ChangeNotifierEx {
  late final SettingsNavigator navigator;
  final LocalStorage localStorage;
  final DbRepository dbRepo;

  SettingsVm(this.dbRepo, this.localStorage);

  Future<void> init(SettingsNavigator screenNavigator) async {
    navigator = screenNavigator;
  }

  void onBackPressed() => navigator.goBack<void>();
}

abstract class SettingsNavigator implements BackNavigator {
  void goToHome();

  void goToDataInit();
}
