import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../common/utils/constants/app_assets.dart';
import '../../../../common/widgets/progress/advanced/advanced_progress.dart';
import '../../../../common/widgets/progress/wave/wave_progress.dart';
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
    Key? key,
    required this.progress,
    required this.radius,
    required this.feedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdvancedProgress(
        radius: radius,
        levelAmount: 100,
        levelLowHeight: 16,
        levelHighHeight: 20,
        division: 10,
        secondaryWidth: 10,
        progressGap: 10,
        primaryValue: progress / 100,
        secondaryValue: progress / 100,
        primaryColor: Colors.yellow,
        secondaryColor: Colors.red,
        tertiaryColor: Colors.white24,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$progress %',
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: radius / 1.5,
                color: Colors.white,
              ),
            ),
            Text(
              feedback.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.w800,
                fontSize: radius / 8,
                color: Colors.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveProgress extends StatelessWidget {
  const WaveProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bgImage = Theme.of(context).brightness == Brightness.light
        ? AppAssets.imgBg
        : AppAssets.imgBgBw;
    var color1 = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent
        : Colors.white;
    var color2 = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : Colors.black;

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 2,
            child: WaveProgressIndicator(
              value: 0.35,
              valueColor: AlwaysStoppedAnimation(color1),
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              borderWidth: 5.0,
            ),
          ),
          Text(
            'Get ready,\nGet ready ...',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          WaveProgressIndicator(
            value: 0.35,
            valueColor: AlwaysStoppedAnimation(color2),
            backgroundColor: Colors.white,
            borderColor: Colors.black,
            borderWidth: 5.0,
          ),
        ],
      ),
    );
  }
}
