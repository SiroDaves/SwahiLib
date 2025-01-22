import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/authe/authe_bloc.dart';
import 'common/utils/constants/pref_constants.dart';
import 'common/utils/date_util.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'core/theme/theme_data.dart';
import 'common/repository/authe_repository.dart';
import 'common/repository/pref_repository.dart';
import 'core/di/injectable.dart';
import 'core/navigator/main_navigator.dart';
import 'core/navigator/route_names.dart';

class MyApp extends StatefulWidget {
  final Widget? home;
  const MyApp({super.key, this.home});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final navigatorKey = MainNavigatorState.navigationKey;
  NavigatorState get navigator =>
      MainNavigatorState.navigationKey.currentState!;
  late final AutheRepository _autheRepo;

  @override
  void initState() {
    super.initState();
    _autheRepo = AutheRepository();
  }

  @override
  void dispose() {
    _autheRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _autheRepo,
      child: BlocProvider(
        create: (_) => AutheBloc(autheRepo: _autheRepo),
        child: const AppView(),
      ),
    );
  }
}

/// A widget that builds the main view of the application. It sets up the
/// necessary providers and handles navigation and theming.
///
/// The [AppView] widget can optionally take a [home] widget to display as the
/// initial screen.
class AppView extends StatefulWidget {
  final Widget? home;
  const AppView({super.key, this.home});

  @override
  State<AppView> createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  final navigatorKey = MainNavigatorState.navigationKey;
  NavigatorState get navigator =>
      MainNavigatorState.navigationKey.currentState!;

  @override
  Widget build(BuildContext context) {
    var localStorage = getIt<PrefRepository>();
    bool isLoaded = localStorage.getPrefBool(PrefConstants.dataIsLoadedKey);

    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            home: widget.home,
            themeMode: localStorage.getThemeMode(),
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: MainNavigatorState.initialRoute,
            onGenerateRoute: MainNavigatorState.onGenerateRoute,
            builder: (context, child) => BlocListener<AutheBloc, AutheState>(
              listener: (context, state) {
                switch (state.status) {
                  case AutheStatus.unauthenticated:
                    navigator.pushNamed<void>(RouteNames.signup);
                  case AutheStatus.unverified:
                    navigator.pushNamed<void>(RouteNames.login);
                  case AutheStatus.authenticated:
                    if (isLoaded) {
                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.dataInit,
                        (route) => false,
                      );
                    } else {
                      localStorage.setPrefString(
                        PrefConstants.dateInstalledKey,
                        dateNow(),
                      );

                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.dataInit,
                        (route) => false,
                      );
                    }
                }
              },
              child: child,
            ),
          );
        },
      ),
    );
  }
}
