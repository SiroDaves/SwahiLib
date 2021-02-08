// This file declares generic model that will be used to manage 
// sayings, idioms, proverbs from the live database

class Item {
  int _id;
  String _title;
  String _meaning;
  String _synonyms;
  int _views;
  int _isfav;

  Item(
      this._title,
      this._meaning,
      this._synonyms);

  int get id => _id;
  String get title => _title;
  String get meaning => _meaning;
  String get synonyms => _synonyms;
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

  set synonyms(String newSynonyms) {
    this._synonyms = newSynonyms;
  }

  set views(int newViews) {
    this._views = newViews;
  }

  set isfav(int newIsfav) {
    this._isfav = newIsfav;
  }

  // Convert a Data object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['meaning'] = _meaning;
    map['views'] = _views;
    map['isfav'] = _isfav;

    return map;
  }

  // Extract a Data object from a Map object
  Item.fromMapObject(Map<String, dynamic> map) {
    this._title = map['title'];
    this._meaning = map['meaning'];
    this._views = map['views'];
    this._isfav = map['isfav'];
  }
}
