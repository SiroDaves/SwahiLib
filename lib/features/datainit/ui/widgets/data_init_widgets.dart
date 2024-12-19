import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/theme/theme_colors.dart';

class BackgroundProgress extends StatelessWidget {
  final Size size;
  final int progress;

  const BackgroundProgress({
    super.key,
    required this.size,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 7,
      child: SizedBox(
        height: size.width,
        child: LinearPercentIndicator(
          percent: progress / 100,
          lineHeight: size.width,
          backgroundColor: Colors.black,
          progressColor: ThemeColors.primaryDark,
        ),
      ),
    );
  }
}

class ForegroundProgress extends StatelessWidget {
  final int progress;
  final double radius;
  final String feedback;

  const ForegroundProgress({
    super.key,
    required this.progress,
    required this.radius,
    required this.feedback,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:SizedBox()
    );
  }
}
