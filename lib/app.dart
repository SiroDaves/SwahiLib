import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/auth/auth_bloc.dart';
import 'core/utils/constants/pref_constants.dart';
import 'core/utils/date_util.dart';
import 'presentation/theme/bloc/theme_bloc.dart';
import 'presentation/theme/theme_data.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/pref_repository.dart';
import 'core/di/injectable.dart';
import 'presentation/navigator/main_navigator.dart';
import 'presentation/navigator/route_names.dart';

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
  late final AuthRepository _autheRepo;

  @override
  void initState() {
    super.initState();
    _autheRepo = AuthRepository();
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
        create: (_) => AuthBloc(autheRepo: _autheRepo),
        child: const AppView(),
      ),
    );
  }
}

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
    var prefRepo = getIt<PrefRepository>();
    bool isLoaded = prefRepo.getPrefBool(PrefConstants.dataIsLoadedKey);

    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            home: widget.home,
            themeMode: prefRepo.getThemeMode(),
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
                      prefRepo.setPrefString(
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
