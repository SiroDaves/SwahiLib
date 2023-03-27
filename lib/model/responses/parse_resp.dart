import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../util/constants/event_constants.dart';

class ParseResp {
  int? id;
  List<ParseObject?> data;

  ParseResp(this.data, {this.id = EventConstants.noInternetConnection});
}
