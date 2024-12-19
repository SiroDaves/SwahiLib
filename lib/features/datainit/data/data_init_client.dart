import 'dart:async';

import 'package:http/http.dart';

import '../../../common/utils/api_util.dart';
import '../../../common/utils/constants/api_constants.dart';

class DataInitClient {
  Future<Response> getData(String className) async {
    return await makeApiGetRequest(
      className,
      {
        'Content-Type': 'application/json',
        'X-Parse-Application-Id': ApiConstants.parseAppID,
        'X-Parse-REST-API-Key': ApiConstants.parseApiKey,
      },
    );
  }
}
