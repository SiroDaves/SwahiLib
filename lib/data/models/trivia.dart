// This file declares word model that will be used to manage 
// words from the live database

class Trivia {
  int _id;
  int _triviaid;
  int _category;
  String _description;
  String _questions;
  String _level;
  int _score;
  String _time;

  Trivia(
    this._category,
    this._description,
    this._questions,
    this._level
  );

  int get id => _id;
  int get triviaid => _triviaid;
  int get category => _category;
  String get description => _description;
  String get questions => _questions;
  String get level => _level;
  int get score => _score;
  String get time => _time;

  set id(int newId) {
    this._id = newId;
  }

  set triviaid(int newTriviaid) {
    this._triviaid = newTriviaid;
  }

  set category(int newCategory) {
    this._category = newCategory;
  }

  set description(String newDescription) {
    this._description = newDescription;
  }

  set questions(String newQuestions) {
    this._questions = newQuestions;
  }

  set level(String newLevel) {
    this._level = newLevel;
  }

  set score(int newScore) {
    this._score = newScore;
  }

  set time(String newTime) {
    this._time = newTime;
  }

  // Convert a Data object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['triviaid'] = _triviaid;
    map['category'] = _category;
    map['description'] = _description;
    map['questions'] = _questions;
    map['level'] = _level;
    map['score'] = _score;
    map['time'] = _time;

    return map;
  }

  // Extract a Data object from a Map object
  Trivia.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._triviaid = map['triviaid'];
    this._category = map['category'];
    this._description = map['description'];
    this._questions = map['questions'];
    this._level = map['level'];
    this._score = map['score'];
    this._time = map['time'];
  }
}
