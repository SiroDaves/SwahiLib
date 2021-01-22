// This file declares generic model that will be used to manage 
// sayings, idioms, proverbs from the asset database

class Generic {
  String title;
  String meaning;

  Generic(
      {this.title,
      this.meaning });

  Generic.fromJson(Map<String, dynamic> json) {
    title         = json['title'];
    meaning         = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title']         = this.title;
    data['meaning']         = this.meaning;
    return data;
  }

  //static Generic fromMapObject(Map<String wordMapList) {}
  Generic.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.meaning = map['meaning'];
  }
}