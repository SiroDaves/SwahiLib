part of '../../home_screen.dart';

class SayingsList extends StatelessWidget {
  final HomeScreenState parent;
  const SayingsList({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    var emptyState = const EmptyState(title: 'Samahani hamna chochote hapa');

    var listView = ListView.builder(
      padding: const EdgeInsets.only(right: 15),
      itemCount: parent.filteredSayings.length,
      itemBuilder: (BuildContext context, int index) {
        final Saying saying = parent.filteredSayings[index];
        return SayingItem(saying: saying);
      },
    );

    return Container(
      width: size.width - 85,
      padding: const EdgeInsets.only(top: 10),
      child: parent.filteredSayings.isEmpty ? emptyState : listView,
    );
  }
}

class SayingItem extends StatelessWidget {
  final Saying saying;
  const SayingItem({super.key, required this.saying});

  @override
  Widget build(BuildContext context) {
    final titleTxtStyle = TextStyles.headingStyle4.bold
        .size(22)
        .textColor(ThemeColors.primary)
        .textHeight(1.2);
    final bodyTxtStyle = TextStyles.bodyStyle1.size(18).textColor(Colors.black);

    var meaning = cleanMeaning(saying.meaning ?? "");

    final contents = meaning.split("|");
    var extra = contents.isNotEmpty ? contents[0].split(":") : [];
    meaning = extra.isNotEmpty ? " ~ ${extra[0].trim()}." : "";

    if (contents.length > 1) {
      extra = contents[1].split(":");
      meaning = "$meaning\n ~ ${extra[0].trim()}.";
    }

    return Card(
      elevation: 2,
      color: Colors.white,
      child: ListTile(
        onTap: () {}, //=> vm.openSaying(saying),
        title: Text(saying.title ?? "", style: titleTxtStyle),
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
