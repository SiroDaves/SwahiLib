import 'dart:async';

import 'package:injectable/injectable.dart';

import '../utils/app_util.dart';


enum AutheStatus { authenticated, unauthenticated,  unverified }

@lazySingleton
class AutheRepository {
  final _controller = StreamController<AutheStatus>();

  Stream<AutheStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 3));
    yield AutheStatus.authenticated;
    yield* _controller.stream;
  }

  Future<void> signUp() async {
    logger("User auth status: Unverified");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AutheStatus.unverified),
    );
  }

  Future<void> logIn() async {
    logger("User auth status: Authenticated");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AutheStatus.authenticated),
    );
  }

  Future<void> logOut() async {
    logger("User auth status: Unauthenticated");
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AutheStatus.unauthenticated),
    );
  }

  void dispose() => _controller.close();
}
