import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/utils/app_util.dart';
import 'core/utils/env/flavor_config.dart';
import 'core/utils/env/environments.dart';
import 'core/di/injectable.dart';

Future<void> main() async {
  logger('Starting app from main.dart');
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.production,
    name: 'PROD',
    color: Colors.transparent,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );

  const supabaseUrl = String.fromEnvironment("supabaseUrl");
  const supabaseAnonKey = String.fromEnvironment("supabaseAnonKey");
  const sentryUrl = String.fromEnvironment("sentryUrl");

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  logger('Supabase init started: $supabaseUrl');

  await configureDependencies(Environments.production);

  await SentryFlutter.init(
    (options) => options.dsn = sentryUrl,
    appRunner: () => runApp(
      const SentryWidget(child: MyApp()),
    ),
  );
}
