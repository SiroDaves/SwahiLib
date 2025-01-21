import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/authe_repository.dart';

part 'authe_event.dart';
part 'authe_state.dart';

part 'authe_bloc.freezed.dart';

class AutheBloc extends Bloc<AutheEvent, AutheState> {
  AutheBloc({
    required AutheRepository autheRepo,
  })  : _autheRepository = autheRepo,
        super(XAutheState.unauthenticated()) {
    on<AutheStatusChanged>(_onAutheStatusChanged);
    on<AutheLogoutRequested>(_onAutheLogoutRequested);
    _autheStatusSubscription = _autheRepository.status.listen(
      (status) => add(AutheStatusChanged(status)),
    );
  }

  final AutheRepository _autheRepository;
  late StreamSubscription<AutheStatus> _autheStatusSubscription;

  @override
  Future<void> close() {
    _autheStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAutheStatusChanged(
    AutheStatusChanged event,
    Emitter<AutheState> emit,
  ) async {
    switch (event.status) {
      case AutheStatus.unauthenticated:
        return emit(XAutheState.unauthenticated());
      case AutheStatus.unverified:
        return emit(XAutheState.unverified());
      case AutheStatus.authenticated:
        return emit(XAutheState.authenticated());
    }
  }

  void _onAutheLogoutRequested(
    AutheLogoutRequested event,
    Emitter<AutheState> emit,
  ) {
    _autheRepository.logOut();
  }
}
