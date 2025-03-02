import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../core/navigator/route_names.dart';
import '../bloc/data_init_bloc.dart';

class DataInitScreen extends StatefulWidget {
  const DataInitScreen({super.key});

  @override
  State<DataInitScreen> createState() => DataInitScreenState();
}

class DataInitScreenState extends State<DataInitScreen> {
  @override
  Widget build(BuildContext context) {
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
          } else if (state is DataInitFailureState) {
            CustomSnackbar.show(context, state.feedback);
          } else if (state is DataInitSavedState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.home,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          var bloc = context.read<DataInitBloc>();
          return Scaffold(
            body: state.maybeWhen(
              orElse: () => const SizedBox(),
              failure: (feedback) => EmptyState(
                title: 'Hamna chochote hapa',
                showRetry: true,
                onRetry: () => bloc.add(const FetchData()),
              ),
              progress: () => const LoadingProgress(title: "Inapakia data ..."),
              saving: (feedback) => LoadingProgress(title: feedback),
            ),
          );
        },
      ),
    );
  }
}
