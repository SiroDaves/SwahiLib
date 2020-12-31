import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AsLineProgress extends StatefulWidget {
  final double measurement;
  final double progress;
  AsLineProgressState asTextViewState;

  AsLineProgress(
    {
      this.measurement,
      this.progress
    }
  );

  @override
  createState() => asTextViewState = new AsLineProgressState( measurement: this.measurement, progress: this.progress );

  void setProgress(double newProgress) {
    asTextViewState.setNewProgress(newProgress);
  }

  static Widget setUp(double widthValue, double progressValue) {
    return new AsLineProgress(
      measurement: widthValue ,
      progress: progressValue   
    );
  }
}

class AsLineProgressState extends State<AsLineProgress> {
  double measurement;
  double progress;

  AsLineProgressState( { this.measurement, this.progress } );

  @override
  Widget build(BuildContext context) {
    return new LinearPercentIndicator(
      width: measurement,
      lineHeight: 40,
      percent: progress,
      linearStrokeCap: LinearStrokeCap.round,
      progressColor: Colors.orangeAccent,
      backgroundColor: Colors.white,
    );
  }

  void setNewProgress(double newProgress) {
    setState(() { progress = newProgress; });
  }

}
