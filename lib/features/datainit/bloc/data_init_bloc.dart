import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../common/repository/pref_repository.dart';
import '../../../common/utils/constants/pref_constants.dart';
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
  final _prefRepo = getIt<PrefRepository>();
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

  List<List<Word>> splitIntoBatches(List<Word> words, int batchSize) {
    List<List<Word>> batches = [];
    for (int i = 0; i < words.length; i += batchSize) {
      final end = (i + batchSize).clamp(0, words.length);
      batches.add(words.sublist(i, end));
    }
    return batches;
  }

  void _onSaveData(
    SaveData event,
    Emitter<DataInitState> emit,
  ) async {
    emit(const DataInitSavingState('Salia kwenye skrini hii, usiondoke!'));

    await Future<void>.delayed(const Duration(seconds: 3));

    emit(const DataInitSavingState('Inapakia nahau (idioms) 527 ...'));
    await _dbRepo.saveIdioms(event.idioms);

    emit(const DataInitSavingState('Inapakia methali (proverbs) 382 ...'));
    await _dbRepo.saveProverbs(event.proverbs);

    emit(const DataInitSavingState('Inapakia misemo (sayings) 276...'));
    await _dbRepo.saveSayings(event.sayings);

    emit(const DataInitSavingState('Inapakia maneno (words) 16,641 ...'));

    _dbRepo.saveWords(event.words);

    _prefRepo.setPrefBool(PrefConstants.dataIsLoadedKey, true);

    emit(const DataInitSavedState());
  }
}
