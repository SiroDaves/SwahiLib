class Generic {
  String title;
  String maana;

//id,title,maana
  Generic(
      {this.title,
      this.maana });

  Generic.fromJson(Map<String, dynamic> json) {
    title         = json['title'];
    maana         = json['maana'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title']         = this.title;
    data['maana']         = this.maana;
    return data;
  }

  //static Generic fromMapObject(Map<String nenoMapList) {}
  Generic.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.maana = map['maana'];
  }
}