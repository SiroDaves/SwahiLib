// This file declares neno model that will be used to manage 
// maneno from the live database

class NenoModel {
  int _id;
  String _title;
  String _maana;
  String _visawe;
  String _mnyambuliko;
  int _views;
  int _isfav;

  NenoModel(
      this._title,
      this._maana,
      this._visawe,
      this._mnyambuliko);

  int get id => _id;
  String get title => _title;
  String get maana => _maana;
  String get visawe => _visawe;
  String get mnyambuliko => _mnyambuliko;
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

  set visawe(String newVisawe) {
    this._visawe = newVisawe;
  }

  set mnyambuliko(String newMnyambuliko) {
    this._mnyambuliko = newMnyambuliko;
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
    map['visawe'] = _visawe;
    map['mnyambuliko'] = _mnyambuliko;
    map['views'] = _views;
    map['isfav'] = _isfav;

    return map;
  }

  // Extract a Note object from a Map object
  NenoModel.fromMapObject(Map<String, dynamic> map) {
    this._title = map['title'];
    this._maana = map['maana'];
    this._visawe = map['visawe'];
    this._mnyambuliko = map['mnyambuliko'];
    this._views = map['views'];
    this._isfav = map['isfav'];
  }
}
