part of 'sessions_bloc.dart';

@freezed
class SessionsState with _$SessionsState {
  const factory SessionsState.initial() = _SessionsState;

  const factory SessionsState.loaded() = SessionsLoadedState;

  const factory SessionsState.progress() = SessionsProgressState;

  const factory SessionsState.success() = SessionsSuccessState;

  const factory SessionsState.fetched(
    List<Bookmark> bookmarks,
    List<Room> rooms,
    List<Speaker> speakers,
    List<Session> sessions,
  ) = SessionsFetchedState;

  const factory SessionsState.bookmarked(bool bookmarked) = SessionsBookmarkedState;

  const factory SessionsState.failure(String feedback) = SessionsFailureState;
}
