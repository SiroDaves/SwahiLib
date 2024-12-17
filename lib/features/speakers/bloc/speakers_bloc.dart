import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../common/utils/date_util.dart';
import '../../../core/di/injectable.dart';

part 'speakers_event.dart';
part 'speakers_state.dart';

part 'speakers_bloc.freezed.dart';

class SpeakersBloc extends Bloc<SpeakersEvent, SpeakersState> {
  SpeakersBloc() : super(const _SpeakersState()) {
    on<FetchData>(_onFetchData);
    on<BookmarkSession>(_onBookmarkSession);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  void _onFetchData(
    FetchData event,
    Emitter<SpeakersState> emit,
  ) async {
    emit(const SpeakersProgressState());
    List<Bookmark> bookmarks = [];
    List<Room> rooms = [];
    List<Speaker> speakers = [];
    List<Session> sessions = [];

    try {
      bookmarks = await _dbRepo.fetchBookmarks();
      rooms = await _dbRepo.fetchRooms();
      sessions = await _dbRepo.fetchSessions();
      speakers = await _dbRepo.fetchSpeakers();
      emit(SpeakersFetchedState(bookmarks, rooms, speakers, sessions));
    } catch (e) {
      logger("Error log: $e");
      emit(SpeakersFetchedState(bookmarks, rooms, speakers, sessions));
    }
  }

  void _onBookmarkSession(
    BookmarkSession event,
    Emitter<SpeakersState> emit,
  ) async {
    emit(const SpeakersProgressState());
    try {
      await _dbRepo.bookmarkSession(
        event.session.id!,
        !event.session.bookmarked!,
        getIso8601Date(),
      );
      await _dbRepo.saveBookmark(
        Bookmark(
          session: event.session.id!,
          createdAt: getIso8601Date(),
        ),
      );
    } catch (e) {
      logger('Unable to bookmark session: $e');
    }

    emit(SpeakersBookmarkedState(!event.session.bookmarked!));
  }
}
