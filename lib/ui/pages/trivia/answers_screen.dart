import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../utils/app_utils.dart';
import '../../../data/models/trivia_quiz.dart';
import '../../../utils/colors.dart';

class AnswersScreen extends StatelessWidget {
  final List<TriviaQuiz> questions;
  final Map<int,dynamic> answers;

  const AnswersScreen({Key key, @required this.questions, @required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.checkAnswers),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
              ),
              height: 200,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: questions.length+1,
            itemBuilder: _buildItem,

          )
        ],
      ),
    );
  }
  Widget _buildItem(BuildContext context, int index) {
    if(index == questions.length) {
      return RaisedButton(
        child: Text(
          AppStrings.done.toUpperCase(), 
          style: TextStyle(color: ColorUtils.black, fontWeight: FontWeight.w500, fontSize: 30 )
        ),
        onPressed: (){
          Navigator.pop(context,true);
        },
      );
    }
    TriviaQuiz question = questions[index];
    bool correct = question.answer == answers[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(HtmlUnescape().convert(question.question), style: TextStyle(
              color: ColorUtils.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.0
            ),),
            SizedBox(height: 5.0),
            Text(HtmlUnescape().convert("${answers[index]}"), style: TextStyle(
              color: correct ? Colors.green : Colors.red,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5.0),
            correct ? Container(): Text.rich(TextSpan(
              children: [
                TextSpan(text: AppStrings.correctAnswer),
                TextSpan(text: HtmlUnescape().convert(question.answer) , style: TextStyle(
                  fontWeight: FontWeight.w500
                ))
              ]
            ),style: TextStyle(
              fontSize: 16.0
            ),)
          ],
        ),
      ),
      elevation: 10,
    );
  }
}