import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/init_locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/calculate/calculate_daily_water_intake.dart';
import 'package:h2o_flutter/src/view/get_started/widget/get_started_button.dart';
import 'package:h2o_flutter/src/view/register/view_model/first_tab_view_model.dart';
import 'package:h2o_flutter/src/view/register/view_model/fourth_tab_view_model.dart';
import 'package:h2o_flutter/src/view/register/view_model/second_tab_view_model.dart';
import 'package:h2o_flutter/src/view/register/view_model/third_tab_view_model.dart';
import 'package:uuid/uuid.dart';

class AlmostDoneButton extends ConsumerWidget {
  const AlmostDoneButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final isChecked = ref.watch(isCheckedProvider);
    return GetStartedButton(
        onTap: () {
          final dataBox = getIt.get<IHiveManager>();
          //1
          final newGender = isChecked ? 'male' : 'female';
          dataBox.user.put('gender', newGender);
          //2
          final currentWeight = ref.watch(weightProvider.notifier).state;
          dataBox.user.put('weight', currentWeight);
          //3
          final selectedContainerIndex = ref.read(thirdTabViewModelProvider);
          final selectedHardness = ThirdTabViewModel()
              .indexToTrainingHardness(selectedContainerIndex);
          dataBox.user.put('trainingHardness', selectedHardness);
          //4
          final selectedWakeUpTime = ref.read(wakeUpTimeProvider);
          dataBox.user.put('wakeUpHour', selectedWakeUpTime?.hour);
          dataBox.user.put('wakeUpMinute', selectedWakeUpTime?.minute);
          //5
          final selectedBedTime = ref.read(bedTimeProvider);
          dataBox.user.put('bedHour', selectedBedTime?.hour);
          dataBox.user.put('bedMinute', selectedBedTime?.minute);
          //calculate
          dataBox.user.put('isRegistered', true);
          final currentIntake = CalculateDailyWaterIntake()
              .calculateWaterIntake(selectedHardness, currentWeight, newGender);
          dataBox.user.put('dailyWaterNeed', currentIntake);
          dataBox.user.put('updatingWaterNeed', 0);
          //userid
          const Uuid uuid = Uuid();
          dataBox.user.put('userId', uuid.v4());

          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        text: Strings.kAlmostComplete,
        color: currentTheme.canvasColor,
        borderColor: currentTheme.indicatorColor);
  }
}
