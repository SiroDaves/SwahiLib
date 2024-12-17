part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeState;

  const factory HomeState.loaded() = HomeLoadedState;

  const factory HomeState.progress() = HomeProgressState;

  const factory HomeState.success() = HomeSuccessState;

  const factory HomeState.fetchedOnline(
    bool fetched,
  ) = HomeFetchedOnlineState;

  const factory HomeState.fetchedLocal(
    List<Bookmark> bookmarks,
    List<Room> rooms,
    List<Speaker> speakers,
    List<Session> sessions,
  ) = HomeFetchedLocalState;

  const factory HomeState.bookmarked(bool bookmarked) = HomeBookmarkedState;

  const factory HomeState.failure(String feedback) = HomeFailureState;
}
