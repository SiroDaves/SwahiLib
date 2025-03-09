part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchData() = FetchData;

  const factory HomeEvent.appUpdates() = CheckAppUpdates;

}
