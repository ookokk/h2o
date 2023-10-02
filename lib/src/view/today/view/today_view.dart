import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TodayView extends ConsumerWidget {
  TodayView({
    Key? key,
  }) : super(key: key);
  final double progressPercent = 0.55;
  final dataBox = getIt.get<IHiveManager>();

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
                      Strings.kTodayDrinkTarget,
                      style: currentTheme.textTheme.headlineLarge,
                    ),
                    Text(
                      dataBox.user.get('dailyWaterNeed').toString(),
                      style: currentTheme.textTheme.displaySmall,
                    ),
                    Text(
                      'mL',
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
