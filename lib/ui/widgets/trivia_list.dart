import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../services/app_settings.dart';
import '../../data/models/trivia.dart';
import '../../data/models/trivia_quiz.dart';
import '../../data/app_database.dart';
import '../../utils/colors.dart';
import '../../utils/app_utils.dart';
import '../pages/trivia/quiz_screen.dart';

class TriviaList extends StatefulWidget {
 
  @override
  TriviaListState createState() => TriviaListState();
}

class TriviaListState extends State<TriviaList> {
  AppDatabase db = AppDatabase();
  
  Future<Database> dbFuture;
  List<Trivia> mytrivia = List<Trivia>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Method to run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
    loadTriviaList();
  }

  void loadTriviaList() async {

    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Trivia>> itemListFuture = db.getTriviaList();
      itemListFuture.then((resultList) {
        setState(() {
          mytrivia = resultList;
          //if (mytrivia.length == 0) notice.showWidget();
          //else notice.hideWidget();
        });
      });
    });
  }

  void requestQuestionData(Trivia trivia) async {
    String wordIDs = trivia.questions.replaceAll(" ", ", ");
    List<TriviaQuiz> questions = List<TriviaQuiz>();

    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<TriviaQuiz>> itemListFuture = db.getTriviaEntries(trivia.level, wordIDs);
      itemListFuture.then((resultList) {
        setState(() {
          questions = resultList;
          nextAction(trivia, questions);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: Provider.of<AppSettings>(context).isDarkMode ? 
            BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [ 0.1, 0.5, 0.9 ],
                colors: [ ColorUtils.black, ColorUtils.black4, ColorUtils.grey  ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(10),
            ),            
          ) :
            BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [ 0.1, 0.5, 0.9 ],
                colors: [ ColorUtils.baseColor, ColorUtils.secondaryColor, ColorUtils.primaryColor ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(10),
            ),            
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: mytrivia.length,
              itemBuilder: triviaItem,
            ),
          ),
        );
      },
    );
  }

  Widget triviaItem(BuildContext context, int index) {
    Trivia trivia = mytrivia[index];
    var questions = trivia.questions.split(" ");
    String level = "Rahisi";
    if (trivia.level == 'medium') level = "Wastani";
    else if (trivia.level == 'hard') level = "Ngumu";

    return Column(
      children: [
        ListTile(
          leading: Image.asset(AppStrings.appIcon, height: 40, width: 40),
          title: Text(
            trivia.id.toString() + ". " + trivia.description.toUpperCase() + " - Maswali " + questions.length.toString(),
            style: TextStyle(color: ColorUtils.white, fontSize: 18),
          ),
          subtitle: Text(
            "Kiwango: " + level + "; Alama: " + trivia.score.toString()  + "; Muda: " + trivia.time,
            style: TextStyle(color: ColorUtils.white, fontSize: 15),
          ),
          onTap: () {
            requestQuestionData(trivia);
          }
        ),
        Divider(),
      ],
    );
  }

  Future<void> nextAction(Trivia trivia, List<TriviaQuiz> questions) async
  {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => QuizScreen(trivia: trivia, questions: questions)
    ));
  }
}