import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';

part 'viewer_event.dart';
part 'viewer_state.dart';

part 'viewer_bloc.freezed.dart';

class ViewerBloc extends Bloc<ViewerEvent, ViewerState> {
  ViewerBloc() : super(const _ViewerState()) {
    on<LoadWord>(_onLoadWord);
    on<LikeWord>(_onLikeWord);
    on<SaveHistoryWord>(_onSaveHistoryWord);
  }

  //final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onLoadWord(
    LoadWord event,
    Emitter<ViewerState> emit,
  ) async {
    List<String> synonyms = [], meanings = [];
    if (event.word.synonyms?.isNotEmpty ?? false) {
      synonyms = event.word.synonyms!.split(',');
    }

    meanings = cleanMeaning(event.word.meaning ?? "").split("|");

    emit(ViewerLoadedState(meanings, synonyms));
  }

  Future<void> _onLikeWord(
    LikeWord event,
    Emitter<ViewerState> emit,
  ) async {
    /*emit(const ViewerProgressState());

    try {
      await _dbRepo.updateWord(
        event.song.rid,
        event.song.title,
        event.song.content,
        !event.song.liked,
        getIso8601Date(),
      );
    } catch (e) {
      logger('Unable to update song: $e');
    }

    emit(ViewerLikedState(!event.word.liked));*/
  }

  Future<void> _onSaveHistoryWord(
    SaveHistoryWord event,
    Emitter<ViewerState> emit,
  ) async {
    /*await _dbRepo.saveHistory(
      History(song: event.song.rid, created: getCurrentDate()),
    );
    emit(ViewerHistoryState());*/
  }
}
