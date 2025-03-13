import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/progress/custom_snackbar.dart';
import '../../widgets/progress/general_progress.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../blocs/datainit/data_init_bloc.dart';

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
              saving: (feedback, progress) => Column(
                children: [
                  const Spacer(),
                  LoadingProgress(title: feedback),
                  if (progress > 0.0) ...[
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: LinearPercentIndicator(
                        lineHeight: 50,
                        percent: progress * .01,
                        center: Text(
                          "$progress %",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        barRadius: const Radius.circular(20),
                        backgroundColor: ThemeColors.bgColorPrimary4(context),
                        progressColor: Colors.green,
                      ),
                    ),
                  ],
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
