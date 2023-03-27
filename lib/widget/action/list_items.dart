import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../model/base/word.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';
import '../general/labels.dart';

class WordItem extends StatelessWidget {
  final Word? word;
  final VoidCallback? onTap;

  const WordItem({
    Key? key,
    required this.word,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var meaning = word!.meaning!
        .replaceAll("\\", "")
        .replaceAll('"', '')
        .replaceAll(',', ', ')
        .replaceAll('  ', ' ');
    final contents = meaning.split("|");
    var extra = contents[0].split(":");

    meaning = " ~ ${extra[0].trim()}.";

    if (contents.length > 1) {
      extra = contents[1].split(":");
      meaning = "$meaning\n ~ ${extra[0].trim()}.";
    }
    final synonyms = word!.synonyms!.split(',');
    final titleTxtStyle = TextStyles.CalloutFocus.bold
        .size(22)
        .textColor(ThemeColors.primary)
        .textHeight(1.2);
    final bodyTxtStyle = TextStyles.Body1.size(18).textColor(Colors.black);
    final synonymsContainer = Row(
      children: <Widget>[
        Text(
          "${synonyms.length == 1 ? 'KISAWE ' : 'VISAWE '}${synonyms.length}:",
          style: bodyTxtStyle.bold,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: synonyms.length,
              itemBuilder: (BuildContext context, int index) {
                return TagView(tagText: synonyms[index], size: 20);
              },
            ),
          ),
        ),
      ],
    );
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        title: Text(word!.title!, style: titleTxtStyle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(meaning, style: bodyTxtStyle, maxLines: 2),
            if (word!.synonyms!.isNotEmpty) const SizedBox(height: 5),
            if (word!.synonyms!.isNotEmpty) synonymsContainer,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
