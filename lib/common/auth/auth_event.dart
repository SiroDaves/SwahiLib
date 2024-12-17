part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authStatusChanged(
      AuthStatus status) = AuthStatusChanged;
  const factory AuthEvent.authLogoutRequested() =
      AuthLogoutRequested;
}
