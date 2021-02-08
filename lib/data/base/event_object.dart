import '../../utils/api_utils.dart';

class EventObject {
  int id;
  Object object;

  EventObject(
      {this.id: EventConstants.noInternetConnection, this.object: null});
}
