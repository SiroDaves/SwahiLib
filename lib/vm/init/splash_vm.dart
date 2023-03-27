import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../repo/storage/local_storage.dart';
import '../../util/constants/pref_constants.dart';

@injectable
class SplashVm with ChangeNotifierEx {
  final LocalStorage localStorage;
  bool isLoaded = false, onBoarded = false, notificationsEnabled = false;
  late final SplashNavigator navigator;

  SplashVm(this.localStorage);

  Future<void> init(SplashNavigator screenNavigator) async {
    navigator = screenNavigator;
    isLoaded = localStorage.getPrefBool(PrefConstants.dataLoadedCheckKey);
    onBoarded = localStorage.getPrefBool(PrefConstants.onboardedCheckKey);

    await Future.delayed(const Duration(seconds: 3), () {});
    await nextActions();
  }

  Future<void> nextActions() async {
    if (isLoaded) {
      navigator.goToHome();
    } else {
      navigator.goToDataInit();
    }
  }
}

abstract class SplashNavigator {
  void goToHome();
  void goToDataInit();
}
