import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/pref_repository.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../../common/utils/constants/pref_constants.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/skeleton.dart';
import '../../../core/di/injectable.dart';
import '../../../core/theme/theme_fonts.dart';
import '../bloc/home_bloc.dart';

part 'widgets/filter_letters.dart';
part 'widgets/words_list.dart';
part 'widgets/idioms_list.dart';
part 'widgets/sayings_list.dart';
part 'widgets/proverbs_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Timer? _syncTimer;
  bool periodicSyncStarted = false;

  late HomeBloc _bloc;
  final _prefRepo = getIt<PrefRepository>();

  List<Idiom> idioms = [];
  List<Proverb> proverbs = [];
  List<Saying> sayings = [];
  List<Word> words = [];
  int selectedPage = 0, selectedBook = 0;

  @override
  void dispose() {
    _syncTimer?.cancel();
    super.dispose();
  }

  void startPeriodicSync() {
    periodicSyncStarted = true;
    bool wordsLoaded = _prefRepo.getPrefBool(PrefConstants.wordsAreLoadedKey);

    _syncTimer = Timer.periodic(const Duration(minutes: 5), (_) async {
      if (wordsLoaded) _bloc.add(const FetchData());
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
            idioms = state.idioms;
            proverbs = state.proverbs;
            sayings = state.sayings;
            words = state.words;

            if (!periodicSyncStarted) {
              _bloc.add(const FetchData());
              startPeriodicSync();
            }
          }
        },
        builder: (context, state) {
          var appBar1 = AppBar(
            centerTitle: true,
            title: Text(AppConstants.appTitle,
                style: TextStyles.headingStyle1.bold.size(25)),
          );
          var appBar2 = AppBar(
            centerTitle: true,
            title: Text(AppConstants.appTitle,
                style: TextStyles.headingStyle1.bold.size(25)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: filterContainer,
            ),
            /*leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () async {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.settings),
                ),
              ),
            ),*/
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () async {
                    /*await showSearch(
                      context: context,
                      delegate: SearchList1(context, vm, size!.height),
                    );*/
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          );
          var emptyState = EmptyState(
            title: 'Samahani hamna chochote hapa',
            showRetry: true,
            onRetry: () => context.read<HomeBloc>().add(const FetchData()),
          );

          return state.maybeWhen(
            orElse: () => Scaffold(appBar: appBar1, body: emptyState),
            progress: () => const Scaffold(body: SkeletonLoading()),
            failure: (feedback) => Scaffold(appBar: appBar1, body: emptyState),
            fetched: (idioms, proverbs, sayings, words) => Scaffold(
              appBar: appBar2,
              body: SafeArea(
                child: Row(
                  children: <Widget>[
                    filterLetters,
                    IndexedStack(
                      index: selectedPage,
                      children: <Widget>[
                        WordsList(words: words),
                        IdiomsList(idioms: idioms),
                        SayingsList(sayings: sayings),
                        ProverbsList(proverbs: proverbs),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
