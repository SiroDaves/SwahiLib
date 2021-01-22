import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:kamusi/screens/word_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:kamusi/helpers/app_settings.dart';
import 'package:kamusi/utils/colors.dart';
import 'package:kamusi/models/word_model.dart';

class WordItem extends StatelessWidget {

  final String heroTag;
  final WordModel item;
  final BuildContext context;

  WordItem(this.heroTag, this.item, this.context);
  String itemBook;

  @override
  Widget build(BuildContext context) {
    String strContent = "<b>" + item.title + "</b>";
    String strMeaning = item.meaning;

    try {
      if (strMeaning.length == 0) {
        return Container();
      } else {
        strMeaning = strMeaning.replaceAll("\\", "");
        strMeaning = strMeaning.replaceAll('"', '');

        strContent = strContent + '<ul>';
        var strContents = strMeaning.split("|");

        if (strContents.length > 1) {
          try {
            for (int i = 0; i < strContents.length; i++) {
              var strExtra = strContents[i].split(":");
              strContent = strContent + "<li>" + strExtra[0] + "</li>";
            }
          } catch (Exception) {}
        } else {
          var strExtra = strContents[0].split(":");
          strContent = strContent + "<li>" + strExtra[0] + "</li>";
        }
        strContent = strContent + '</ul>';
        if (item.synonyms.length > 1)
          strContent = strContent +
              "<br><p><b>Visawe:</b> <i>" +
              item.synonyms +
              "</i></p>";

        return Card(
          elevation: 2,
          child: GestureDetector(
            child: Html(
              data: strContent,
              style: {
                "html": Style(
                  fontSize: FontSize(20.0),
                ),
                "ul": Style(
                  fontSize: FontSize(18.0),
                ),
                "p": Style(
                  fontSize: FontSize(18.0),
                  margin: EdgeInsets.only(left: 25, top: 10),
                ),
              },
            ),
            onTap: () {
              navigateToWord(item);
            },
          ),
        );
      }
    } catch (Exception) {
      return Container();
    }
  }
  
  void navigateToWord(WordModel word) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WordViewScreen(word);
    }));
  }
  
  Widget tagView(String tagText)
  {
    try {
      if (tagText.isNotEmpty)
      {
        return Container(
          padding: const EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 5, left: 5),
          decoration: new BoxDecoration( 
            color: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.black : ColorUtils.primaryColor,
            border: Border.all(color: Provider.of<AppSettings>(context).isDarkMode ? ColorUtils.white : ColorUtils.secondaryColor),
            borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
          ),
          child: Text( tagText,style: TextStyle(color: ColorUtils.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        );
    }
    else return Container();      
    } catch (Exception) {
      return Container(); 
    }    
  }

}