part of 'advanced_progress.dart';

/// Advanced progress widget.
/// Represents two progress, primary and secondary.
class AdvancedProgress extends StatelessWidget {
  const AdvancedProgress({
    Key? key,
    required this.radius,
    this.primaryValue,
    this.secondaryValue,
    this.secondaryWidth = 10.0,
    this.startAngle = 120.0,
    this.maxDegrees = 300.0,
    this.progressGap = 0.0,
    this.division = 10,
    this.levelAmount,
    this.levelLowWidth = 1.0,
    this.levelLowHeight = 8.0,
    this.levelHighWidth = 2.0,
    this.levelHighHeight = 16.0,
    this.levelHighBeginEnd = false,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.child,
  }) : super(key: key);

  /// Total radius for whole widget.
  final double radius;

  /// Value for primary progress.
  final double? primaryValue;

  /// Value for secondary progress.
  final double? secondaryValue;

  /// Secondary progress width.
  final double secondaryWidth;

  /// Progress start angle.
  final double startAngle;

  /// Progress degrees from [startAngle].
  final double maxDegrees;

  /// Gap between primary and secondary progress.
  final double progressGap;

  /// Primary progress division.
  final int division;

  /// Amount of levels on primary progress.
  final int? levelAmount;

  /// Width of levels on primary progress.
  final double levelLowWidth;

  /// Height of low levels on primary progress.
  final double levelLowHeight;

  /// Height of high levels managed by [division] on primary progress.
  final double levelHighHeight;

  /// Width of levels on primary progress.
  final double levelHighWidth;

  /// True if need to begin and end with high level.
  final bool levelHighBeginEnd;

  /// Primary color that used as a color for progress of first in gradient.
  /// User for primary and secondary progress.
  final Color? primaryColor;

  /// Secondary color that used last in gradient.
  /// User for primary and secondary progress.
  final Color? secondaryColor;

  /// Tertiary color that used for inactive part of progress.
  /// User for primary and secondary progress.
  final Color? tertiaryColor;

  /// Child widget.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = radius * 2;

    return Container(
      clipBehavior: Clip.antiAlias,
      width: size,
      height: size,
      decoration: const BoxDecoration(),
      child: CustomPaint(
        painter: AdvancedProgressPainter(
          primaryValue: primaryValue,
          secondaryValue: secondaryValue,
          secondaryWidth: secondaryWidth,
          radius: radius,
          startAngle: startAngle,
          maxDegrees: maxDegrees,
          progressGap: progressGap,
          division: division,
          levelAmount: levelAmount,
          levelLowWidth: levelLowWidth,
          levelLowHeight: levelLowHeight,
          levelHighWidth: levelHighWidth,
          levelHighHeight: levelHighHeight,
          levelHighBeginEnd: levelHighBeginEnd,
          primaryColor: primaryColor ?? theme.indicatorColor,
          secondaryColor: secondaryColor ?? primaryColor,
          tertiaryColor: tertiaryColor ?? theme.hintColor,
        ),
        child: child,
      ),
    );
  }
}
