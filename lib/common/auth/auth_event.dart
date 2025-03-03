part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.autheStatusChanged(
      AuthStatus status) = AuthStatusChanged;
  const factory AuthEvent.autheLogoutRequested() =
      AuthLogoutRequested;
}
