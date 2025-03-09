import 'package:http/http.dart';

import '../data/home_client.dart';

class HomeRepository {
  final _client = HomeClient();

  Future<Response> fetchUpdateInfo() async => await _client.fetchUpdateInfo();
}
