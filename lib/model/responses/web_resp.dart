import '../../util/constants/event_constants.dart';

class WebResp {
  int? id;
  String? response;

  WebResp({
    this.id = EventConstants.noInternetConnection,
    this.response,
  });
}
