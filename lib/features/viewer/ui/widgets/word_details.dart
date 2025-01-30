part of '../word_screen.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (meanings.isNotEmpty) MeaningCard(meanings: meanings),
        if (synonyms.isNotEmpty) ...[
          const SizedBox(height: 15),
          Text(
            'Visawe',
            style: TextStyles.headingStyle2.bold
                .size(25)
                .italic
                .textColor(ThemeColors.primary),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: synonyms.length,
            itemBuilder: (context, index) =>
                SynonymCard(synonym: synonyms[index]),
          ),
        ],
      ],
    );
  }
}

class MeaningCard extends StatelessWidget {
  final List<String> meanings;

  const MeaningCard({super.key, required this.meanings});

  @override
  Widget build(BuildContext context) {
    final String formattedHtml = meanings.asMap().entries.map((entry) {
      final parts = entry.value.split(":");
      return parts.length > 1
          ? "<li>${parts.first}<br><b>Mfano:</b> <i>${parts.last}</i></li>"
          : "<li>${parts.first}</li>";
    }).join();

    return Card(
      elevation: 2,
      color: Colors.white,
      child: Html(
        data: "<ol>$formattedHtml</ol>",
        style: {
          "ol": Style(
            fontSize: FontSize(18),
            color: ThemeColors.primary,
          ),
          "li": Style(
            margin: Margins.only(bottom: 10),
          ),
        },
      ),
    );
  }
}

class SynonymCard extends StatelessWidget {
  final String synonym;

  const SynonymCard({super.key, required this.synonym});

  @override
  Widget build(BuildContext context) {
    final TextStyle bodyTxtStyle =
        TextStyles.bodyStyle1.size(20).textColor(ThemeColors.primary);

    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(Icons.arrow_circle_right, color: ThemeColors.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(synonym, style: bodyTxtStyle),
            ),
          ],
        ),
      ),
    );
  }
}
