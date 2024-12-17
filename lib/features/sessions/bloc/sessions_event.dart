part of 'sessions_bloc.dart';

@freezed
sealed class SessionsEvent with _$SessionsEvent {
  const factory SessionsEvent.fetch() = FetchData;
  
  const factory SessionsEvent.bookmark(Session session) = BookmarkSession;
}
