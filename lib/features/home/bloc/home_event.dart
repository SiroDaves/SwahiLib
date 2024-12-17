part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchonline() = FetchOnlineData;

  const factory HomeEvent.fetchLocal() = FetchLocalData;
}
