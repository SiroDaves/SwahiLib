class TriviaWord {
  int id;

  TriviaWord(
      {
        this.id
      }
    );

  TriviaWord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }

  static List<TriviaWord> fromData(List<Map<String,dynamic>> data){
    return data.map((cat) => TriviaWord.fromJson(cat)).toList();
  }
  
  static String asString(List<Map<String,dynamic>> data){
    List<TriviaWord> list = TriviaWord.fromData(data);
    String questions = list[0].id.toString();
    for (int i = 1; i < list.length; i++) {
      questions = questions + " " + list[i].id.toString();
    }
    return questions;
  }
}
