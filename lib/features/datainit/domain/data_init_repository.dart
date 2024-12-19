import 'dart:async';

import 'package:http/http.dart';

import '../data/data_init_client.dart';

class DataInitRepository {
  final _dataInitClient = DataInitClient();

  /// Fetch data
  Future<Response> getData(String className) async {
    return await _dataInitClient.getData(className);
  }
}
