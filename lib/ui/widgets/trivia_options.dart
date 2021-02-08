import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../services/app_futures.dart';
import '../../data/base/event_object.dart';
import '../../services/app_settings.dart';
import '../../data/app_database.dart';
import '../../data/models/trivia.dart';
import '../../data/models/trivia_cat.dart';
import '../../data/models/trivia_word.dart';
import '../../data/models/trivia_quiz.dart';
import '../../utils/colors.dart';
import '../../utils/api_utils.dart';
import '../../utils/app_utils.dart';
import '../pages/trivia/quiz_screen.dart';

class TriviaOptions extends StatefulWidget {
  final TriviaCat category;  
  const TriviaOptions({Key key, this.category}) : super(key: key);

  @override
  TriviaOptionsState createState() => TriviaOptionsState();
}

class TriviaOptionsState extends State<TriviaOptions> {
  AppDatabase db = AppDatabase();  
  Future<Database> dbFuture;

  int quizCount;
  String level;
  bool processing;
  String triviaQuestions;

  @override
  void initState() { 
    super.initState();
    quizCount = 10;
    level = "easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: mainBody(),
      decoration: BoxDecoration(
        color: Provider.of<AppSettings>(context).isDarkMode ? Colors.grey : Colors.blue[200],
      ),
    );
  }

  Widget titleBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: Provider.of<AppSettings>(context).isDarkMode ? 
        BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [ 0.1, 0.5, 0.9 ],
              colors: [ ColorUtils.black, ColorUtils.black4, ColorUtils.grey ]),
        ) :
        BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [ 0.1, 0.5, 0.9 ],
              colors: [ ColorUtils.baseColor, ColorUtils.secondaryColor, ColorUtils.primaryColor ]),
      ),
      child: Text(
        AppStrings.triviaCartegory + widget.category.title.toUpperCase(), 
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: ColorUtils.white)),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          titleBox(),
          SizedBox(height: 20.0),
          Text(AppStrings.triviaQuizInstruction, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          quizCountBox(),
          Divider(),
          Text(AppStrings.triviaLevelInstruction, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          levelBox(),
          Divider(),
          processing ? CircularProgressIndicator() : RaisedButton(
            child: Text(
              AppStrings.triviaStart.toUpperCase(), 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            onPressed: startTrivia,
            color: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget quizCountBox() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 16.0,
        spacing: 16.0,
        children: <Widget>[
          SizedBox(width: 0.0),
          ActionChip(
            label: Text("10"),
            labelStyle: TextStyle(color: quizCount == 10 ? ColorUtils.white : ColorUtils.black),
            backgroundColor: quizCount == 10 ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setQuizCount(10),
          ),
          ActionChip(
            label: Text("20"),
            labelStyle: TextStyle(color: quizCount == 20 ? ColorUtils.white : ColorUtils.black),
            backgroundColor: quizCount == 20 ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setQuizCount(20),
          ),
          ActionChip(
            label: Text("30"),
            labelStyle: TextStyle(color: quizCount == 30 ? ColorUtils.white : ColorUtils.black),
            backgroundColor: quizCount == 30 ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setQuizCount(30),
          ),
          ActionChip(
            label: Text("40"),
            labelStyle: TextStyle(color: quizCount == 40 ? ColorUtils.white : ColorUtils.black),
            backgroundColor: quizCount == 40 ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setQuizCount(40),
          ),
          ActionChip(
            label: Text("50"),
            labelStyle: TextStyle(color: quizCount == 50 ? ColorUtils.white : ColorUtils.black),
            backgroundColor: quizCount == 50 ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setQuizCount(50),
          ),
          
        ],
      ),
    );
  }

  Widget levelBox() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 16.0,
        spacing: 16.0,
        children: <Widget>[
          SizedBox(width: 0.0),
          ActionChip(
            label: Text(AppStrings.triviaEasy.toUpperCase()),
            labelStyle: TextStyle(color: level == "easy" ? ColorUtils.white : ColorUtils.black),
            backgroundColor: level == "easy" ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setDifficulty("easy"),
          ),
          ActionChip(
            label: Text(AppStrings.triviaMedium.toUpperCase()),
            labelStyle: TextStyle(color: level == "medium" ? ColorUtils.white : ColorUtils.black),
            backgroundColor: level == "medium" ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setDifficulty("medium"),
          ),
          ActionChip(
            label: Text(AppStrings.triviaHard.toUpperCase()),
            labelStyle: TextStyle(color: level == "hard" ? ColorUtils.white : ColorUtils.black),
            backgroundColor: level == "hard" ? 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor : 
            Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white2 : ColorUtils.secondaryColor,
            onPressed: () => setDifficulty("hard"),
          ),
          
        ],
      ),
    );
  }

  setQuizCount(int value) {
    setState(() {
      quizCount = value;
    });
  }

  setDifficulty(String value) {
    setState(() {
      level = value;
    });
  }

  void startTrivia() async {
    setState(() {
      processing=true;
    });
    EventObject eventObject = await getTrivia(widget.category.number, level, quizCount);

    switch (eventObject.id) {
      case EventConstants.requestSuccessful:
        {
          setState(() {           
            triviaQuestions = TriviaWord.asString(eventObject.object);
            saveData();
          });
        }
        break;

      case EventConstants.requestUnsuccessful:
        {
          setState(() {
            processing=false;
          });
        }
        break;

      case EventConstants.noInternetConnection:
        {
          setState(() {
            processing = false;
          });
        }
        break;
    }
    
  }

  Future<void> saveData() async
  {
    Trivia trivial = new Trivia(widget.category.number, widget.category.title, triviaQuestions, level);
    int iD = await db.insertTrivia(trivial);
    Trivia trivia = await db.getTriviaById(iD);
    
    String wordIDs = triviaQuestions.replaceAll(" ", ", ");
    List<TriviaQuiz> questions = List<TriviaQuiz>();

    dbFuture = db.initializeDatabase();
    dbFuture.then((database) {
      Future<List<TriviaQuiz>> itemListFuture = db.getTriviaEntries(trivia.level, wordIDs);
      itemListFuture.then((resultList) {
        setState(() {
          processing=false;
          questions = resultList;
          nextAction(trivia, questions);
        });
      });
    });
  }

  Future<void> nextAction(Trivia trivia, List<TriviaQuiz> questions) async
  {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => QuizScreen(trivia: trivia, questions: questions)
    ));
  }

}