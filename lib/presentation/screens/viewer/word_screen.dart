import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../data/models/models.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../widgets/progress/custom_snackbar.dart';
import '../../widgets/progress/general_progress.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_fonts.dart';
import '../../blocs/viewer/viewer_bloc.dart';

part 'widgets/word_details.dart';
part 'word_view.dart';

class WordScreen extends StatefulWidget {
  final Word word;
  final List<Word> words;

  const WordScreen({
    super.key,
    required this.word,
    required this.words,
  });

  @override
  State<WordScreen> createState() => WordScreenState();
}

class WordScreenState extends State<WordScreen> {
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
            appBar: AppBar(
              title: const Text(
                '${AppConstants.appTitle} - ${AppConstants.appTitle1}',
              ),
            ),
            body: state.maybeWhen(
              failure: (feedback) => EmptyState(title: feedback),
              orElse: () => const EmptyState(title: 'Hamna chochote hapa'),
              progress: () => const LoadingProgress(title: "Inapakia data ..."),
              loaded: (meanings, synonyms) {
                return WordView(
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
