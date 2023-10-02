import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomPercentIndicator extends StatelessWidget {
  final double percent;
  const CustomPercentIndicator({Key? key, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 17.0,
      animationDuration: 1500,
      percent: percent,
      animateFromLastPercent: true,
      progressColor: Colors.blue,
      animation: false,
    );
  }
}
