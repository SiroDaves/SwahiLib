import '../util/env/flavor_config.dart';

class ThemeDurations {
  ThemeDurations._();

  static Duration get menuBackground {
    if (FlavorConfig.isInTest())
      return const Duration(
          milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(seconds: 200);
  }

  static Duration get shortAnimationDuration {
    if (FlavorConfig.isInTest())
      return const Duration(
          milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 200);
  }

  static Duration get mediumAnimationDuration {
    if (FlavorConfig.isInTest())
      return const Duration(
          milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 350);
  }

  static Duration get longAnimationDuration {
    if (FlavorConfig.isInTest())
      return const Duration(
          milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 500);
  }

  static Duration get splashAnimationDuration {
    if (FlavorConfig.isInTest())
      return const Duration(
          milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(seconds: 1, milliseconds: 500);
  }

  static Duration get demoNetworkCallDuration {
    if (FlavorConfig.isInTest())
      return const Duration(
          milliseconds: 1); //AnimatedWidget cannot have a zero duration
    return const Duration(milliseconds: 800);
  }
}
