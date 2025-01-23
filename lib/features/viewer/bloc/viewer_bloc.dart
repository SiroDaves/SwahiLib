import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/models/models.dart';

part 'viewer_event.dart';
part 'viewer_state.dart';

part 'viewer_bloc.freezed.dart';

class ViewerBloc extends Bloc<ViewerEvent, ViewerState> {
  ViewerBloc() : super(const _ViewerState()) {
    on<LoadIdiom>(_onLoadIdiom);
    on<LikeIdiom>(_onLikeIdiom);
    on<SaveHistoryIdiom>(_onSaveHistoryIdiom);

    on<LoadProverb>(_onLoadProverb);
    on<LikeProverb>(_onLikeProverb);
    on<SaveHistoryProverb>(_onSaveHistoryProverb);

    on<LoadSaying>(_onLoadSaying);
    on<LikeSaying>(_onLikeSaying);
    on<SaveHistorySaying>(_onSaveHistorySaying);

    on<LoadWord>(_onLoadWord);
    on<LikeWord>(_onLikeWord);
    on<SaveHistoryWord>(_onSaveHistoryWord);
  }

  //final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onLoadIdiom(
    LoadIdiom event,
    Emitter<ViewerState> emit,
  ) async {
    emit(const ViewerProgressState());
    List<String> synonyms = [], meanings = [];

    meanings = event.idiom.meaning!
        .replaceAll("\\", "")
        .replaceAll('"', '')
        .replaceAll(',', ', ')
        .replaceAll('  ', ' ')
        .split("|");

    emit(ViewerLoadedState(meanings, synonyms));
  }

  Future<void> _onLikeIdiom(
    LikeIdiom event,
    Emitter<ViewerState> emit,
  ) async {
    /*emit(const ViewerProgressState());

    try {
      await _dbRepo.updateIdiom(
        event.song.rid,
        event.song.title,
        event.song.content,
        !event.song.liked,
        getIso8601Date(),
      );
    } catch (e) {
      logger('Unable to update song: $e');
    }

    emit(ViewerLikedState(!event.idiom.liked));*/
  }

  Future<void> _onSaveHistoryIdiom(
    SaveHistoryIdiom event,
    Emitter<ViewerState> emit,
  ) async {
    /*await _dbRepo.saveHistory(
      History(song: event.song.rid, created: getCurrentDate()),
    );
    emit(ViewerHistoryState());*/
  }

  Future<void> _onLoadProverb(
    LoadProverb event,
    Emitter<ViewerState> emit,
  ) async {
    emit(const ViewerProgressState());
    List<String> synonyms = [], meanings = [];

    if (event.proverb.synonyms!.isNotEmpty) {
      synonyms = event.proverb.synonyms!.split(',');
    }

    meanings = event.proverb.synonyms!
        .replaceAll("\\", "")
        .replaceAll('"', '')
        .replaceAll(',', ', ')
        .replaceAll('  ', ' ')
        .split("|");

    emit(ViewerLoadedState(meanings, synonyms));
  }

  Future<void> _onLikeProverb(
    LikeProverb event,
    Emitter<ViewerState> emit,
  ) async {
    /*emit(const ViewerProgressState());

    try {
      await _dbRepo.updateProverb(
        event.song.rid,
        event.song.title,
        event.song.content,
        !event.song.liked,
        getIso8601Date(),
      );
    } catch (e) {
      logger('Unable to update song: $e');
    }

    emit(ViewerLikedState(!event.proverb.liked));*/
  }

  Future<void> _onSaveHistoryProverb(
    SaveHistoryProverb event,
    Emitter<ViewerState> emit,
  ) async {
    /*await _dbRepo.saveHistory(
      History(song: event.song.rid, created: getCurrentDate()),
    );
    emit(ViewerHistoryState());*/
  }

  Future<void> _onLoadSaying(
    LoadSaying event,
    Emitter<ViewerState> emit,
  ) async {
    emit(const ViewerProgressState());
    List<String> synonyms = [], meanings = [];

    meanings = event.saying.meaning!
        .replaceAll("\\", "")
        .replaceAll('"', '')
        .replaceAll(',', ', ')
        .replaceAll('  ', ' ')
        .split("|");

    emit(ViewerLoadedState(meanings, synonyms));
  }

  Future<void> _onLikeSaying(
    LikeSaying event,
    Emitter<ViewerState> emit,
  ) async {
    /*emit(const ViewerProgressState());

    try {
      await _dbRepo.updateSaying(
        event.song.rid,
        event.song.title,
        event.song.content,
        !event.song.liked,
        getIso8601Date(),
      );
    } catch (e) {
      logger('Unable to update song: $e');
    }

    emit(ViewerLikedState(!event.saying.liked));*/
  }

  Future<void> _onSaveHistorySaying(
    SaveHistorySaying event,
    Emitter<ViewerState> emit,
  ) async {
    /*await _dbRepo.saveHistory(
      History(song: event.song.rid, created: getCurrentDate()),
    );
    emit(ViewerHistoryState());*/
  }

  Future<void> _onLoadWord(
    LoadWord event,
    Emitter<ViewerState> emit,
  ) async {
    emit(const ViewerProgressState());
    List<String> synonyms = [], meanings = [];

    if (event.word.synonyms!.isNotEmpty) {
      synonyms = event.word.synonyms!.split(',');
    }

    meanings = event.word.synonyms!
        .replaceAll("\\", "")
        .replaceAll('"', '')
        .replaceAll(',', ', ')
        .replaceAll('  ', ' ')
        .split("|");

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
