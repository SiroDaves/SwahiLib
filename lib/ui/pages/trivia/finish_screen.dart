import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../utils/app_utils.dart';
import '../../../data/models/trivia.dart';
import '../../../data/models/trivia_quiz.dart';
import 'answers_screen.dart';

class FinishScreen extends StatelessWidget {
  final Trivia trivia;
  final List<TriviaQuiz> questions;
  final Map<int, dynamic> answers;
  
  int correctAnswers;
  FinishScreen({Key key, @required this.trivia, @required this.questions, @required this.answers}): super(key: key) {
    
  }

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.resultsScreen),
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
          contentBody(context),
        ],
      ),
    );
  }
  
  Widget contentBody(BuildContext context)
  {
    int correct = 0;
    this.answers.forEach((index,value){
      if(this.questions[index].answer == value)
        correct++;
    });

    final TextStyle titleStyle = TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w500
    );
    final TextStyle subtitleStyle = TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w500
    );
    final TextStyle trailingStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold
    );

    int score = (correct/questions.length * 100).toInt();

    String level = "Rahisi";
    if (trivia.level == 'medium') level = "Wastani";
    else if (trivia.level == 'hard') level = "Ngumu";

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset(AppStrings.appIcon, height: 40, width: 40),
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(AppStrings.triviaCategory, style: titleStyle),
                    subtitle: Text(trivia.description, style: trailingStyle),
                  ),
                ]
              ),
              elevation: 10,
            ),
            SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: ListTile(
                leading: Image.asset(AppStrings.appIcon, height: 40, width: 40),
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(AppStrings.totalQuestions, style: titleStyle),
                subtitle: Text(AppStrings.triviaLevel, style: subtitleStyle),
                trailing: Text("${questions.length}\n" + level, style: trailingStyle),
              ),
              elevation: 10,
            ),
            SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: ListTile(                
                leading: Image.asset(AppStrings.appIcon, height: 40, width: 40),
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(AppStrings.score, style: titleStyle),
                subtitle: Text(AppStrings.correctAnswers, style: subtitleStyle),
                trailing: Text("${score} %\n$correct/${questions.length}", style: trailingStyle),
              ),
              elevation: 10,
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Theme.of(context).accentColor.withOpacity(0.8),
                  child: Text(AppStrings.gotoHomescreen.toUpperCase()),
                  onPressed: () => Navigator.pop(context,true),
                ),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Text(AppStrings.checkAnswers.toUpperCase()),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AnswersScreen(questions: questions, answers: answers,)
                    ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}