class ResponseModel {
  int status;
  String feedback;
  dynamic response;

  ResponseModel({this.status = 0, this.feedback = '', this.response});
}

class Selectable<T> {
  bool isSelected = false;
  T data;
  Selectable(this.data, this.isSelected);
}
