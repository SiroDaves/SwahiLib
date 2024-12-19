import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../core/navigator/route_names.dart';
import '../bloc/data_init_bloc.dart';
import 'widgets/data_init_widgets.dart';

class DataInitScreen extends StatefulWidget {
  const DataInitScreen({super.key});

  @override
  State<DataInitScreen> createState() => DataInitScreenState();
}

class DataInitScreenState extends State<DataInitScreen> {
  String selectedBooks = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double radius = isDesktop ? size.height / 2.5 : size.width / 2.5;

    return BlocProvider(
      create: (context) => DataInitBloc()..add(const FetchData()),
      child: BlocConsumer<DataInitBloc, DataInitState>(
        listener: (context, state) {
          if (state is DataInitFetchedState) {
            context.read<DataInitBloc>().add(
                  SaveData(
                    state.idioms,
                    state.proverbs,
                    state.sayings,
                    state.words,
                  ),
                );
          }
          if (state is DataInitFailureState) {
            CustomSnackbar.show(context, state.feedback);
          }
          if (state is DataInitSavedState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.home,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          var bloc = context.read<DataInitBloc>();
          Widget bodyWidget = EmptyState(
            title: 'Sorry nothing to show here at the moment.',
            showRetry: true,
            onRetry: () => bloc.add(const FetchData()),
          );

          if (state is DataInitProgressState) {
            bodyWidget = const CircularProgress();
          } else if (state is DataInitSavingState) {
            bodyWidget = Stack(
              children: [
                BackgroundProgress(
                  size: size,
                  progress: state.progress,
                ),
                ForegroundProgress(
                  progress: state.progress,
                  radius: radius,
                  feedback: state.feedback,
                ),
              ],
            );
          }
          return Scaffold(body: bodyWidget);
        },
      ),
    );
  }
}
