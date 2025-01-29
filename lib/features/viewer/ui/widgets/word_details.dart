part of '../word_viewer.dart';

class WordDetails extends StatelessWidget {
  final Word word;
  final List<String> meanings;
  final List<String> synonyms;

  const WordDetails({
    super.key,
    required this.word,
    required this.meanings,
    required this.synonyms,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle titleTxtStyle =
        TextStyles.headingStyle2.bold.size(25).textColor(ThemeColors.primary);
    TextStyle bodyTxtStyle =
        TextStyles.bodyStyle1.size(20).textColor(ThemeColors.primary);

    final wordTitle = Padding(
      padding: const EdgeInsets.all(10),
      child: Text(word.title ?? "No Title", style: titleTxtStyle),
    );

    final wordConjugation = (word.conjugation?.isNotEmpty ?? false)
        ? Html(
            data: "<p><b>Mnyambuliko:</b> <i>${word.conjugation}</i></p>",
            style: {"p": Style(fontSize: FontSize(20))},
          )
        : const SizedBox.shrink();
    final wordMeaning = ListView.builder(
        shrinkWrap: true,
        itemCount: meanings.length,
        itemBuilder: (context, index) {
          final meaning = meanings[index];
          final extra = meaning.split(":");
          if (extra.length == 2) {
            return Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  minLeadingWidth: 5,
                  leading: Text('${index + 1}.', style: bodyTxtStyle),
                  title: Text(extra[0], style: bodyTxtStyle),
                  subtitle: Html(
                    data: "<p><b>Mfano:</b> ${extra[1]}</p>",
                    style: {
                      "p": Style(
                        fontSize: FontSize(18),
                        color: ThemeColors.primary,
                      )
                    },
                  ),
                ),
              ),
            );
          } else {
            return Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  minLeadingWidth: 5,
                  leading: Text('${index + 1}.', style: bodyTxtStyle),
                  title: Text(extra[0], style: bodyTxtStyle),
                ),
              ),
            );
          }
        });
    final wordSynonyms = synonyms.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: synonyms.length,
            itemBuilder: (context, index) {
              final synonym = synonyms[index];
              return Card(
                elevation: 2,
                color: Colors.white,
                child: ListTile(
                  leading: const Icon(Icons.arrow_circle_right),
                  title: Text(
                    synonym,
                    style: const TextStyle(
                        fontSize: 20, color: ThemeColors.primary),
                  ),
                ),
              );
            })
        : const SizedBox.shrink();

    final wordBody = SizedBox(
      height: size.height - 150,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wordMeaning,
            if (synonyms.isNotEmpty)
              const Padding(
                padding: EdgeInsets.all(5),
                child: Divider(color: Colors.white),
              ),
            if (synonyms.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('VISAWE', style: titleTxtStyle),
              ),
            wordSynonyms,
          ],
        ),
      ),
    );

    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, ThemeColors.accent, ThemeColors.primary],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wordTitle,
          wordConjugation,
          wordBody,
        ],
      ),
    );
  }
}
