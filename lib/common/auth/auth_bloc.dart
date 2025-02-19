import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/authe_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository autheRepo,
  })  : _autheRepository = autheRepo,
        super(XAuthState.unauthenticated()) {
    on<AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    _autheStatusSubscription = _autheRepository.status.listen(
      (status) => add(AuthStatusChanged(status)),
    );
  }

  final AuthRepository _autheRepository;
  late StreamSubscription<AuthStatus> _autheStatusSubscription;

  @override
  Future<void> close() {
    _autheStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return emit(XAuthState.unauthenticated());
      case AuthStatus.unverified:
        return emit(XAuthState.unverified());
      case AuthStatus.authenticated:
        return emit(XAuthState.authenticated());
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _autheRepository.logOut();
  }
}
