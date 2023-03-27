import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../theme/theme_colors.dart';

class LineProgress extends StatelessWidget {
  /// height or width of the linear percentindicator
  final double size;

  /// progress value of the linear percentindicator
  final int progress;

  /// Color of the text
  final Color foreColor;

  /// Color of the border for the widget
  final Color borderColor;

  /// Progress Color of the indicator
  final Color progressColor;

  /// Background Color for the widget
  final Color backgroundColor;

  /// Background Color for the widget
  final bool isVertical;

  const LineProgress({
    Key? key,
    this.size = 100,
    this.progress = 0,
    this.foreColor = Colors.white,
    this.borderColor = Colors.black,
    this.progressColor = ThemeColors.primary,
    this.backgroundColor = Colors.grey,
    this.isVertical = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leadingContainer = Container(
      height: size,
      width: (size / 2) - 20,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: progressColor,
        border: Border.all(color: foreColor),
        borderRadius: BorderRadius.all(
          Radius.elliptical(size / 4, size / 2),
        ),
      ),
    );

    return RotatedBox(
      quarterTurns: isVertical ? 7 : 0,
      child: Container(
        height: size,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          boxShadow: const [BoxShadow(blurRadius: 3)],
          borderRadius: BorderRadius.all(
            Radius.elliptical(size / 4, size / 2),
          ),
        ),
        child: Stack(
          children: <Widget>[
            LinearPercentIndicator(
              percent: double.parse((progress / 100).toStringAsFixed(1)),
              barRadius: Radius.elliptical(size / 4, size / 2),
              lineHeight: size,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
            ),
            /*leadingContainer.positioned(
              top: 0,
              bottom: 0,
              right: 285 - (2.9 * progress),
              left: 2.9 * progress,
            ),*/
            RotatedBox(
              quarterTurns: isVertical ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    "$progress %",
                    style: TextStyle(
                      fontSize: isVertical ? 40 : 20,
                      fontWeight: FontWeight.bold,
                      color: foreColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListLoading extends StatelessWidget {
  const ListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rowWidget = Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 20,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 30,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 15,
          child: Row(
            children: <Widget>[
              const Spacer(),
              Container(
                width: 75,
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              Container(
                width: 75,
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return SkeletonLoader(
      builder: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: rowWidget,
      ),
      items: 10,
      period: const Duration(seconds: 3),
      highlightColor: ThemeColors.primary,
      direction: SkeletonDirection.ltr,
    );
  }
}
