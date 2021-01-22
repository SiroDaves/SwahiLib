import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:kamusi/models/trivia/category.dart';
import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/utils/constants.dart';
import 'package:kamusi/widgets/quiz_options.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TriviaScreen extends StatefulWidget {

  @override
  TriviaState createState() => TriviaState();
}

class TriviaState extends State<TriviaScreen> {

  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LangStrings.triviaPage),
          elevation: 0,
        ),
        body: mainBody(),
      );
  }

  Widget mainBody() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            decoration:
                BoxDecoration(color: ColorUtils.primaryColor),
            height: 200,
          ),
        ),
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                child: Text(
                  LangStrings.triviaPageInstruction,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width >
                              1000
                          ? 7
                          : MediaQuery.of(context).size.width > 600 ? 5 : 3,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  delegate: SliverChildBuilderDelegate(
                    _buildCategoryItem,
                    childCount: categories.length,
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () => categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          AutoSizeText(
            category.name,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }

  categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
  
}
