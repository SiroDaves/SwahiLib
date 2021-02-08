// This file declares word model that will be used to manage 
// words from the live database

class WordCallback {
  String title;
  String meaning;
  String synonyms;
  String conjugation;

  WordCallback(
      {this.title,
      this.meaning,
      this.synonyms,
      this.conjugation });

  WordCallback.fromJson(Map<String, dynamic> json) {
    title         = json['title'];
    meaning         = json['meaning'];
    synonyms        = json['synonyms'];
    conjugation   = json['conjugation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title']         = this.title;
    data['meaning']         = this.meaning;
    data['synonyms']        = this.synonyms;
    data['conjugation']   = this.conjugation;
    return data;
  }

  //static WordCallback fromMapObject(Map<String wordMapList) {}
  WordCallback.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.meaning = map['meaning'];
    this.synonyms = map['synonyms'];
    this.conjugation = map['conjugation'];
  }
}