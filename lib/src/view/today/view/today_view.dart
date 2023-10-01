import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TodayView extends ConsumerWidget {
  TodayView({
    Key? key,
  }) : super(key: key);
  final double progressPercent = 0.55;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SizedBox(
        height: DeviceSize.kHeight(context),
        child: Column(
          children: [
            SizedBox(
              height: DeviceSize.kHeight(context) * 0.5,
              child: CircularPercentIndicator(
                progressColor: currentTheme.disabledColor,
                radius: 170,
                lineWidth: 15,
                percent: progressPercent,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: currentTheme.canvasColor,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Drink Target",
                      style: currentTheme.textTheme.headlineLarge,
                    ),
                    Text(
                      "1800 / 2500 ml",
                      style: currentTheme.textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: DeviceSize.kHeight(context) * 0.3,
            )
          ],
        ));
  }
}
