import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/utils/date_util.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/skeleton.dart';
import '../../../core/navigator/route_names.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_styles.dart';
import '../bloc/home_bloc.dart';

part 'widgets/sessions_preview.dart';
part 'widgets/speakers_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Bookmark> bookmarks = [];
  List<Room> rooms = [];
  List<Speaker> speakers = [];
  List<Session> sessions = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const FetchOnlineData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFetchedOnlineState) {
            if (state.fetched) {
              CustomSnackbar.show(
                context,
                'Sessions are available, please proceed to your session',
                isSuccess: true,
              );
            } else {
              CustomSnackbar.show(context, 'Unable to fetch sessions');
            }
            context.read<HomeBloc>().add(const FetchLocalData());
          }
          if (state is HomeFetchedLocalState) {
            bookmarks = state.bookmarks;
            rooms = state.rooms;
            sessions = state.sessions;
            speakers = state.speakers;
          }
        },
        builder: (context, state) {
          var appBar = AppBar(
            title: GestureDetector(
              child: Image.asset(AppAssets.droidconIcon, height: 50),
              onTap: () => Navigator.pushNamed(context, RouteNames.settings),
            ),
          );
          var emptyState = EmptyState(
            title: 'Sorry nothing to show here at the moment.',
            showRetry: true,
            onRetry: () =>
                context.read<HomeBloc>().add(const FetchOnlineData()),
          );

          return state.maybeWhen(
            orElse: () => Scaffold(appBar: appBar, body: emptyState),
            progress: () => const Scaffold(body: SkeletonLoading()),
            failure: (feedback) => Scaffold(appBar: appBar, body: emptyState),
            fetchedLocal: (bookmarks, rooms, speakers, sessions) => Scaffold(
              appBar: appBar,
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SpeakersCarousel(parent: this),
                    SessionsPreview(parent: this),
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
