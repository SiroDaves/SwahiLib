import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../services/app_settings.dart';
import '../../../data/models/trivia.dart';
import '../../../data/models/trivia_quiz.dart';
import '../../../utils/colors.dart';
import '../../../utils/app_utils.dart';
import 'finish_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<TriviaQuiz> questions;
  final Trivia trivia;

  const QuizScreen({Key key, @required this.trivia, @required this.questions})
      : super(key: key);

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final TextStyle _questionStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);
  TriviaQuiz question;
  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  bool _isPlaying = false;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Method to run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
   
  }
  
  playAudioFromLocalStorage(path) async {
    
  }

  @override
  Widget build(BuildContext context) {
    question = widget.questions[_currentIndex];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text("Trivia: " + widget.trivia.description + " - Msl " + widget.questions.length.toString()),
          elevation: 0,
          actions: <Widget>[
            menuPopup(),
          ],
        ),
        body: mainBody(),
      ),
    );
  }

  Widget menuPopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Consumer<AppSettings>(builder: (context, AppSettings settings, _) {
          return ListTile(
            onTap: () {},
            title: Text(AppStrings.darkMode),
            trailing: Switch(
              onChanged: (bool value) => settings.setDarkMode(value),
              value: settings.isDarkMode,
            ),
          );
        }),
      ),
    ],
    onCanceled: () { },
    onSelected: (value) {
      //selectedMenu(value, context);
    },
    icon: Icon(
      Theme.of(context).platform == TargetPlatform.iOS ? Icons.more_horiz : Icons.more_vert, color: ColorUtils.white
    ),
  );

  Widget mainBody()
  {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            decoration: BoxDecoration(color: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.primaryColor),
            height: 200,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              quizHeader(),
              SizedBox(height: 20.0),
              quizBody(),
            ],
          ),
        ),
        quizActions()
      ],
    );
  }

  Widget quizHeader()
  {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: ColorUtils.white,
          child: Text("${_currentIndex + 1}"),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Text(
            HtmlUnescape().convert(widget.questions[_currentIndex].question),
            softWrap: true,
            style: MediaQuery.of(context).size.width > 800 ? _questionStyle.copyWith(fontSize: 30.0) : _questionStyle,
          ),
        ),
      ],
    );
  }

  Widget quizBody()
  {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text( AppStrings.answers.toUpperCase(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),            
            Divider(),
            ListTile(
              title: Text( showLetter(0) + ". " + question.options[0], style: TextStyle(fontSize: 18) ),
            ),            
            Divider(height: 1),
            ListTile(
              title: Text( showLetter(1) + ". " + question.options[1], style: TextStyle(fontSize: 18) ),
            ),            
            Divider(height: 1),
            ListTile(
              title: Text( showLetter(2) + ". " + question.options[2], style: TextStyle(fontSize: 18) ),
            ),            
            Divider(height: 1),
            ListTile(
              title: Text( showLetter(3) + ". " + question.options[3], style: TextStyle(fontSize: 18) ),
            ),
          ],
        ),
      ),
      elevation: 10,
    );
  }

  Widget answersList(BuildContext context, int index) {
    return Container(
      child: Text(
        question.options[index],
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget quizActions()
  {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 250),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.grey : ColorUtils.activeColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 250,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: question.options.length,
                itemBuilder: optionsList,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: RaisedButton(
              child: Text(
                _currentIndex == (widget.questions.length - 1) ? AppStrings.submit.toUpperCase() : AppStrings.next.toUpperCase(), 
                style: TextStyle(fontSize: 30.0)),
                color: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.baseColor,
              onPressed: _nextSubmit,
            ),
          ),
        ],
      )
    );
  }

  Widget optionsList(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        onAnswerSelected(index);
      },
      child: Container(
        width: 60,
        child: Card(
          elevation: 5,
          color: _answers[_currentIndex] == question.options[index] ? Colors.red : null,
          child: Hero(
            tag: question.options[index].toString(),
            child: Center(
              child: Text(
                showLetter(index),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                  color: _answers[_currentIndex] == question.options[index] ? Colors.white : null
                ),
                textAlign: TextAlign.center,
              )
            ),
          ),
        ),
      ),
    );
  }

  void onAnswerSelected(int tapped) {
    setState(() {
      _answers[_currentIndex] = question.options[tapped];
    });
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text(AppStrings.selectAnswer),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => FinishScreen(
          trivia:  widget.trivia, questions: widget.questions, answers: _answers
        ))
      );
    }
  }

  // ignore: missing_return
  String showLetter(int index)
  {
    switch (index)
    {
      case 0:
        return "A";
      case 1:
        return "B";
      case 2:
        return "C";
      case 3:
        return "D";
      case 4:
        return "E";
      case 5:
        return "F";
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(AppStrings.justaMinute),
          content: Text(AppStrings.areYouleaving),
          actions: <Widget>[
            FlatButton(
              child: Text(AppStrings.yes.toUpperCase()),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            FlatButton(
              child: Text(AppStrings.no.toUpperCase()),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      });
  }

}
