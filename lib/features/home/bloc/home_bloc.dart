import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../core/di/injectable.dart';
import '../domain/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<FetchData>(_onFetchData);
    on<CheckAppUpdates>(_onCheckAppUpdates);
  }

  final _dbRepo = getIt<DatabaseRepository>();
  final _homeRepo = HomeRepository();

  void _onCheckAppUpdates(
    CheckAppUpdates event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeProgressState());
    AppUpdate? appUpdate;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    var resp = await _homeRepo.fetchUpdateInfo();

    try {
      switch (resp.statusCode) {
        case 200:
          appUpdate = AppUpdate.fromJson(jsonDecode(resp.body));
          if (isNewerVersion(currentVersion, appUpdate.version!)) {
            logger("We need to upgrade from v$currentVersion to ${appUpdate.version}");
            emit(HomeUpdateAppState(true, appUpdate));
          } else {
            logger("No never version found, sticking to $currentVersion");
            emit(HomeUpdateAppState(false, appUpdate));
          }
          break;

        default:
          logger("Error finding new update info: ${resp.statusCode}");
          emit(HomeUpdateAppState(false, appUpdate!));
          break;
      }
    } catch (e) {
      logger("Error finding new update info: $e");
      emit(HomeUpdateAppState(false, appUpdate!));
    }
  }

  void _onFetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeProgressState());
    List<Idiom> idioms = [];
    List<Proverb> proverbs = [];
    List<Saying> sayings = [];
    List<Word> words = [];

    try {
      idioms = await _dbRepo.fetchIdioms();
      proverbs = await _dbRepo.fetchProverbs();
      sayings = await _dbRepo.fetchSayings();
      words = await _dbRepo.fetchWords();
      emit(HomeFetchedDataState(idioms, proverbs, sayings, words));
    } catch (e) {
      logger("Error log: $e");
      emit(HomeFetchedDataState(idioms, proverbs, sayings, words));
    }
  }
}
