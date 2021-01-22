import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/models/trivia/category.dart';
import 'package:kamusi/models/trivia/question.dart';
import 'package:kamusi/helpers/api_provider.dart';
import 'package:kamusi/screens/trivia/error_screen.dart';
import 'package:kamusi/screens/trivia/quiz_screen.dart';
import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:provider/provider.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category category;

  const QuizOptionsDialog({Key key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int _noOfQuestions;
  String _difficulty;
  bool processing;

  @override
  void initState() { 
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
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
          color: Colors.black
        )
        : BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [ 0.1, 0.5, 0.9 ],
              colors: [ Colors.blue[900], ColorUtils.secondaryColor, Colors.blue ]),
      ),
      child: Text(
        LangStrings.triviaCategory + widget.category.name.toUpperCase(), 
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          titleBox(),
          SizedBox(height: 20.0),
          Text(LangStrings.triviaQuizInstruction, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          questionsBox(),
          Divider(),
          Text(LangStrings.triviaLevelInstruction, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          difficultyBox(),
          Divider(),
          processing ? CircularProgressIndicator() : RaisedButton(
            child: Text(
              LangStrings.triviaStart.toUpperCase(), 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
            ),
            //onPressed: startTrivia,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget questionsBox() {
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
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _noOfQuestions == 10 ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectNumberOfQuestions(10),
          ),
          ActionChip(
            label: Text("20"),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _noOfQuestions == 20 ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectNumberOfQuestions(20),
          ),
          ActionChip(
            label: Text("30"),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _noOfQuestions == 30 ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectNumberOfQuestions(30),
          ),
          ActionChip(
            label: Text("40"),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _noOfQuestions == 40 ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectNumberOfQuestions(40),
          ),
          ActionChip(
            label: Text("50"),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _noOfQuestions == 50 ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectNumberOfQuestions(50),
          ),
          
        ],
      ),
    );
  }

  Widget difficultyBox() {
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
            label: Text(LangStrings.triviaEasy.toUpperCase()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _difficulty == "easy" ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectDifficulty("easy"),
          ),
          ActionChip(
            label: Text(LangStrings.triviaMedium.toUpperCase()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _difficulty == "medium" ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectDifficulty("medium"),
          ),
          ActionChip(
            label: Text(LangStrings.triviaHard.toUpperCase()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: _difficulty == "hard" ? Colors.indigo : Colors.grey.shade600,
            onPressed: () => _selectDifficulty("hard"),
          ),
          
        ],
      ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  _selectDifficulty(String s) {
    setState(() {
      _difficulty=s;
    });
  }

  void startTrivia() async {
    setState(() {
      processing=true;
    });
    try {
      List<Question> questions =  await getQuestions(widget.category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if(questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ErrorScreen(message: "There are not enough questions in the category, with the options you selected.",)
        ));
        return;
      }
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => QuizScreen(questions: questions, category: widget.category,)
      ));
    }on SocketException catch (_) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorScreen(message: "Can't reach the servers, \n Please check your internet connection.",)
      ));
    } catch(e){
      print(e.message);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorScreen(message: "Unexpected error trying to connect to the API",)
      ));
    }
    setState(() {
      processing=false;
    });
  }
}