import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/models/models.dart';
import '../../../data/repository/db/database_repository.dart';
import '../../../data/repository/pref_repository.dart';
import '../../../core/utils/app_util.dart';
import '../../../core/utils/constants/pref_constants.dart';
import '../../../core/di/injectable.dart';
import '../../screens/datainit/common/data_init_utils.dart';
import '../../../domain/data_init_repository.dart';

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
    emit(const DataInitSavingState('Salia kwenye skrini hii, usiondoke!', 0));

    await Future<void>.delayed(const Duration(seconds: 3));

    logger('Now saving idioms');
    emit(const DataInitSavingState('Inapakia nahau (idioms) 527 ...', 0));
    for (int i = 0; i < event.idioms.length; i++) {
      emit(DataInitSavingState(
        'Inapakia nahau (idioms)',
        (i / event.idioms.length * 100).toInt(),
      ));
      await _dbRepo.saveIdiom(event.idioms[i]);
    }

    logger('Now saving proverbs');
    emit(const DataInitSavingState('Inapakia methali (proverbs) 382 ...', 0));
    for (int i = 0; i < event.proverbs.length; i++) {
      emit(DataInitSavingState(
        'Inapakia methali (proverbs)',
        (i / event.proverbs.length * 100).toInt(),
      ));
      await _dbRepo.saveProverb(event.proverbs[i]);
    }

    logger('Now saving sayings');
    emit(const DataInitSavingState('Inapakia misemo (sayings) 276...', 0));
    for (int i = 0; i < event.sayings.length; i++) {
      emit(DataInitSavingState(
        'Inapakia misemo (sayings)',
        (i / event.sayings.length * 100).toInt(),
      ));
      await _dbRepo.saveSaying(event.sayings[i]);
    }

    logger('Now saving words');
    emit(const DataInitSavingState('Inapakia maneno (words) 16,641 ...', 0));
    for (int i = 0; i < event.words.length; i++) {
      int progress = (i / event.words.length * 100).toInt();
      emit(DataInitSavingState(progressDesc(progress), progress));
      await _dbRepo.saveWord(event.words[i]);
    }

    _prefRepo.setPrefBool(PrefConstants.dataIsLoadedKey, true);

    emit(const DataInitSavedState());
  }
}
