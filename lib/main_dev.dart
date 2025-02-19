import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'common/utils/app_util.dart';
import 'common/utils/env/flavor_config.dart';
import 'common/utils/env/environments.dart';
import 'core/di/injectable.dart';

Future<void> main() async {
  logger('Starting app from main.dart');
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.develop,
    name: 'DEV',
    color: Colors.transparent,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );

  const supabaseUrl = String.fromEnvironment("supabaseUrl");
  const supabaseAnonKey = String.fromEnvironment("supabaseAnonKey");

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  logger('Supabase init started: $supabaseUrl');

  await configureDependencies(Environments.production);
  runApp(const MyApp());
}
