import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/init_locator.dart';
import 'package:h2o_flutter/src/view/settings/view/settings_view.dart';

mixin ISettingsState on ConsumerState<SettingsView> {
  final dataBox = getIt.get<IHiveManager>();

  dynamic getPersonalInformation(int step) {
    dynamic result;
    switch (step) {
      case 1:
        final gender = dataBox.user.get('gender');
        if (gender != null && gender is String) {
          result = capitalizeFirstLetter(gender);
        }
        break;

      case 2:
        result = dataBox.user.get('weight').toString();
        break;

      case 3:
        final exercise = dataBox.user.get('trainingHardness');
        if (exercise != null && exercise is String) {
          result = capitalizeFirstLetter(exercise);
        }
        break;
      case 4:
        final wakeUpHour = dataBox.user.get('wakeUpHour').toString();
        result = wakeUpHour;
        break;
      case 5:
        final wakeUpMinute = dataBox.user.get('wakeUpMinute').toString();
        result = wakeUpMinute;
        break;
      case 6:
        final bedTimeHour = dataBox.user.get('bedHour').toString();
        result = bedTimeHour;
        break;
      case 7:
        final bedTimeMinute = dataBox.user.get('bedMinute').toString();
        result = bedTimeMinute;
        break;
    }

    return result;
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
