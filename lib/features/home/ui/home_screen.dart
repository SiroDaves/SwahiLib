import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../../common/widgets/general/labels.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/skeleton.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_data.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../viewer/ui/word_screen.dart';
import '../bloc/home_bloc.dart';
import '../common/home_utils.dart';

part 'widgets/views/home_appbar.dart';
part 'widgets/views/home_body.dart';
part 'widgets/lists/words_lists.dart';
part 'widgets/lists/idioms_list.dart';
part 'widgets/lists/sayings_list.dart';
part 'widgets/lists/proverbs_list.dart';
part 'search/word_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Timer? _syncTimer;
  bool periodicSyncStarted = false;

  late HomeBloc _bloc;

  List<Word> words = [], filteredWords = [];
  List<Idiom> idioms = [], filteredIdioms = [];
  List<Saying> sayings = [], filteredSayings = [];
  List<Proverb> proverbs = [], filteredProverbs = [];

  String setLetter = '', query = '';
  int setPage = 0;

  @override
  void dispose() {
    _syncTimer?.cancel();
    super.dispose();
  }

  void startPeriodicSync() {
    periodicSyncStarted = true;

    _syncTimer = Timer.periodic(const Duration(minutes: 5), (_) async {
      _bloc.add(const FetchData());
    });
  }

  void onTabChanged(int index) {
    setState(() => setPage = index);
  }

  void onLetterTapped(String letter) {
    setState(() {
      setLetter = letter;
      filterList(setPage, letter, this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const FetchData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          _bloc = context.read<HomeBloc>();
          if (state is HomeFetchedDataState) {
            words = state.words;
            idioms = state.idioms;
            proverbs = state.proverbs;
            sayings = state.sayings;

            filteredWords = words;
            filteredIdioms = idioms;
            filteredProverbs = proverbs;
            filteredSayings = sayings;

            /*if (!periodicSyncStarted) {
              _bloc.add(const FetchData());
              startPeriodicSync();
            }*/
          }
        },
        builder: (context, state) {
          var appBar = AppBar(
            centerTitle: true,
            title: Text(AppConstants.appTitle,
                style: TextStyles.headingStyle1.bold.size(25)),
          );

          var emptyState = EmptyState(
            title: 'Samahani hamna chochote hapa',
            showRetry: true,
            onRetry: () => context.read<HomeBloc>().add(const FetchData()),
          );

          return state.maybeWhen(
            orElse: () => Scaffold(appBar: appBar, body: emptyState),
            progress: () => const Scaffold(body: SkeletonLoading()),
            failure: (feedback) => Scaffold(appBar: appBar, body: emptyState),
            fetched: (idioms, proverbs, sayings, words) => Scaffold(
              appBar: HomeAppBar(parent: this),
              body: HomeBody(parent: this),
            ),
          );
        },
      ),
    );
  }
}
