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

part 'widgets/word_details.dart';

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
  late Word word;
  IconData likeIcon = Icons.favorite_border;
  bool isLiked = false, likeChanged = false;

  @override
  Widget build(BuildContext context) {
    word = widget.word;

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
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ThemeColors.bgColorPrimary3(context),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '${AppConstants.appTitle} - ${AppConstants.appTitle1}',
                style: TextStyles.headingStyle1.bold.size(25),
              ),
            ),
            body: state.maybeWhen(
              failure: (feedback) => EmptyState(title: feedback),
              orElse: () => const EmptyState(title: 'Hamna chochote hapa'),
              progress: () => const LoadingProgress(title: "Inapakia data ..."),
              loaded: (meanings, synonyms) {
                return WordDetails(
                  word: word,
                  meanings: meanings,
                  synonyms: synonyms,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
