import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/model/water_intake_model.dart';
import 'package:h2o_flutter/src/product/repository/water_intake_repository.dart';
import 'package:h2o_flutter/src/view/today/viewmodel/water_intake_viewmodel.dart';
import 'package:h2o_flutter/src/view/today/widget/drink_water_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterCircularIndicator extends ConsumerStatefulWidget {
  const WaterCircularIndicator({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => WaterCircularIndicatorState();
}

class WaterCircularIndicatorState
    extends ConsumerState<WaterCircularIndicator> {
  final dataBox = getIt.get<IHiveManager>();
  final WaterIntakeRepository waterIntakeRepository = WaterIntakeRepository();
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final constantWaterNeedValue =
        ref.watch(waterIntakeProvider).dataBox.user.get('dailyWaterNeed');
    final updatingWaterNeedValue =
        ref.watch(waterIntakeProvider).dataBox.user.get('updatingWaterNeed');
    final double progressPercent =
        (updatingWaterNeedValue / constantWaterNeedValue).clamp(0.0, 1.0);
    return Column(
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
          height: 18,
        ),
        DrinkWaterButton(
          onTap: () {
            setState(() {
              WaterIntakeViewModel(dataBox).decreaseWaterIntakeBy300Ml();
              waterIntakeRepository.addWaterIntakeRecord(
                  dataBox.user.get('userId'),
                  WaterIntakeModel(
                      recordId: 1, dateTime: DateTime.now(), amount: 300));
            });
          },
          text: Strings.kHome300ml,
        ),
      ],
    );
  }
}
