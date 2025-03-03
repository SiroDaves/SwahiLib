import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:workmanager/workmanager.dart';

import 'app.dart';
import 'common/data/db/app_database.dart';
import 'common/data/models/word.dart';
import 'common/repository/db/database_repository_impl.dart';
import 'common/utils/app_util.dart';
import 'common/utils/constants/app_constants.dart';
import 'common/utils/constants/pref_constants.dart';
import 'common/utils/env/flavor_config.dart';
import 'common/utils/env/environments.dart';
import 'core/di/injectable.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final appDatabase = await $FloorAppDatabase
          .databaseBuilder(await AppConstants.databaseFile)
          .build();
      final dbRepo = DatabaseRepositoryImpl(appDatabase);

      switch (task) {
        case 'com.swahilib.initTask':
          logger('Background task com.swahilib.initTask has started');
          final List<dynamic> rawWords = inputData!['words'];
          final words = rawWords.map((json) => Word.fromJson(json)).toList();
          await dbRepo.saveWords(words);
          sharedPrefs.setBool(PrefConstants.wordsAreLoadedKey, true);
          logger('Background task com.swahilib.initTask has finished');
          break;
      }
    } catch (e, stack) {
      logger('Background task failed: $e\n$stack');
    }
    return Future.value(true);
  });
}

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

  Workmanager().initialize(callbackDispatcher, isInDebugMode: false);

  await SentryFlutter.init(
    (options) => options.dsn = sentryUrl,
    appRunner: () => runApp(
      const SentryWidget(child: MyApp()),
    ),
  );
}
