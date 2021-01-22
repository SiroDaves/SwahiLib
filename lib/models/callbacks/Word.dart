// This file declares word model that will be used to manage 
// words from the live database

class Word {
  String title;
  String meaning;
  String synonyms;
  String conjugation;

  Word(
      {this.title,
      this.meaning,
      this.synonyms,
      this.conjugation });

  Word.fromJson(Map<String, dynamic> json) {
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

  //static Word fromMapObject(Map<String wordMapList) {}
  Word.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.meaning = map['meaning'];
    this.synonyms = map['synonyms'];
    this.conjugation = map['conjugation'];
  }
}