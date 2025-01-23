part of '../word_viewer.dart';

class WordMeaning extends StatelessWidget {
  final Word word;
  WordMeaning({super.key, required this.word});

  TextStyle bodyTxtStyle =
      TextStyles.bodyStyle1.size(20).textColor(ThemeColors.primary);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: vm.meanings.length,
        itemBuilder: (context, index) {
          final meaning = vm.meanings[index]!;
          final extra = meaning.split(":");
          if (extra.length == 2) {
            return Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  minLeadingWidth: 5,
                  leading: Text('${index + 1}.', style: bodyTxtStyle),
                  title: Text(
                    extra[0],
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Html(
                    data: "<p><b>Mfano:</b> ${extra[1]}</p>",
                    style: {
                      "p": Style(
                        fontSize: FontSize(18),
                      ),
                    },
                  ),
                ),
              ),
            );
          } else {
            return Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  minLeadingWidth: 5,
                  leading: Text('${index + 1}.', style: bodyTxtStyle),
                  title: Text(extra[0], style: const TextStyle(fontSize: 20)),
                ),
              ),
            );
          }
        });
  }
}
