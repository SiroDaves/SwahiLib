import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../core/di/injectable.dart';
import '../domain/data_init_repository.dart';

part 'data_init_event.dart';
part 'data_init_state.dart';

part 'data_init_bloc.freezed.dart';

class DataInitBloc extends Bloc<DataInitEvent, DataInitState> {
  DataInitBloc() : super(const _DataInitState()) {
    on<FetchData>(_onFetchData);
    on<SaveData>(_onSaveData);
  }
  
  final _dataRepo = DataInitRepository(Supabase.instance.client);
  //final _prefRepo = getIt<PrefRepository>();
  final _dbRepo = getIt<DatabaseRepository>();

  void _onFetchData(
    FetchData event,
    Emitter<DataInitState> emit,
  ) async {
    List<Idiom> idioms = [];
    List<Proverb> proverbs = [];
    List<Saying> sayings = [];
    List<Word> words = [];
    emit(const DataInitProgressState());

    idioms = await _dataRepo.fetchIdioms();
    proverbs = await _dataRepo.fetchProverbs();
    sayings = await _dataRepo.fetchSayings();
    words = await _dataRepo.fetchWords();

    emit(DataInitFetchedState(idioms, proverbs, sayings, words));
  }

  void _onSaveData(
    SaveData event,
    Emitter<DataInitState> emit,
  ) async {
    emit(const DataInitProgressState());

    await _dbRepo.saveIdioms(event.idioms);
    await _dbRepo.saveProverbs(event.proverbs);
    await _dbRepo.saveSayings(event.sayings);
    // _dbRepo.saveWords(event.words);

    //_prefRepo.setPrefBool(PrefConstants.dataIsLoadedKey, true);

    emit(const DataInitSavedState());
  }
}
