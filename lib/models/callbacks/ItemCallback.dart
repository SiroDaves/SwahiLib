// This file declares generic model that will be used to manage 
// sayings, idioms, proverbs from the asset database

class ItemCallback {
  String title;
  String meaning;

  ItemCallback(
      {this.title,
      this.meaning });

  ItemCallback.fromJson(Map<String, dynamic> json) {
    title         = json['title'];
    meaning         = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title']         = this.title;
    data['meaning']         = this.meaning;
    return data;
  }

  //static ItemCallback fromMapObject(Map<String wordMapList) {}
  ItemCallback.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.meaning = map['meaning'];
  }
}