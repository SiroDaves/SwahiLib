import 'dart:async';
import 'package:flutter/material.dart';

import 'package:icapps_architecture/icapps_architecture.dart';

import 'app.dart';
import 'architecture.dart';
import 'di/environments.dart';
import 'di/injectable.dart';
import 'util/env/flavor_config.dart';
import 'util/web/app_configurator.dart'
    if (dart.library.html) 'util/web/app_configurator_web.dart';

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureWebApp();
    await initArchitecture();

    return await appCode();
  }, (object, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      staticLogger.e('Zone error', error: object, trace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(object);
      // ignore: avoid_print
      print(trace);
    }
  });
}

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.dev);

    startApp();
  });
}
