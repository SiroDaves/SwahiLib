import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../model/responses/parse_resp.dart';
import '../util/constants/api_constants.dart';
import '../util/constants/event_constants.dart';

@lazySingleton
abstract class AppWebService {
  @factoryMethod
  factory AppWebService() = AppService;

  Future<ParseResp> fetchCloudData(String type);
}

class AppService implements AppWebService {
  @override
  Future<ParseResp> fetchCloudData(String type) async {
    try {
      final QueryBuilder<ParseObject> parseQuery =
          QueryBuilder<ParseObject>(ParseObject(type));
      parseQuery.setLimit(50000);
      final ParseResponse apiResponse = await parseQuery.query();
      if (apiResponse.success && apiResponse.results != null) {
        // ignore: avoid_print
        print('Api Request: ${ApiConstants.parseApiBaseUrl}$type');
        // ignore: avoid_print
        print(
            'Api Response: [${apiResponse.statusCode}] ${apiResponse.results}');
        return ParseResp(
          apiResponse.results as List<ParseObject>,
          id: EventConstants.requestSuccessful,
        );
      } else {
        return ParseResp([], id: EventConstants.requestUnsuccessful);
      }
    } on TimeoutException catch (_) {
      return ParseResp([], id: EventConstants.requestTimeout);
    } on Exception {
      return ParseResp([], id: EventConstants.requestUnsuccessful);
    }
  }
}
