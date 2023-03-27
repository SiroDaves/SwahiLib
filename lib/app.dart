import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'navigator/main_navigator.dart';
import 'theme/theme_data.dart';
import 'util/constants/api_constants.dart';
import 'util/env/flavor_config.dart';
import 'util/i10n/app_localizations.dart';
import 'vm/global_vm.dart';
import 'widget/provider/provider_widget.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Parse().initialize(
    ApiConstants.applicationID,
    ApiConstants.parseApiUrl,
    clientKey: ApiConstants.clientKey,
    autoSendSessionId: true,
  );

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://704a7eba4e654566beb30a98e786da51@o1365314.ingest.sentry.io/6660908';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InternalApp();
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;

  const InternalApp({Key? key})
      : home = null,
        super(key: key);

  @visibleForTesting
  const InternalApp.test({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalVm>(
      lazy: FlavorConfig.isInTest(),
      create: () => GetIt.I()..init(context),
      consumer: (context, vm, consumerChild) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('sw')],
        theme: Provider.of<GlobalVm>(context).isDarkMode
            ? AppThemeData.lightTheme(vm.targetPlatform)
            : AppThemeData.darkTheme(vm.targetPlatform),
        navigatorKey: MainNavigatorState.navigationKey,
        initialRoute:
            home == null ? MainNavigatorState.initialRoute : null,
        onGenerateRoute: MainNavigatorState.onGenerateRoute,
        navigatorObservers: MainNavigatorState.navigatorObservers,
        builder: home == null
            ? (context, child) => MainNavigator(child: child)
            : null,
        home: home,
      ),
    );
  }
}
