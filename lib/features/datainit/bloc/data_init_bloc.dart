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
    emit(const DataInitProgressState());

    _localStorage.setPrefBool(PrefConstants.dataIsLoadedKey, true);

    emit(const DataInitSavedState());
  }
}
