import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:anisi_controls/anisi_controls.dart';

import '../../data/app_database.dart';
import '../../data/models/trivia.dart';
import '../../data/models/trivia_quiz.dart';
import '../../utils/colors.dart';
import '../../utils/app_utils.dart';
import '../pages/trivia/quiz_screen.dart';

class TriviaPrepare extends StatefulWidget {
  final Trivia trivia;  
  const TriviaPrepare({Key key, this.trivia}) : super(key: key);

  @override
  TriviaPrepareState createState() => TriviaPrepareState();
}

class TriviaPrepareState extends State<TriviaPrepare> {
  AppDatabase db = AppDatabase();
  AsInformer informer = AsInformer.setUp(1, AppStrings.gettingReady, ColorUtils.primaryColor, Colors.transparent, ColorUtils.white, 10);
  
  Future<Database> dbFuture;
  List<TriviaQuiz> questions = List<TriviaQuiz>();

  int quizCount = 0;
  var triviaWords;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
    informer.showWidget();
    triviaWords = widget.trivia.questions.split(" ");
    quizCount = triviaWords.length;
    requestData();
  }

  void requestData() async {
    String wordIDs = widget.trivia.questions.replaceAll(" ", ", ");

    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<TriviaQuiz>> itemListFuture = db.getTriviaEntries(widget.trivia.level, wordIDs);
      itemListFuture.then((resultList) {
        setState(() {
          questions = resultList;
          nextAction();
        });
      });
    });
  }


  @override
  Widget build(BuildContext context){
    return Container(
      height: 150,
      child: informer,
    );
  }

  Future<void> nextAction() async
  {
    informer.hideWidget();
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => QuizScreen(trivia: widget.trivia, questions: questions)
    ));
  }

}