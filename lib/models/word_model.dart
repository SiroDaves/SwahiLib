// This file declares word model that will be used to manage 
// words from the live database

class WordModel {
  int _id;
  String _title;
  String _meaning;
  String _synonyms;
  String _conjugation;
  int _views;
  int _isfav;

  WordModel(
      this._title,
      this._meaning,
      this._synonyms,
      this._conjugation);

  int get id => _id;
  String get title => _title;
  String get meaning => _meaning;
  String get synonyms => _synonyms;
  String get conjugation => _conjugation;
  int get views => _views;
  int get isfav => _isfav;

  set id(int newId) {
    this._id = newId;
  }

  set title(String newTitle) {
    this._title = newTitle;
  }

  set meaning(String newMaana) {
    this._meaning = newMaana;
  }

  set synonyms(String newVisawe) {
    this._synonyms = newVisawe;
  }

  set conjugation(String newMnyambuliko) {
    this._conjugation = newMnyambuliko;
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
    map['meaning'] = _meaning;
    map['synonyms'] = _synonyms;
    map['conjugation'] = _conjugation;
    map['views'] = _views;
    map['isfav'] = _isfav;

    return map;
  }

  // Extract a Note object from a Map object
  WordModel.fromMapObject(Map<String, dynamic> map) {
    this._title = map['title'];
    this._meaning = map['meaning'];
    this._synonyms = map['synonyms'];
    this._conjugation = map['conjugation'];
    this._views = map['views'];
    this._isfav = map['isfav'];
  }
}
