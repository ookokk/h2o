import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/today/viewmodel/water_intake_viewmodel.dart';
import 'package:h2o_flutter/src/view/today/widget/drink_water_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TodayView extends ConsumerStatefulWidget {
  const TodayView({Key? key}) : super(key: key);

  @override
  TodayViewState createState() => TodayViewState();
}

class TodayViewState extends ConsumerState<TodayView> {
  final dataBox = getIt.get<IHiveManager>();

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final constantWaterNeedValue =
        ref.watch(waterIntakeProvider).dataBox.user.get('dailyWaterNeed');
    final updatingWaterNeedValue =
        ref.watch(waterIntakeProvider).dataBox.user.get('updatingWaterNeed');
    final double progressPercent =
        (updatingWaterNeedValue / constantWaterNeedValue).clamp(0.0, 1.0);

    return SingleChildScrollView(
      child: SizedBox(
        height: DeviceSize.kHeight(context),
        child: Column(
          children: [
            CircularPercentIndicator(
              progressColor: currentTheme.disabledColor,
              radius: 150,
              lineWidth: 15,
              percent: progressPercent,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: currentTheme.canvasColor,
              center: Text(
                "${updatingWaterNeedValue.toStringAsFixed(2)} ${Strings.kHomeMl}",
                style: currentTheme.textTheme.displaySmall,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              child: Column(
                children: [
                  DrinkWaterButton(
                    onTap: () {
                      setState(() {
                        WaterIntakeViewModel(dataBox)
                            .decreaseWaterIntakeBy300Ml();
                      });
                    },
                    text: Strings.kHome300ml,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        WaterIntakeViewModel(dataBox)
                            .increaseWaterIntakeBy300Ml();
                      });
                    },
                    icon: const Icon(Icons.opacity_sharp),
                  ),
                  IconButton(
                    onPressed: () {
                      print(dataBox.user.get('dailyWaterNeed'));
                      print(dataBox.user.get('updatingWaterNeed'));
                    },
                    icon: const Icon(Icons.print),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
