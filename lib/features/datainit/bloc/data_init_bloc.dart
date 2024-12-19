import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/api_constants.dart';
import '../../../common/utils/constants/pref_constants.dart';
import '../../../common/repository/local_storage.dart';
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

  final _dataInitRepo = DataInitRepository();
  final _localStorage = getIt<LocalStorage>();
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

    try {
      var idiomsResp = await _dataInitRepo.getData(ApiConstants.idioms);
      if (idiomsResp.statusCode == 200) {
        List<dynamic> dataList = List<Map<String, dynamic>>.from(
          jsonDecode(idiomsResp.body),
        );
        idioms = dataList.map((item) => Idiom.fromJson(item)).toList();
      }
    } catch (e) {
      logger('Unable to fetch idioms');
    }
    emit(DataInitFetchedState(idioms, proverbs, sayings, words));
  }

  void _onSaveData(
    SaveData event,
    Emitter<DataInitState> emit,
  ) async {
    emit(DataInitProgressState());

    if (event.words.isNotEmpty) {
      for (int i = 0; i < event.words.length; i++) {
        try {
          String feedback = '';
          int progress = (i / event.words.length * 100).toInt();

          switch (progress) {
            case 1:
              feedback = "On your\nmarks ...";
              break;
            case 5:
              feedback = "Set,\nReady ...";
              break;
            case 10:
              feedback = "Loading\nsongs ...";
              break;
            case 20:
              feedback = "Patience\npays ...";
              break;
            case 40:
              feedback = "Loading\nsongs ...";
              break;
            case 75:
              feedback = "Thanks for\nyour patience!";
              break;
            case 85:
              feedback = "Finishing up";
              break;
            case 95:
              feedback = "Almost done";
              break;
          }
          emit(DataInitSavingState(progress, feedback));
          await _dbRepo.saveSong(event.songs[i]);
        } catch (_) {}
      }
    }

    _localStorage.setPrefBool(PrefConstants.dataIsLoadedKey, true);
    
    emit(const DataInitSavedState());
  }
}
