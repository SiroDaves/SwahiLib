// This file declares generic model that will be used to manage 
// sayings, idioms, proverbs from the asset database

class ItemCallback {
  String title;
  String meaning;
  String synonyms;

  ItemCallback(
      {this.title,
      this.meaning,
      this.synonyms });

  ItemCallback.fromJson(Map<String, dynamic> json) {
    title         = json['title'];
    meaning         = json['meaning'];
    synonyms         = json['synonyms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title']         = this.title;
    data['meaning']         = this.meaning;
    data['synonyms']         = this.synonyms;
    return data;
  }

  ItemCallback.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.meaning = map['meaning'];
    this.synonyms = map['synonyms'];
  }
}