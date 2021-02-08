enum Type {
  multiple,
  boolean
}

enum Level {
  easy,
  medium,
  hard
}

class TriviaQuiz {
  Type type;
  Level level;
  String question;
  String answer;
  List<dynamic> options;

  TriviaQuiz({this.type, this.level, this.question, this.answer, this.options});

  TriviaQuiz.fromMap(Map<String, dynamic> data):
    type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
    level = data["level"] == "easy" ? Level.easy : data["level"] == "medium" ? Level.medium : Level.hard,
    question = data["question"],
    answer = data["answer"],
    options = data["options"];

  static List<TriviaQuiz> fromData(List<Map<String,dynamic>> data){
    return data.map((question) => TriviaQuiz.fromMap(question)).toList();
  }

}