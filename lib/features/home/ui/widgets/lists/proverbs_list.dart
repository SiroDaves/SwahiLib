part of '../../home_screen.dart';

class ProverbsList extends StatelessWidget {
  final HomeScreenState parent;
  const ProverbsList({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    var emptyState = const EmptyState(title: 'Samahani hamna chochote hapa');

    var listView = ListView.builder(
      padding: const EdgeInsets.only(right: 15),
      itemCount: parent.filteredProverbs.length,
      itemBuilder: (BuildContext context, int index) {
        final Proverb proverb = parent.filteredProverbs[index];
        return ProverbItem(
          proverb: proverb,
          onTap: () {}, //=> vm.openProverb(proverb),
        );
      },
    );

    return SizedBox(
      width: size.width - 85,
      child: parent.filteredProverbs.isEmpty ? emptyState : listView,
    );
  }
}

class ProverbItem extends StatelessWidget {
  final Proverb proverb;
  final VoidCallback? onTap;
  const ProverbItem({super.key, required this.proverb, this.onTap});

  @override
  Widget build(BuildContext context) {
    final titleTxtStyle = TextStyles.headingStyle4.bold
        .size(22)
        .textColor(ThemeColors.foreColorPrimary(context))
        .textHeight(1.2);
    final bodyTxtStyle = TextStyles.bodyStyle1.size(18);

    var meaning = cleanMeaning(proverb.meaning ?? "");

    final contents = meaning.split("|");
    var extra = contents.isNotEmpty ? contents[0].split(":") : [];
    meaning = extra.isNotEmpty ? " ~ ${extra[0].trim()}." : "";

    if (contents.length > 1) {
      extra = contents[1].split(":");
      meaning = "$meaning\n ~ ${extra[0].trim()}.";
    }

    final synonyms =
        (proverb.synonyms ?? "").split(',').where((s) => s.isNotEmpty).toList();
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
      child: ListTile(
        onTap: onTap,
        title: Text(proverb.title ?? "", style: titleTxtStyle),
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
