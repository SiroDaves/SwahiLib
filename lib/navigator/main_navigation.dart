import 'package:flutter/material.dart';

abstract class MainNavigation {
  void goBack<T>({T? result});

  void goToSplash();
  void goToDataInit();
  void goToHome();
  void goToIdiom();
  void goToProverb();
  void goToSaying();
  void goToWord();
  void goToListView();
  void goToSettings();
  void goToHelpDesk();
  void goToDonation();
  void closeDialog();

  void showCustomDialog<T>({required WidgetBuilder builder});
}

mixin MainNavigationMixin<T extends StatefulWidget> on State<T>
    implements MainNavigation {}
