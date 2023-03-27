part of 'home_screen.dart';

class HomeList4 extends StatelessWidget {
  final HomeVm vm;

  const HomeList4(this.vm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 85,
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: vm.proverbs!.length,
        itemBuilder: (BuildContext context, int index) {
          final Proverb proverb = vm.proverbs![index];
          var meaning = proverb.meaning!
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
          final synonyms = proverb.synonyms!.split(',');
          final titleTxtStyle = TextStyles.CalloutFocus.bold
              .size(22)
              .textColor(ThemeColors.primary)
              .textHeight(1.2);
          final bodyTxtStyle =
              TextStyles.Body1.size(18).textColor(Colors.black);
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
              onTap: () => vm.openProverb(proverb),
              title: Text(proverb.title!, style: titleTxtStyle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (proverb.meaning!.isNotEmpty)
                    Text(meaning, style: bodyTxtStyle, maxLines: 2),
                  if (proverb.synonyms!.isNotEmpty) const SizedBox(height: 5),
                  if (proverb.synonyms!.isNotEmpty) synonymsContainer,
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
