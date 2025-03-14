part of '../../home_screen.dart';

class IdiomsList extends StatelessWidget {
  final HomeScreenState parent;
  const IdiomsList({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    var emptyState = const EmptyState(title: 'Samahani hamna chochote hapa');

    var listView = ListView.builder(
      padding: const EdgeInsets.only(right: 15),
      itemCount: parent.filteredIdioms.length,
      itemBuilder: (BuildContext context, int index) {
        final Idiom idiom = parent.filteredIdioms[index];
        return IdiomItem(idiom: idiom);
      },
    );

    return SizedBox(
      width: size.width - 85,
      child: parent.filteredIdioms.isEmpty ? emptyState : listView,
    );
  }
}

class IdiomItem extends StatelessWidget {
  final Idiom idiom;
  const IdiomItem({super.key, required this.idiom});

  @override
  Widget build(BuildContext context) {
    final titleTxtStyle =
        TextStyles.headingStyle4.bold.size(22).textHeight(1.2);
    final bodyTxtStyle = TextStyles.bodyStyle1.size(18).textHeight(2);

    var meaning = cleanMeaning(idiom.meaning ?? "");

    final contents = meaning.split("|");
    var extra = contents.isNotEmpty ? contents[0].split(":") : [];
    meaning = extra.isNotEmpty ? " ~ ${extra[0].trim()}." : "";

    if (contents.length > 1) {
      extra = contents[1].split(":");
      meaning = "$meaning\n ~ ${extra[0].trim()}.";
    }

    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(idiom.title ?? "", style: titleTxtStyle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (meaning.isNotEmpty)
              Text(meaning, style: bodyTxtStyle, maxLines: 2),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
