part of '../../home_screen.dart';

class WordsList extends StatelessWidget {
  final HomeScreenState parent;
  const WordsList({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    var emptyState = const EmptyState(title: 'Samahani hamna chochote hapa');

    var listView = ListView.builder(
      padding: const EdgeInsets.only(right: 15),
      itemCount: parent.filteredWords.length,
      itemBuilder: (BuildContext context, int index) {
        final Word word = parent.filteredWords[index];
        return WordItem(
          word: word,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordViewer(
                  word: word,
                  words: parent.words,
                ),
              ),
            );
          },
        );
      },
    );

    return Container(
      width: size.width - 85,
      padding: const EdgeInsets.only(top: 10),
      child: parent.filteredWords.isEmpty ? emptyState : listView,
    );
  }
}

class WordItem extends StatelessWidget {
  final Word word;
  final VoidCallback? onTap;
  const WordItem({super.key, required this.word, this.onTap});

  @override
  Widget build(BuildContext context) {
    final titleTxtStyle = TextStyles.headingStyle4.bold
        .size(22)
        .textColor(ThemeColors.primary)
        .textHeight(1.2);
    final bodyTxtStyle = TextStyles.bodyStyle1.size(18).textColor(Colors.black);

    var meaning = cleanMeaning(word.meaning ?? "");

    final contents = meaning.split("|");
    var extra = contents.isNotEmpty ? contents[0].split(":") : [];
    meaning = extra.isNotEmpty ? " ~ ${extra[0].trim()}." : "";

    if (contents.length > 1) {
      extra = contents[1].split(":");
      meaning = "$meaning\n ~ ${extra[0].trim()}.";
    }

    final synonyms =
        (word.synonyms ?? "").split(',').where((s) => s.isNotEmpty).toList();
    final synonymsContainer = synonyms.isNotEmpty
        ? Row(
            children: <Widget>[
              Text(
                "${synonyms.length == 1 ? 'KISAWE' : 'VISAWE ${synonyms.length}'}:",
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
          )
        : const SizedBox.shrink();

    return Card(
      elevation: 2,
      color: Colors.white,
      child: ListTile(
        onTap: onTap,
        title: Text(word.title ?? "", style: titleTxtStyle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (meaning.isNotEmpty)
              Text(meaning, style: bodyTxtStyle, maxLines: 2),
            if (synonyms.isNotEmpty) const SizedBox(height: 5),
            if (synonyms.isNotEmpty) synonymsContainer,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
