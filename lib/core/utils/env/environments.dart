import 'package:injectable/injectable.dart';

class Environments {
  static const String develop = 'dev';
  static const String staging = 'stg';
  static const String production = 'prod';
}

const dummy = Environment(Environments.develop);
