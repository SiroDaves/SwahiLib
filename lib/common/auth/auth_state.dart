part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState._({
    @Default(AuthStatus.unauthenticated) AuthStatus status,
  }) = _AuthState;
}

extension XAuthState on AuthState {
  static AuthState unverified() => AuthState._(
        status: AuthStatus.unverified,
      );
  static AuthState authenticated() => AuthState._(
        status: AuthStatus.authenticated,
      );
  static AuthState unauthenticated() => AuthState._(
        status: AuthStatus.unauthenticated,
      );
}
