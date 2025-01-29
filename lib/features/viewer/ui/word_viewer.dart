import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/constants/app_constants.dart';
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
                  ],
                ),
                body: const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}
