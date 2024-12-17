import 'dart:async';

import 'package:injectable/injectable.dart';

import '../utils/app_util.dart';


enum AuthStatus { authenticated, unauthenticated,  unverified }

@lazySingleton
class AuthRepository {
  final _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 3));
    yield AuthStatus.authenticated;
    yield* _controller.stream;
  }

  Future<void> signUp() async {
    logger("User auth status: Unverified");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AuthStatus.unverified),
    );
  }

  Future<void> logIn() async {
    logger("User auth status: Authenticated");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AuthStatus.authenticated),
    );
  }

  Future<void> logOut() async {
    logger("User auth status: Unauthenticated");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AuthStatus.unauthenticated),
    );
  }

  void dispose() => _controller.close();
}
