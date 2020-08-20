class GenericModel {
  int _id;
  String _title;
  String _maana;
  int _views;
  int _isfav;

  //id,title ,maana

  GenericModel(
      this._title,
      this._maana);

  int get id => _id;
  String get title => _title;
  String get maana => _maana;
  int get views => _views;
  int get isfav => _isfav;

  set id(int newId) {
    this._id = newId;
  }

  set title(String newTitle) {
    this._title = newTitle;
  }

  set maana(String newMaana) {
    this._maana = newMaana;
  }

  set views(int newViews) {
    this._views = newViews;
  }

  set isfav(int newIsfav) {
    this._isfav = newIsfav;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['maana'] = _maana;
    map['views'] = _views;
    map['isfav'] = _isfav;

    return map;
  }

  // Extract a Note object from a Map object
  GenericModel.fromMapObject(Map<String, dynamic> map) {
    this._title = map['title'];
    this._maana = map['maana'];
    this._views = map['views'];
    this._isfav = map['isfav'];
  }
}
