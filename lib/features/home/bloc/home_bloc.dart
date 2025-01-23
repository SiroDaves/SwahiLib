import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/pref_repository.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../common/utils/constants/pref_constants.dart';
import '../../../core/di/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<FetchData>(_onFetchData);
  }

  final _dbRepo = getIt<DatabaseRepository>();
  final _prefRepo = getIt<PrefRepository>();

  void _onFetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeProgressState());
    List<Idiom> idioms = [];
    List<Proverb> proverbs = [];
    List<Saying> sayings = [];
    List<Word> words = [];

    bool wordsLoaded = _prefRepo.getPrefBool(PrefConstants.wordsAreLoadedKey);
    try {
      idioms = await _dbRepo.fetchIdioms();
      proverbs = await _dbRepo.fetchProverbs();
      sayings = await _dbRepo.fetchSayings();
      words = wordsLoaded ? await _dbRepo.fetchWords() : _prefRepo.words!;
      emit(HomeFetchedDataState(idioms, proverbs, sayings, words));
    } catch (e) {
      logger("Error log: $e");
      emit(HomeFetchedDataState(idioms, proverbs, sayings, words));
    }
  }
}
