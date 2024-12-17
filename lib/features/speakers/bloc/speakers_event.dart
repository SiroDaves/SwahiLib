part of 'speakers_bloc.dart';

@freezed
sealed class SpeakersEvent with _$SpeakersEvent {
  const factory SpeakersEvent.fetch() = FetchData;
  
  const factory SpeakersEvent.bookmark(Session session) = BookmarkSession;
}
