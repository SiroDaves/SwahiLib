part of 'authe_bloc.dart';

@freezed
class AutheState with _$AutheState {
  factory AutheState._({
    @Default(AutheStatus.unauthenticated) AutheStatus status,
  }) = _AutheState;
}

extension XAutheState on AutheState {
  static AutheState unverified() => AutheState._(
        status: AutheStatus.unverified,
      );
  static AutheState authenticated() => AutheState._(
        status: AutheStatus.authenticated,
      );
  static AutheState unauthenticated() => AutheState._(
        status: AutheStatus.unauthenticated,
      );
}
