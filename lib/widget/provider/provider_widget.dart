import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../../theme/theme_data.dart';
import '../../util/i10n/app_localizations.dart';

class ProviderWidget<T extends ChangeNotifier>
    extends BaseProviderWidget<T, AppTheme, AppLocalizations> {
  const ProviderWidget({
    required T Function() create,
    Widget? child,
    Widget Function(BuildContext context, AppTheme theme,
            AppLocalizations localization)?
        childBuilder,
    Widget Function(
      BuildContext context,
      T viewModel,
      AppTheme theme,
      AppLocalizations localization,
    )?
        childBuilderWithViewModel,
    Widget? consumerChild,
    Widget Function(BuildContext context, T viewModel, Widget? child)? consumer,
    Widget Function(
      BuildContext context,
      T viewModel,
      Widget? child,
      AppTheme theme,
      AppLocalizations localization,
    )?
        consumerWithThemeAndLocalization,
    bool lazy = true,
  }) : super(
          create: create,
          child: child,
          childBuilder: childBuilder,
          childBuilderWithViewModel: childBuilderWithViewModel,
          consumerChild: consumerChild,
          consumer: consumer,
          consumerWithThemeAndLocalization: consumerWithThemeAndLocalization,
          lazy: lazy,
        );
}
