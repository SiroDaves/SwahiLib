part of 'authe_bloc.dart';

@freezed
sealed class AutheEvent with _$AutheEvent {
  const factory AutheEvent.autheStatusChanged(
      AutheStatus status) = AutheStatusChanged;
  const factory AutheEvent.autheLogoutRequested() =
      AutheLogoutRequested;
}
