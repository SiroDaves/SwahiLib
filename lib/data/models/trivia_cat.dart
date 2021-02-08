class TriviaCat {
  int id, number;
  String title, description, icon;

  TriviaCat(
      {
        this.id,
        this.number,
        this.title,
        this.description,
        this.icon
      }
    );

  TriviaCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }

  static List<TriviaCat> fromData(List<Map<String,dynamic>> data){
    return data.map((cat) => TriviaCat.fromJson(cat)).toList();
  }
}
