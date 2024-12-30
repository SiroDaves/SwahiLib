import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/auth/auth_bloc.dart';
import 'common/utils/constants/pref_constants.dart';
import 'common/utils/date_util.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'core/theme/theme_data.dart';
import 'common/repository/auth_repository.dart';
import 'common/repository/local_storage.dart';
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
  late final AuthRepository _authRepo;

  @override
  void initState() {
    super.initState();
    _authRepo = AuthRepository();
  }

  @override
  void dispose() {
    _authRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepo,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepo: _authRepo),
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
    var localStorage = getIt<LocalStorage>();
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
            builder: (context, child) => BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthStatus.unauthenticated:
                    navigator.pushNamed<void>(RouteNames.signup);
                  case AuthStatus.unverified:
                    navigator.pushNamed<void>(RouteNames.login);
                  case AuthStatus.authenticated:
                    if (isLoaded) {
                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.home,
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
