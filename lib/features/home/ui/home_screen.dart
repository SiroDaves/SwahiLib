import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/skeleton.dart';
import '../../../core/navigator/route_names.dart';
import '../bloc/home_bloc.dart';

//part 'widgets/sessions_preview.dart';
//part 'widgets/speakers_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Idiom> idioms = [];
  List<Proverb> proverbs = [];
  List<Saying> sayings = [];
  List<Word> words = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const FetchData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFetchedDataState) {
            idioms = state.idioms;
            proverbs = state.proverbs;
            sayings = state.sayings;
            words = state.words;
          }
        },
        builder: (context, state) {
          var appBar = AppBar(
            title: GestureDetector(
              child: Image.asset(AppAssets.appIcon, height: 50),
              onTap: () => Navigator.pushNamed(context, RouteNames.settings),
            ),
          );
          var emptyState = EmptyState(
            title: 'Sorry nothing to show here at the moment.',
            showRetry: true,
            onRetry: () => context.read<HomeBloc>().add(const FetchData()),
          );

          return state.maybeWhen(
            orElse: () => Scaffold(appBar: appBar, body: emptyState),
            progress: () => const Scaffold(body: SkeletonLoading()),
            failure: (feedback) => Scaffold(appBar: appBar, body: emptyState),
            fetched: (idioms, proverbs, sayings, words) => Scaffold(
              appBar: appBar,
              body: const SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //SpeakersCarousel(parent: this),
                    //SessionsPreview(parent: this),
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
