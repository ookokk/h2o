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

class TodayView extends ConsumerWidget {
  TodayView({
    Key? key,
  }) : super(key: key);
  final double progressPercent = 0.55;
  final dataBox = getIt.get<IHiveManager>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
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
                  "${dataBox.user.get('dailyWaterNeed').toString()} ${Strings.kHomeMl}",
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
                        WaterIntakeViewModel(dataBox)
                            .decreaseWaterIntakeBy300Ml();
                      },
                      text: Strings.kHome300ml,
                    ),
                    IconButton(
                        onPressed: () {
                          print(dataBox.user.get('dailyWaterNeed'));
                          print(dataBox.user.get('updatingWaterNeed'));
                        },
                        icon: Icon(Icons.print)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
