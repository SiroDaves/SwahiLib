import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../view/home/home_screen.dart';
import '../view/info/donation_screen.dart';
import '../view/info/helpdesk_screen.dart';
import '../view/manage/settings_screen.dart';
import '../view/init/data_init.dart';
import '../view/splash_screen.dart';
import '../util/env/flavor_config.dart';
import '../view/viewer/idiom_view.dart';
import '../view/viewer/proverb_view.dart';
import '../view/viewer/saying_view.dart';
import '../view/viewer/word_view.dart';
import '../widget/general/text_scale_factor.dart';
import 'main_navigation.dart';

class MainNavigator extends StatefulWidget {
  final Widget? child;

  const MainNavigator({this.child, Key? key}) : super(key: key);

  @override
  MainNavigatorState createState() => MainNavigatorState();

  static MainNavigationMixin of(BuildContext context,
      {bool rootNavigator = false}) {
    final navigator = rootNavigator
        ? context.findRootAncestorStateOfType<MainNavigationMixin>()
        : context.findAncestorStateOfType<MainNavigationMixin>();
    assert(() {
      if (navigator == null) {
        throw FlutterError(
            'MainNavigation operation requested with a context that does not include a MainNavigation.\n'
            'The context used to push or pop routes from the MainNavigation must be that of a '
            'widget that is a descendant of a MainNavigator widget.');
      }
      return true;
    }());
    return navigator!;
  }
}

class MainNavigatorState extends State<MainNavigator>
    with MainNavigationMixin {
  static final GlobalKey<NavigatorState> _navigationKey =
      GlobalKey<NavigatorState>();
  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute =>
      FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  NavigatorState get navigator => _navigationKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return TextScaleFactor(
      child: widget.child ?? const SizedBox.shrink(),
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final strippedPath = settings.name?.replaceFirst('/', '');
    switch (strippedPath) {
      case '':
      case SplashScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case DataInit.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const DataInit(),
          settings: settings,
        );
      case HomeScreen.routeName:
        return FadeInRoute<void>(
          child: const HomeScreen(),
          settings: settings,
        );
      case IdiomView.routeName:
        return FadeInRoute<void>(
          child: const IdiomView(),
          settings: settings,
        );
      case ProverbView.routeName:
        return FadeInRoute<void>(
          child: const ProverbView(),
          settings: settings,
        );
      case SayingView.routeName:
        return FadeInRoute<void>(
          child: const SayingView(),
          settings: settings,
        );
      case WordView.routeName:
        return FadeInRoute<void>(
          child: const WordView(),
          settings: settings,
        );
      case SettingsScreen.routeName:
        return FadeInRoute<void>(
          child: const SettingsScreen(),
          settings: settings,
        );
      case HelpDeskScreen.routeName:
        return FadeInRoute<void>(
          child: const HelpDeskScreen(),
          settings: settings,
        );
      case DonationScreen.routeName:
        return FadeInRoute<void>(
          child: const DonationScreen(),
          settings: settings,
        );
      case 'test_route':
        if (!FlavorConfig.isInTest()) return null;
        return MaterialPageRoute<void>(
          builder: (context) => Container(color: Colors.grey),
          settings: settings,
        );
      default:
        return null;
    }
  }

  @override
  void goToSplash() => navigator.pushReplacementNamed(SplashScreen.routeName);

  @override
  void goToDataInit() => navigator.pushReplacementNamed(DataInit.routeName);

  @override
  void goToHome() =>
      navigator.pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);

  @override
  void goToIdiom() => navigator.pushNamed(IdiomView.routeName);

  @override
  void goToProverb() => navigator.pushNamed(ProverbView.routeName);

  @override
  void goToSaying() => navigator.pushNamed(SayingView.routeName);

  @override
  void goToWord() => navigator.pushNamed(WordView.routeName);

  @override
  void goToSettings() => navigator.pushNamed(SettingsScreen.routeName);

  @override
  void goToHelpDesk() => navigator.pushNamed(HelpDeskScreen.routeName);

  @override
  void goToDonation() => navigator.pushNamed(DonationScreen.routeName);

  @override
  void closeDialog() => navigator.pop();

  @override
  void goBack<T>({T? result}) => navigator.pop(result);

  @override
  Future<T?> showCustomDialog<T>({required WidgetBuilder builder}) =>
      showDialog<T>(
        context: _navigationKey.currentContext!,
        builder: builder,
        useRootNavigator: true,
        barrierColor: Colors.black,
      );

  @override
  void goToListView() {
    // TODO: implement goToListView
  }
}
