import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/utils/app_util.dart';
import '../../common/utils/constants/app_constants.dart';
import '../../common/data/db/app_database.dart';
import '../../common/repository/db/database_repository_impl.dart';
import '../../common/repository/db/database_repository.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies(String environment) async {
  logger('Using environment: $environment');
  await getIt.initGetIt(environment: environment);
  await getIt.allReady();
}

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<SharedPreferences> localStorage() => SharedPreferences.getInstance();

  @singleton
  @preResolve
  Future<AppDatabase> provideAppDatabase() async => await $FloorAppDatabase
      .databaseBuilder(await AppConstants.databaseFile)
      .build();

  @lazySingleton
  DatabaseRepository provideDatabaseRepository(AppDatabase appDatabase) =>
      DatabaseRepositoryImpl(appDatabase);
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) =>
    compute<String, dynamic>(_parseAndDecode, text);
