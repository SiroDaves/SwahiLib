part of 'word_screen.dart';

class WordView extends StatelessWidget {
  final Word word;
  final List<String> meanings;
  final List<String> synonyms;

  const WordView({
    super.key,
    required this.word,
    required this.meanings,
    required this.synonyms,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 100,
            floating: false,
            pinned: true,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(
                word.title ?? "",
                style: TextStyles.headingStyle2.bold
                    .size(25)
                    .textColor(Colors.white),
              ),
            ),
          ),
        ];
      },
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, ThemeColors.accent, ThemeColors.primary],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (word.conjugation?.isNotEmpty ?? false)
                Html(
                  data: "<p><b>Mnyambuliko:</b> <i>${word.conjugation}</i></p>",
                  style: {"p": Style(fontSize: FontSize(20))},
                ),
              WordDetails(
                word: word,
                meanings: meanings,
                synonyms: synonyms,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
