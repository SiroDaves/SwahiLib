part of '../home_screen.dart';

class IdiomsList extends StatelessWidget {
  final List<Idiom> idioms;
  const IdiomsList({super.key, required this.idioms});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 85,
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: vm.filterIdioms!.length,
        itemBuilder: (BuildContext context, int index) {
          final Idiom idiom = vm.filterIdioms![index];
          var meaning = idiom.meaning!
              .replaceAll("\\", "")
              .replaceAll('"', '')
              .replaceAll(',', ', ')
              .replaceAll('  ', ' ');
          final contents = meaning.split(";");
          var extra = contents[0].split(":");

          meaning = " ~ ${extra[0].trim()}.";

          if (contents.length > 1) {
            extra = contents[1].split(":");
            meaning = "$meaning\n ~ ${extra[0].trim()}.";
          }
          final titleTxtStyle = TextStyles.CalloutFocus.bold
              .size(22)
              .textColor(ThemeColors.primary)
              .textHeight(1.2);
          final bodyTxtStyle =
              TextStyles.Body1.size(18).textColor(Colors.black);

          return Card(
            elevation: 2,
            child: ListTile(
              onTap: () => vm.openIdiom(idiom),
              title: Text(idiom.title!, style: titleTxtStyle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(meaning, style: bodyTxtStyle, maxLines: 2),
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
