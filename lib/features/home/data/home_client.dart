import 'dart:async';

import 'package:http/http.dart';

import '../../../../common/utils/api_util.dart';
import '../../../common/utils/constants/app_constants.dart';

class HomeClient {
  Future<Response> fetchUpdateInfo() async {
    return await makeApiGetRequest(
      AppConstants.githubRepoUpdateJson,
      {
        'Content-Type': 'application/json',
      },
    );
  }

}
