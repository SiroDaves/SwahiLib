part of 'speakers_bloc.dart';

@freezed
class SpeakersState with _$SpeakersState {
  const factory SpeakersState.initial() = _SpeakersState;

  const factory SpeakersState.loaded() = SpeakersLoadedState;

  const factory SpeakersState.progress() = SpeakersProgressState;

  const factory SpeakersState.success() = SpeakersSuccessState;

  const factory SpeakersState.fetched(
    List<Bookmark> bookmarks,
    List<Room> rooms,
    List<Speaker> speakers,
    List<Session> sessions,
  ) = SpeakersFetchedState;

  const factory SpeakersState.bookmarked(bool bookmarked) = SpeakersBookmarkedState;

  const factory SpeakersState.failure(String feedback) = SpeakersFailureState;
}
