import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';
import '../bloc/viewer_bloc.dart';

part 'widgets/word_widgets.dart';

class WordViewer extends StatefulWidget {
  final Word word;
  final List<Word> words;

  const WordViewer({
    super.key,
    required this.word,
    required this.words,
  });

  @override
  State<WordViewer> createState() => WordViewerState();
}

class WordViewerState extends State<WordViewer> {
  bool isTabletOrIpad = false, isLiked = false, likeChanged = false;
  late Word word;
  late List<Word> words;
  List<String?> synonyms = [], meanings = [];

  IconData likeIcon = Icons.favorite_border;
  TextStyle titleTxtStyle =
      TextStyles.headingStyle2.bold.size(25).textColor(ThemeColors.primary);
  TextStyle bodyTxtStyle =
      TextStyles.bodyStyle1.size(20).textColor(ThemeColors.primary);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;
    word = widget.word;
    words = widget.words;

    final wordTitle = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(word.title!, style: titleTxtStyle),
    );

    final wordSynoyms = ListView.builder(
        shrinkWrap: true,
        itemCount: synonyms.length,
        itemBuilder: (context, index) {
          final synonym = synonyms[index]!;
          return Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.arrow_circle_right),
              title: Text(synonym, style: const TextStyle(fontSize: 20)),
            ),
          );
        });

    return BlocProvider(
      create: (context) => ViewerBloc()..add(LoadWord(widget.word)),
      child: BlocConsumer<ViewerBloc, ViewerState>(
        listener: (context, state) {
          if (state is ViewerFailureState) {
            CustomSnackbar.show(context, state.feedback);
          } else if (state is ViewerLikedState) {
            setState(() {
              //word.liked = !word.liked;
              likeChanged = true;
            });
            if (state.liked) {
              CustomSnackbar.show(
                context,
                '${word.title} added to your likes',
                isSuccess: true,
              );
            } else {
              CustomSnackbar.show(
                context,
                '${word.title} removed from your likes',
              );
            }
          } else if (state is ViewerLoadedState) {
            setState(() {
              //songVerses = state.songVerses!;
              //widgetTabs = state.widgetTabs!;
              //widgetContent = state.widgetContent!;
            });
          }
        },
        builder: (context, state) {
          return state.maybeWhen(
            progress: () => const Scaffold(body: CircularProgress()),
            orElse: () => PopScope(
              canPop: false,
              onPopInvokedWithResult: (bool didPop, dynamic result) async {
                if (didPop) {
                  return;
                }
                if (context.mounted) {
                  Navigator.pop(context, likeChanged);
                }
              },
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(AppConstants.appKamusi),
                  actions: <Widget>[
                    InkWell(
                      onTap: () {
                        context.read<ViewerBloc>().add(LikeWord(word));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(word.liked!
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                    ),
                    /*InkWell(
                    onTap: () async {
                      await showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return ListViewPopup(song: vm.song!);
                          });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.list),
                    ),
                  ),*/
                  ],
                ),
                body: Container(
                  constraints: const BoxConstraints.expand(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          ThemeColors.accent,
                          ThemeColors.primary
                        ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      wordTitle,
                      if (word.conjugation!.isNotEmpty)
                        Html(
                          data:
                              "<p><b>Mnyambuliko:</b> <i>${word.conjugation!}</i></p>",
                          style: {
                            "p": Style(
                              fontSize: FontSize(20),
                            ),
                          },
                        ),
                      SizedBox(
                        height: size.height - 150,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //wordMeaning,
                              if (synonyms.isNotEmpty)
                                const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Divider(color: Colors.white),
                                ),
                              if (synonyms.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'VISAWE',
                                    style: titleTxtStyle,
                                  ),
                                ),
                              if (synonyms.isNotEmpty) wordSynoyms,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
