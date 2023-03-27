import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../widget/provider/data_provider_widget.dart';

abstract class ErrorNavigator {
  String? showError(dynamic error);
}

mixin ErrorNavigatorMixin<T extends StatefulWidget> on State<T>
    implements ErrorNavigator {
  @override
  String? showError(dynamic error) {
    String key;
    if (error is String) {
      _showError(error);
      return null;
    } else if (error is LocalizedError) {
      key = error.getLocalizedKey();
    } else {
      logger.warning(
          'Caught an error that is not handled by the SongLibError $error');
      key = 'Something went wrong';
    }
    return key;
  }

  void _showError(String error) {
    final snackBar = SnackBar(
      content: DataProviderWidget(
        childBuilderTheme: (context, theme) => Text(
          error,
          //style: theme.inverseCoreTextTheme.labelButtonSmall,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
