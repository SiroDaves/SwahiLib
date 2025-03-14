import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/models.dart';
import '../../../core/network/api_util.dart';
import '../../../core/utils/app_util.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_data.dart';
import '../../theme/theme_fonts.dart';
import '../../widgets/action/base_buttons.dart';
import '../../widgets/general/labels.dart';
import '../../widgets/progress/general_progress.dart';
import '../../widgets/progress/skeleton.dart';
import '../../blocs/home/home_bloc.dart';
import '../viewer/word_screen.dart';
import 'common/home_utils.dart';

part 'widgets/views/home_appbar.dart';
part 'widgets/views/home_body.dart';
part 'widgets/lists/words_lists.dart';
part 'widgets/lists/idioms_list.dart';
part 'widgets/lists/sayings_list.dart';
part 'widgets/lists/proverbs_list.dart';
part 'widgets/update_now.dart';
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
      create: (context) {
        _bloc = HomeBloc();
        isConnectedToInternet().then((connected) {
          if (connected) {
            _bloc.add(const CheckAppUpdates());
          } else {
            _bloc.add(const FetchData());
          }
        });
        return _bloc;
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeUpdateAppState) {
            if (!state.hasNewUpdate) {
              _bloc.add(const FetchData());
            }
          } else if (state is HomeFetchedDataState) {
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
            title: Text(
              '${AppConstants.appTitle} - ${AppConstants.appTitle1}',
              style: TextStyles.headingStyle1.bold.size(25),
            ),
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
            updateApp: (hasUpdate, appUpdate) => Scaffold(
              appBar: appBar,
              body: UpdateNow(update: appUpdate),
            ),
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
